package com.connectto.guide.controller;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.exception.PermissionDeniedException;
import com.connectto.guide.common.util.CollectionHelper;
import com.connectto.guide.common.util.StringHelper;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.*;
import com.connectto.guide.service.ChannelManager;
import com.connectto.guide.service.FavoriteBlockManager;
import com.connectto.guide.service.XmlTvManager;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by htdev001 on 2/11/15.
 */
public class ChannelMobileAction {

    private static final Logger logger = Logger.getLogger(ChannelMobileAction.class.getSimpleName());
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    private ChannelManager channelManager;
    private XmlTvManager xmlTvManager;
    private FavoriteBlockManager favoriteBlockManager;
    private ResponseDto responseDto;
    //Getter
    private List<Channel> channels;
    private Channel channel;

    //private List<ChannelDto> channelDtos;
    private List<XmlTv> xmlTvs;
    private XmlTv schedule;
    private Integer newChannelsCount;
    private List<Integer> newChannelIdes;
    //Setter
    private Integer scheduleId;
    private Integer channel_id;
    private Integer xml_channel_id;
    private Date schedule_updated_date;
    private Date scheduleLastModDate;
    private Date channelUpdateDate;
    private List<Integer> existsChannelIdes;
    //
    private List<ChannelCategory> channelCategories;
    private List<IPTVLanguage> iptvLanguages;
    //pagination
    private Integer currentPage;
    private int isLast;
    //
    private String sessionId;
    private Date periodStart;
    private Date periodEnd;
    //
    private String blockPassword;
    //
    private String SUCCESS = "S";
    public static final int DB_STATICS_FALSE = 0;
    public static final int DB_STATICS_TRUE = 1;

    private static int paginationGuideCount = 1;
    public static final String channelLogoPath = "https://www.connecttotv.com/staticData/iptv/channalImages/";
    private String blockDefaultPassword = "1111";

    //actions
    public static final String channel_existence  = "/m-channel-exist-count.htm";
    public static final String new_channel_ides = "/m-channel-ides.htm";
    public static final String load_channel_schedule = "/m-load-channel-schedule.htm";
    public static final String load_primary_channels  = "/m-load-primary-channel.htm";
    public static final String load_CategorisUrl = "/m-channel-categories.htm";
    public static final String load_LanguagesUrl = "/m-iptv-languages.htm";
    public static final String record_url = "/record_fromdvr.htm";
    public static final String recordURL = "/record_fromdvr_mobile";

    public static final String favoritUrl = "/m-favorite-channel.htm";
    public static final String unfavoritUrl = "/m-unfavorite-channel.htm";
    public static final String blockUrl = "/m-block-channel.htm";
    public static final String unblockUrl = "/m-unblock-channel.htm";
    /*untested*/

    @RequestMapping(path = channel_existence, method = RequestMethod.GET)
    public ResponseDto mobileChannelExistCount() {

        logger.info("mobileNewChannelExistence");

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
            params.put("deleted", DB_STATICS_FALSE);
            params.put("partition_id", partitionId);
            params.put("userId", userId);
            if (!CollectionHelper.isEmpty(existsChannelIdes)) {
                params.put("existsChannelIdes", existsChannelIdes);
            }
            if (channelUpdateDate != null) {
                params.put("channelUpdateDate", channelUpdateDate);
            }


            newChannelsCount = channelManager.getNewCountByParams(params);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }

    @RequestMapping(path = new_channel_ides, method = RequestMethod.GET)
    public ResponseDto mobileChannelIdes() {

        logger.info("mobileNewChannelIdes");

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
            params.put("deleted", DB_STATICS_FALSE);
            params.put("partition_id", partitionId);
            params.put("userId", userId);
            if (!CollectionHelper.isEmpty(existsChannelIdes)) {
                params.put("existsChannelIdes", existsChannelIdes);
            }
            if (channelUpdateDate != null) {
                params.put("channelUpdateDate", channelUpdateDate);
            }

            newChannelIdes = channelManager.getNewIdesByParams(params);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }

