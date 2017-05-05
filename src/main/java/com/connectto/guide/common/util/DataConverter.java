package com.connectto.guide.common.util;

import com.connectto.guide.common.exception.DataParseException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Serozh on 5/3/2017.
 */
public class DataConverter {

    public static List<Long> convertIdesToLong(String data) throws DataParseException {
        List<Long> ides = new ArrayList<Long>();
        if (StringHelper.isBlank(data)) {
            throw new DataParseException("Empty list");
        }

        try {
            for (String i : data.split(",")) {
                ides.add(Long.parseLong(i));
            }
            return ides;
        } catch (Exception e) {
            throw new DataParseException(e);
        }

    }

    public static List<Long> convertIdesToLong(List<Object> objects) throws DataParseException {
        List<Long> ides = new ArrayList<Long>();
        if (CollectionHelper.isEmpty(objects)) {
            throw new DataParseException("Empty list");
        }

        try {
            for (Object i : objects) {
                ides.add(Long.parseLong(i.toString()));
            }
            return ides;
        } catch (Exception e) {
            throw new DataParseException(e);
        }

    }

}


