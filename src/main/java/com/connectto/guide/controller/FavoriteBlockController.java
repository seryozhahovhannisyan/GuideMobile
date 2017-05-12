package com.connectto.guide.controller;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.exception.PermissionDeniedException;
import com.connectto.guide.common.util.StringHelper;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.FavoriteBlock;
import com.connectto.guide.entity.User;
import com.connectto.guide.service.FavoriteBlockService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class FavoriteBlockController {

    private static final Logger logger = Logger.getLogger(FavoriteBlockController.class.getSimpleName());

    @Autowired
    private FavoriteBlockService service;

    private ResponseDto responseDto = new ResponseDto();

    private String blockDefaultPassword = "1111";


    @RequestMapping(path = "/m-favorite-channel.htm", method = RequestMethod.GET)
    public ResponseDto favorite(@RequestParam("channel_id") String channel_id) {
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setFavoriteDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setFavorite(1);

        try {

            Long channelId = Long.parseLong(channel_id);
            favoriteBlock.setChannelId(channelId);
            service.favorite(favoriteBlock);
            responseDto.setActionmessage("Channel made as favorite successfully");
            responseDto.setStatus(ResponseStatus.SUCCESS);

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }


    @RequestMapping(path = "/m-unfavorite-channel.htm", method = RequestMethod.GET)
    public ResponseDto unFavorite(@RequestParam("channel_id") String channel_id) {
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setFavoriteDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setFavorite(0);

        try {

            Long channelId = Long.parseLong(channel_id);
            favoriteBlock.setChannelId(channelId);

            service.unFavorite(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.setActionmessage("Channel unmade as favorite successfully");

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }


    @RequestMapping(path = "/m-block-channel.htm", method = RequestMethod.GET)
    public ResponseDto block(@RequestParam("channel_id") String channel_id,
                             @RequestParam("blockPassword") String blockPassword) {

        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        if (StringHelper.isBlank(blockPassword)) {
            blockPassword = blockDefaultPassword;
        }
        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setBlockDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setBlock(1);
        favoriteBlock.setBlockPassword(blockPassword);

        try {

            Long channelId = Long.parseLong(channel_id);
            favoriteBlock.setChannelId(channelId);

            service.block(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.setActionmessage("Channel blocked successfully");

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }

    @RequestMapping(path = "/m-unblock-channel.htm", method = RequestMethod.GET)
    public ResponseDto unBlock(@RequestParam("channel_id") String channel_id,
                               @RequestParam("blockPassword") String blockPassword) {

        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();
        long userId = user.getId();

        if (StringHelper.isBlank(blockPassword)) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            responseDto.setActionerror("empty blockPassword");
            return responseDto;
        }

        Date currentDate = new Date(System.currentTimeMillis());

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setBlockDateTime(currentDate);
        favoriteBlock.setPartitionId(partitionId);
        favoriteBlock.setUserId(userId);
        favoriteBlock.setBlock(0);
        favoriteBlock.setBlockPassword(blockPassword);

        try {

            Long channelId = Long.parseLong(channel_id);
            favoriteBlock.setChannelId(channelId);

            service.unblock(favoriteBlock);
            responseDto.setActionmessage("Channel unblocked successfully");
            responseDto.setStatus(ResponseStatus.SUCCESS);

        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
        } catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        }

        return responseDto;
    }
}
