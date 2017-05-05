
package com.connectto.guide.controller;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.*;
import com.connectto.guide.service.ChannelService;
import com.connectto.guide.service.FavoriteBlockService;
import com.connectto.guide.service.IPTVLanguageService;
import com.connectto.guide.service.XmlTvService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IPTVLanguageController {

    private static final Logger logger = Logger.getLogger(IPTVLanguageController.class.getSimpleName());

    @Autowired
    private ResponseDto responseDto;

    @Autowired
    private IPTVLanguageService service;


    @RequestMapping(path = "/m-iptv-languages.htm", method = RequestMethod.GET)
    public ResponseDto mobileIPTVLanguages() {

        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            responseDto.addFieldError("sessionId", "Invalid sessionId");
            return responseDto;
        }

        try {
            List<IPTVLanguage> iptvLanguages = service.getIPTVLanguages(partitionId);
            responseDto.addResponse("iptvLanguages",iptvLanguages);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }
}
