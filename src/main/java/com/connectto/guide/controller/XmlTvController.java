package com.connectto.guide.controller;

import com.connectto.guide.common.exception.DataParseException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.DataConverter;
import com.connectto.guide.common.util.StringHelper;
import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.controller.dto.ResponseStatus;
import com.connectto.guide.entity.User;
import com.connectto.guide.entity.XmlTv;
import com.connectto.guide.service.XmlTvService;
import com.connectto.guide.service.util.ServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class XmlTvController {

    private static final Logger logger = Logger.getLogger(XmlTvController.class.getSimpleName());

    @Autowired
    private XmlTvService xmlTvService;

    @Autowired
    private ResponseDto responseDto;

    @RequestMapping(path = "/schedules/{channelId}", method = RequestMethod.GET)
    public ResponseDto schedules(@PathVariable(value = "channelId") String channelId,
                                 @RequestParam(required = false, name = "periodStart") String periodStart,
                                 @RequestParam(required = false, name = "periodEnd") String periodEnd) {

        logger.info("channelId " + channelId);
        responseDto.cleanMessages();
        User user = ServiceHelper.getAuthenticatedUser();

        if (user == null || user.getPartitionId() == 0) {
            responseDto.setActionerror("No authorized user found");
            responseDto.setStatus(ResponseStatus.RESOURCE_NOT_FOUND);
            return responseDto;
        }

        if (StringHelper.isBlank(channelId)) {
            responseDto.setActionerror("Empty incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
            return responseDto;
        }

        int partitionId = user.getPartitionId();

        Map<String, Object> params = new HashMap<String, Object>();

        try {

            Date startTime = null;
            Date stopTime = null;

            if (StringHelper.isNotBlank(periodStart)) {
                startTime = DataConverter.convertToDate(periodStart);//2012
            }

            if (StringHelper.isNotBlank(periodEnd)) {
                stopTime = DataConverter.convertToDate(periodEnd);//
            }

            params.put("partitionId", partitionId);

            List<XmlTv> xmlTvs = xmlTvService.getBy(Long.parseLong(channelId), startTime, stopTime);
            responseDto.addResponse("xmlTvs", xmlTvs);

            responseDto.setStatus(ResponseStatus.SUCCESS);
        } catch (NumberFormatException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming channelId");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        } catch (DataParseException e) {
            logger.error(e);
            responseDto.setActionerror("Incorrect incoming period start or end");
            responseDto.setStatus(ResponseStatus.INVALID_PARAMETER);
        } catch (InternalErrorException e) {
            logger.error(e);
            responseDto.setActionerror("Internal Error Occurred");
            responseDto.setStatus(ResponseStatus.INTERNAL_ERROR);
        }

        return responseDto;
    }
}
