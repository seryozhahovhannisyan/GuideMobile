package com.connectto.guide.controller;

import com.connectto.guide.common.exception.DataParseException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.CollectionHelper;
import com.connectto.guide.common.util.DataConverter;
import com.connectto.guide.common.util.StringHelper;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.Channel;
import com.connectto.guide.entity.User;
import com.connectto.guide.service.ChannelService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ChannelMobileAction {

    private static final Logger logger = Logger.getLogger(ChannelMobileAction.class.getSimpleName());

    @Autowired
    private ChannelService channelService;

    @Autowired
    private ResponseDto responseDto;

    public static final String channelLogoPath = "https://www.connecttotv.com/staticData/iptv/channalImages/";

    //actions
    public static final String channel_existence = "/m-channel-exist-count.htm";
    public static final String new_channel_ides = "/m-channel-ides.htm";
    public static final String load_channel_schedule = "/m-load-channel-schedule.htm";
    public static final String load_primary_channels = "/m-load-primary-channel.htm";
    /*untested*/

    @RequestMapping(path = channel_existence, method = RequestMethod.GET)
    public ResponseDto mobileChannelExistCount(@RequestParam("existsChannelIdes") String existsChannelIdes,
                                               @RequestParam("channelUpdateDate") String channelUpdateDate) {

        responseDto.cleanMessages();
        User authenticatedUser = ServiceHelper.getAuthenticatedUser();
        if (authenticatedUser == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = authenticatedUser.getPartitionId();
        long userId = authenticatedUser.getId();

        if (partitionId == 0) {
            return responseDto;
        }

        try {

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("partition_id", partitionId);
            params.put("user_id", userId);

            if (StringHelper.isNotBlank(existsChannelIdes)) {
                List<Long> existsIdes = DataConverter.convertIdesToLong(existsChannelIdes);
                params.put("existsChannelIdes", existsIdes);
            }

            if (StringHelper.isNotBlank(channelUpdateDate)) {
                params.put("channelUpdateDate", DataConverter.convertToDate(channelUpdateDate));
            }

            Long newChannelsCount = channelService.getCountByParams(params);
            responseDto.addResponse("newChannelsCount", newChannelsCount);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataParseException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming existsChannelIdes");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }

    @RequestMapping(path = new_channel_ides, method = RequestMethod.GET)
    public ResponseDto mobileChannelIdes(@RequestParam("existsChannelIdes") String existsChannelIdes,
                                         @RequestParam("channelUpdateDate") String channelUpdateDate) {

        responseDto.cleanMessages();

        User user = ServiceHelper.getAuthenticatedUser();
        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        if (partitionId == 0) {
            return responseDto;
        }

        try {

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("partition_id", partitionId);
            params.put("user_id", userId);
            if (StringHelper.isNotBlank(existsChannelIdes)) {
                List<Long> existsIdes = DataConverter.convertIdesToLong(existsChannelIdes);
                params.put("existsChannelIdes", existsIdes);
            }
            if (StringHelper.isNotBlank(channelUpdateDate)) {
                params.put("channelUpdateDate", DataConverter.convertToDate(channelUpdateDate));
            }

            List<Long> newChannelIdes = channelService.getIdesByParams(params);
            responseDto.addResponse("newChannelIdes", newChannelIdes);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataParseException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming existsChannelIdes");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }

    @RequestMapping(path = load_primary_channels, method = RequestMethod.GET)
    public ResponseDto mobileLoadPrimaryChannel(@RequestParam("channel_id") String channel_id) {

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();
        if (user == null) {
            return responseDto;
        }

        if (StringHelper.isBlank(channel_id)) {
            responseDto.setActionerror("Incorrect incoming channel_id");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partition_id", partitionId);
        params.put("user_id", userId);

        params.put("channelLogoPath", channelLogoPath);

        try {

            params.put("channelId", Long.parseLong(channel_id));
            Channel channel = channelService.getByChannelId(params);
            responseDto.addResponse("channel", channel);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channel_id");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }

    @RequestMapping(path = load_channel_schedule, method = RequestMethod.GET)
    public ResponseDto mobileLoadChannelSchedules(@RequestParam("xml_channel_id") String xml_channel_id,
                                                  @RequestParam("periodStart") String periodStart,
                                                  @RequestParam("periodEnd") String periodEnd) {

        responseDto.cleanMessages();
        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            return responseDto;
        }

        if (StringHelper.isBlank(xml_channel_id)) {
            responseDto.setActionerror("Incorrect incoming xml_channel_id");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }


        Map<String, Object> params = new HashMap<String, Object>();


        try {

            params.put("xml_channel_id", Long.parseLong(xml_channel_id));
            if(StringHelper.isNotBlank(periodStart)){
                params.put("periodStart", DataConverter.convertToDate(periodStart));//2012
            }

            if(StringHelper.isNotBlank(periodEnd)){
                params.put("periodEnd", DataConverter.convertToDate(periodEnd));//
            }

            /*int paginationCount = 10;
            if (currentPage != null) {
                if (currentPage < 2) {
                    currentPage = 1;
                }
                params.put("limit", paginationCount);
                params.put("offset", (currentPage - 1) * paginationCount);
            }

            params.put("partition_id", partitionId);

            xmlTvs = xmlTvService.getByParamsForMobile(params);

            if (currentPage != null) {
                //load pagination
                if (CollectionHelper.isEmpty(xmlTvs) || xmlTvs.size() < paginationCount) {
                    isLast = 1;
                } else {
                    currentPage++;
                }
            }*/

            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (Exception e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }
}