    @RequestMapping(path = load_primary_channels, method = RequestMethod.GET)
    public ResponseDto mobileLoadPrimaryChannel() {

        logger.info("mobileLoadPrimaryChannel");

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();


        if (user == null) {
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("deleted", DB_STATICS_FALSE);
        params.put("partition_id", partitionId);
        params.put("userId", userId);
        params.put("channelId", channel_id);
        params.put("channelLogoPath", channelLogoPath);

        try {

            channel = channelManager.getByChannelIdForMobile(params);

            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }

    @RequestMapping(path = load_channel_schedule, method = RequestMethod.GET)
    public ResponseDto mobileLoadChannelSchedules() {

        logger.info("mobileLoadChannelSchedules");

        responseDto.cleanMessages();
        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            return responseDto;
        }

        if (xml_channel_id == null || xml_channel_id == 0) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }


        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xml_channel_id", xml_channel_id);
        params.put("periodStart", periodStart);//2012
        params.put("periodEnd", periodEnd);
        params.put("deleted", DB_STATICS_FALSE);

        int paginationCount = 10;
        if (currentPage != null) {
            if (currentPage < 2) {
                currentPage = 1;
            }
            params.put("limit", paginationCount);
            params.put("offset", (currentPage - 1) * paginationCount);
        }

        //load pagination
        //int paginationCount = Initializer.getPaginationGuideCount();
        //params.put("limit", paginationCount);
        //params.put("offset", (currentPage - 1) * paginationCount);

        try {

            params.put("partition_id", partitionId);

            xmlTvs = xmlTvManager.getByParamsForMobile(params);

            if (currentPage != null) {
                //load pagination
                if (CollectionHelper.isEmpty(xmlTvs) || xmlTvs.size() < paginationCount) {
                    isLast = 1;
                } else {
                    currentPage++;
                }
            }

            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (Exception e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }

    public String mobileLoadScheduleById() {

        logger.info("mobileLoadScheduleById");

        responseDto.cleanMessages();
        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            return SUCCESS;
        }

        if (scheduleId == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return SUCCESS;
        }

        try {
            schedule = xmlTvManager.getById(scheduleId);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return SUCCESS;
    }

    @RequestMapping(path = load_CategorisUrl, method = RequestMethod.GET)
    public ResponseDto mobileChannelCategories() {
        logger.info("mobileChannelCategories");
        responseDto.cleanMessages();
        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            responseDto.addMessage("Invalid sessionId ");
            return responseDto;
        }

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", partitionId);

        try {
            channelCategories = channelManager.getIptvChannelCategories(params);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }

    @RequestMapping(path = load_LanguagesUrl, method = RequestMethod.GET)
    public ResponseDto mobileIPTVLanguages() {
        logger.info("mobileChannelCategories");
        responseDto.cleanMessages();
        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            responseDto.addMessage("Invalid sessionId ");
            return responseDto;
        }

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", partitionId);

        try {
            iptvLanguages = channelManager.getIPTVLanguages(params);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }


    @RequestMapping(path = favoritUrl, method = RequestMethod.GET)
    public ResponseDto favorite() {

        logger.info("favorite");

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();
        ;

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();
        if (channel_id == null || channel_id < 1) {
            logger.error("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();

        favoriteBlock.setChannelId(channel_id);

        favoriteBlock.setFavoriteDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setFavorite(1);

        try {

            favoriteBlockManager.favorite(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.addMessage("Channel made as favorite successfully");

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        }

        return responseDto;
    }


    @RequestMapping(path = unfavoritUrl, method = RequestMethod.GET)
    public ResponseDto unFavorite() {

        logger.info("unFavorite");

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();
        if (channel_id == null || channel_id < 1) {
            logger.error("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();

        favoriteBlock.setChannelId(channel_id);

        favoriteBlock.setFavoriteDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setFavorite(0);

        try {

            favoriteBlockManager.unFavorite(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.addMessage("Channel unmade as favorite successfully");

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        }

        return responseDto;
    }


    @RequestMapping(path = blockUrl, method = RequestMethod.GET)
    public ResponseDto block() {

        logger.info("block");

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();
        if (channel_id == null || channel_id < 1) {
            logger.error("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        if (StringHelper.isBlank(blockPassword)) {
            blockPassword = blockDefaultPassword;
        }


        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();

        favoriteBlock.setChannelId(channel_id);
        favoriteBlock.setBlockDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setBlock(1);
        favoriteBlock.setBlockPassword(blockPassword);

        try {

            favoriteBlockManager.block(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.addMessage("Channel blocked successfully");

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        }

        return responseDto;
    }

    @RequestMapping(path = unblockUrl, method = RequestMethod.GET)
    public ResponseDto unBlock() {

        logger.info("unBlock");

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();
        if (channel_id == null || channel_id < 1) {
            logger.error("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        if (StringHelper.isBlank(blockPassword)) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            responseDto.addMessage("empty blockPassword");
            return responseDto;
        }

        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setChannelId(channel_id);
        favoriteBlock.setBlockDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setBlock(0);
        favoriteBlock.setBlockPassword(blockPassword);

        try {

            favoriteBlockManager.unblock(favoriteBlock);
            responseDto.addMessage("Channel unblocked successfully");
            responseDto.setStatus(ResponseStatus.SUCCESS);

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.addMessage(e.getMessage());
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        }

        return responseDto;
    }
}
