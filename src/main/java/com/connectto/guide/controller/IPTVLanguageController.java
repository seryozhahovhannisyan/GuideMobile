
package com.connectto.guide.controller;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.IPTVLanguage;
import com.connectto.guide.service.IPTVLanguageService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class IPTVLanguageController {

    private static final Logger logger = Logger.getLogger(IPTVLanguageController.class.getSimpleName());

    @Autowired
    private ResponseDto responseDto;

    @Autowired
    private IPTVLanguageService service;

    @RequestMapping(path = "/m-iptv-languages", method = RequestMethod.GET)
    public ResponseDto mobileIPTVLanguages(Device device) {

        responseDto.cleanMessages();
        //check device permission
       /* if (device.isNormal()) {
        } else if (device.isTablet()) {
        } else if (device.isMobile()) {
        }*/

        int partitionId = ServiceHelper.getAuthenticatedUser().getPartitionId();

        if (partitionId == 0) {
            responseDto.setActionerror("Invalid sessionId");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        try {
            List<IPTVLanguage> iptvLanguages = service.getIPTVLanguages(partitionId);
            responseDto.addResponse("iptvLanguages",iptvLanguages);
            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setActionerror("Internal Error Occurred");
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }
}
