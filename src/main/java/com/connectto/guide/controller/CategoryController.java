package com.connectto.guide.controller;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.ChannelCategory;
import com.connectto.guide.service.CategoryService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CategoryController {

    private static final Logger logger = Logger.getLogger(CategoryController.class.getSimpleName());

    @Autowired
    private ResponseDto responseDto;

    @Autowired
    private CategoryService service;

    @RequestMapping(path = "m-channel-categories", method = RequestMethod.GET)
    public ResponseDto mobileChannelCategories() {

        responseDto.cleanMessages();

        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            responseDto.setActionerror("Invalid sessionId");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        try {
            List<ChannelCategory> channelCategories = service.getIptvChannelCategories(partitionId);
            responseDto.addResponse("channelCategories",channelCategories);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setActionerror("Internal Error Occurred");
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }
}
