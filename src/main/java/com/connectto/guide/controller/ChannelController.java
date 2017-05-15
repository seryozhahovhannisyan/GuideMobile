package com.connectto.guide.controller;

import com.connectto.guide.common.exception.DataParseException;
import com.connectto.guide.common.exception.InternalErrorException;
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
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ChannelController {

    private static final Logger logger = Logger.getLogger(ChannelController.class.getSimpleName());

    @Autowired
    private ChannelService channelService;

    @Autowired
    private ResponseDto responseDto ;

    /*untested*/

    @RequestMapping(path = "/channel-count", method = RequestMethod.GET)
    public ResponseDto channelCount(@RequestParam(required = false , name = "existsChannelIdes") String existsChannelIdes,
                                    @RequestParam(required = false , name = "channelUpdateDate") String channelUpdateDate) {
        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null || user.getPartitionId() == 0) {
            responseDto.setActionerror("No authorized user found");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        long userId = user.getId();
        int partitionId = user.getPartitionId();

        try {

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("partitionId", partitionId);
            params.put("userId", userId);

            if (StringHelper.isNotBlank(existsChannelIdes)) {
                List<Long> existsIdes = DataConverter.convertIdesToLong(existsChannelIdes);
                params.put("existsChannelIdes", existsIdes);
            }

            if (StringHelper.isNotBlank(channelUpdateDate)) {
                DataConverter.convertToDate(channelUpdateDate);
                params.put("channelUpdateDate", channelUpdateDate);
            }

            Long newChannelsCount = channelService.getCountByParams(params);
            responseDto.addResponse("channelCount", newChannelsCount);
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

    @RequestMapping(path = "/channel-ides", method = RequestMethod.GET)
    public ResponseDto mobileChannelIdes(@RequestParam(required = false , name = "existsChannelIdes") String existsChannelIdes,
                                         @RequestParam(required = false , name = "channelUpdateDate") String channelUpdateDate) {

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null || user.getPartitionId() == 0) {
            responseDto.setActionerror("No authorized user found");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        try {

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("partitionId", partitionId);
            params.put("userId", userId);
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

    @RequestMapping(path = "/channel/{channelId}", method = RequestMethod.GET)
    public ResponseDto channel(@PathVariable(value = "channelId") String channelId) {

        responseDto.cleanMessages();
        String channelLogoPath = "https://www.connecttotv.com/staticData/iptv/channalImages/";
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setActionerror("No authorized user found");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        if (StringHelper.isBlank(channelId)) {
            responseDto.setActionerror("Empty incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        long userId = user.getId();

        try {
            Long cId = Long.parseLong(channelId);
            Channel channel = channelService.getByChannelId(cId, userId);
            String logo = String.format("%s%s", channelLogoPath, channel.getLogo());
            channel.setLogo(logo);
            responseDto.addResponse("channel", channel);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setActionerror("Internal Error Occurred");
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }

}
