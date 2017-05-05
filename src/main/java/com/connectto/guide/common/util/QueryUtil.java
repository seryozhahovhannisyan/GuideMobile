package com.connectto.guide.common.util;

import com.connectto.guide.common.exception.InternalErrorException;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Created by Arthur on 7/17/2016.
 */
public class QueryUtil {

    public static String buildQuery(String fields, String tableName, Map queryMap, QueryConstants operator) throws InternalErrorException {
        StringBuilder builder = new StringBuilder();
        buildResult(fields, tableName, builder);
        buildSampleQuery(queryMap, operator, builder);
        limitCredentials(queryMap, builder);
        return builder.toString();
    }

    public static String buildCountQuery(String id, String tableName, Map queryMap, QueryConstants operator) throws InternalErrorException {
        StringBuilder builder = new StringBuilder();
        buildResultCount(id, tableName, builder);
        buildSampleQuery(queryMap, operator, builder);
        return builder.toString();
    }

    private static void buildResult(String fields, String tableName, StringBuilder builder) throws InternalErrorException {
        builder.append(String.format("SELECT %s FROM  %s ", fields, tableName));
    }

    private static void buildResultCount(String id, String tableName, StringBuilder builder) throws InternalErrorException {
        builder.append(String.format("SELECT count(%s) FROM  %s ", id, tableName));
    }

    private static void buildSampleQuery(Map queryMap, QueryConstants operator, StringBuilder builder) throws InternalErrorException {

        if (queryMap.isEmpty()) {
            return;
        }
        StringBuilder where = new StringBuilder(" WHERE ");

        Set<String> keySet = queryMap.keySet();

        Iterator<String> iterator = keySet.iterator();
        int index = 0;
        while (iterator.hasNext()) {
            String key = iterator.next();
            if (key.equals(QueryConstants.LIMIT.getValue()) || key.equals(QueryConstants.OFFSET.getValue())) {
                continue;
            }

            where.append(" ").append(key).append(String.format(" " + operator.getValue() + " ", queryMap.get(key)));
            if (index != keySet.size() - 1) {
                where.append(" AND ");
            }

            index++;
        }
        builder.append(where);
    }


    private static void limitCredentials(Map queryMap, StringBuilder builder) {
        Integer limit, offset;
        limit = (Integer) queryMap.get(QueryConstants.LIMIT.getValue());
        offset = (Integer) queryMap.get(QueryConstants.OFFSET.getValue());
        if (limit != null) {
            builder.append(QueryConstants.LIMIT.getValue()).append(" ").append(limit);
            if (offset != null) {
                builder.append(QueryConstants.OFFSET.getValue()).append(" ").append(offset);
            }
        }
    }

    public static void main(String[] args) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", 1);
        params.put("userId", 4);
        params.put("channelId", 11);

        try {
            String s = buildQuery("*", " favorite ", params, QueryConstants.EQUAL);
            System.out.println(s);
        } catch (InternalErrorException e) {
            e.printStackTrace();
        }
    }

}
