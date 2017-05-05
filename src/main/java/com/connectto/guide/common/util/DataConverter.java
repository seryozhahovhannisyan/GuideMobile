package com.connectto.guide.common.util;

import com.connectto.guide.common.exception.DataParseException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by Serozh on 5/3/2017.
 */
public class DataConverter {

    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

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

    public static String join(Collection collection, String delim) {

        StringBuilder sb = new StringBuilder();

        String loopDelim = "";

        for(Object s : collection) {

            sb.append(loopDelim);
            sb.append(s.toString());

            loopDelim = delim;
        }

        return sb.toString();
    }

    public static String join(Object[] array, String delim) {

        StringBuilder sb = new StringBuilder();

        String loopDelim = "";

        for(Object s : array) {

            sb.append(loopDelim);
            sb.append(s.toString());

            loopDelim = delim;
        }

        return sb.toString();
    }

    public static Date convertToDate(String stringDate) throws DataParseException{
        try {

            return dateFormat.parse(stringDate);
        } catch (ParseException e) {
            throw new DataParseException(e);
        }
    }

}


