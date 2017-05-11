package com.connectto.guide.controller;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.ChannelCategory;
import com.connectto.guide.service.CategoryService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class CategoryController {

    private static final Logger logger = Logger.getLogger(CategoryController.class.getSimpleName());

    private ResponseDto responseDto = new ResponseDto();

    @Autowired
    private CategoryService service;

    @RequestMapping(path = "m-channel-categories.htm", method = RequestMethod.GET)
    public ResponseDto mobileChannelCategories() {

        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            responseDto.addFieldError("sessionId", "Invalid sessionId");
            return responseDto;
        }

        try {
            List<ChannelCategory> channelCategories = service.getIptvChannelCategories(partitionId);
            responseDto.addResponse("channelCategories",channelCategories);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }
}
