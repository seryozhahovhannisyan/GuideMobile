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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
public class FavoriteBlockController {

    private static final Logger logger = Logger.getLogger(FavoriteBlockController.class.getSimpleName());

    @Autowired
    private FavoriteBlockService service;

    @Autowired
    private ResponseDto responseDto = new ResponseDto();

    @Value("${guide.blockPassword}")
    private String blockDefaultPassword;


    @RequestMapping(path = "/favorite/{channelId}", method = RequestMethod.POST)
    public ResponseDto favorite(@PathVariable(value = "channelId") String channelId) {

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setActionerror("Invalid sessionId");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        if (StringHelper.isBlank(channelId)) {
            responseDto.setActionerror("empty channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        long userId = user.getId();

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setUserId(userId);
        favoriteBlock.setFavorite(1);

        try {

            favoriteBlock.setChannelId(Long.parseLong(channelId));
            service.favorite(favoriteBlock);
            responseDto.setActionmessage("Channel made as favorite");
            responseDto.setStatus(ResponseStatus.SUCCESS);

        }  catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setActionerror(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
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


    @RequestMapping(path = "/unfavorite/{channelId}", method = RequestMethod.POST)
    public ResponseDto unFavorite(@PathVariable(value = "channelId") String channelId) {

        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setActionerror("Invalid sessionId");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        if (StringHelper.isBlank(channelId)) {
            responseDto.setActionerror("empty channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        long userId = user.getId();

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setUserId(userId);
        favoriteBlock.setFavorite(0);

        try {

            favoriteBlock.setChannelId(Long.parseLong(channelId));

            service.unFavorite(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.setActionmessage("Channel unmade as favorite");

        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setActionerror(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
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


    @RequestMapping(path = "/block/{channelId}", method = RequestMethod.POST)
    public ResponseDto block(@PathVariable(value = "channelId") String channelId,
                             @RequestBody  String blockPassword) {

        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        long userId = user.getId();

        if (StringHelper.isBlank(blockPassword)) {
            blockPassword = blockDefaultPassword;
        }

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setUserId(userId);
        favoriteBlock.setBlock(1);
        favoriteBlock.setBlockPassword(blockPassword);

        try {

            favoriteBlock.setChannelId(Long.parseLong(channelId));

            service.block(favoriteBlock);
            responseDto.setStatus(ResponseStatus.SUCCESS);
            responseDto.setActionmessage("Channel blocked successfully");

        }  catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.setActionerror(e.getMessage());
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setActionerror(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
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

    @RequestMapping(path = "/unblock/{channelId}", method = RequestMethod.POST)
    public ResponseDto unblock(@PathVariable(value = "channelId") String channelId,
                             @RequestBody  String blockPassword) {

        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        long userId = user.getId();

        if (StringHelper.isBlank(blockPassword)) {
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            responseDto.setActionerror("empty blockPassword");
            return responseDto;
        }

        FavoriteBlock favoriteBlock = new FavoriteBlock();
        favoriteBlock.setUserId(userId);
        favoriteBlock.setBlock(0);
        favoriteBlock.setBlockPassword(blockPassword);

        try {

            favoriteBlock.setChannelId(Long.parseLong(channelId));

            service.unblock(favoriteBlock);
            responseDto.setActionmessage("Channel unblocked successfully");
            responseDto.setStatus(ResponseStatus.SUCCESS);

        }  catch (PermissionDeniedException e) {
            logger.error(e);
            responseDto.setActionerror(e.getMessage());
            responseDto.setStatus(ResponseStatus.PERMISSION_DENIED);
        } catch (DataNotFoundException e) {
            logger.error(e);
            responseDto.setActionerror(e.getMessage());
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
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
