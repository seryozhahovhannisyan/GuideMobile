package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.XmlTv;
import com.connectto.guide.repository.XmlFilesUpdateRepository;
import com.connectto.guide.repository.XmlTvRepository;
import com.connectto.guide.service.XmlTvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional(readOnly = true)
public class XmlTvServiceImpl implements XmlTvService {

    @Autowired
    private XmlTvRepository repository;

    @Autowired
    private XmlFilesUpdateRepository xmlFilesUpdateDao;

    @Override
    public XmlTv getBy (long id) throws InternalErrorException, DataNotFoundException {
        try {
            XmlTv xmlTv = repository.findOne(id);
            if (xmlTv == null) {
                throw new DataNotFoundException("Could not found xmlTv by id; id = " + xmlTv);
            }
            return xmlTv;
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<XmlTv> getBy(Long xmltvChannelId, Date startTime, Date stopTime) throws InternalErrorException {

        List<XmlTv> xmlTvs = null;

        try {

            startTime = startTime == null ? startWeek() : startTime;
            stopTime = stopTime == null ? endWeek() : stopTime;

            xmlTvs = repository.xmltvChannelId(xmltvChannelId, startTime, stopTime);

            return xmlTvs;
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    private Date startWeek() {
        // set the date
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date(System.currentTimeMillis()));
        cal.add(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek() - cal.get(Calendar.DAY_OF_WEEK));
        return cal.getTime();
    }

    private Date endWeek() {
        // set the date
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date(System.currentTimeMillis()));
        cal.add(Calendar.DAY_OF_YEAR, 6);
        return cal.getTime();
    }

}