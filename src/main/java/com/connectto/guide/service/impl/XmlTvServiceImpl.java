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

import java.util.*;

@Service
@Transactional(readOnly = true)
public class XmlTvServiceImpl implements XmlTvService {

//    @Autowired
//    private IChannelCustomRepository channelDao;

    @Autowired
    private XmlTvRepository xmlTvDao;

    @Autowired
    private XmlFilesUpdateRepository xmlFilesUpdateDao;

    @Override
    public XmlTv getById(long id) throws InternalErrorException, DataNotFoundException {
        try {
            XmlTv xmlTv =xmlTvDao.findOne(id);
            if (xmlTv == null) {
                throw new DataNotFoundException("Could not found xmlTv by id; id = " + xmlTv);
            }
            return xmlTv;
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<XmlTv> getByParamsForMobile(Map<String, Object> params) throws InternalErrorException {

        List<XmlTv> xmlTvs = null;

        try {
            //start
            Integer xml_channel_id = (Integer) params.get("xml_channel_id");
            List<Integer> channelIdes = new ArrayList<Integer>();
            Integer channelId = null;//channelDao.getChannelIdByXMLTVChannelId(xml_channel_id);
            if (channelId != null && channelId > 0) {
                channelIdes.add(channelId);
                params.put("channelIdes", channelIdes);

                Date periodStart = (Date) params.get("periodStart");
                Date periodEnd = (Date) params.get("periodEnd");

                periodStart = periodStart == null ? startWeek() : periodStart;
                periodEnd = periodEnd == null ? endWeek() : periodEnd;

                params.put("periodStart", periodStart);
                params.put("periodEnd", periodEnd);
                //xmlTvs = xmlTvDao.getByParamsMobile(params);
            }

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