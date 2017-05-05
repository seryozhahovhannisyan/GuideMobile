package com.connectto.guide.common.util;

import com.connectto.guide.common.exception.InternalErrorException;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by Arthur on 7/17/2016.
 */
public class QueryUtil {

    public static String buildQuery(String fields, String tableName, List<QueryParam> queryParams, Map tail) throws InternalErrorException {
        StringBuilder builder = new StringBuilder();
        buildResult(fields, tableName, builder);
        buildSampleQuery(queryParams, builder);
        limitCredentials(tail, builder);
        return builder.toString();
    }

    public static String buildCountQuery(String id, String tableName, List<QueryParam> queryParams) throws InternalErrorException {
        StringBuilder builder = new StringBuilder();
        buildResultCount(id, tableName, builder);
        buildSampleQuery(queryParams, builder);
        return builder.toString();
    }

    private static void buildResult(String fields, String tableName, StringBuilder builder) throws InternalErrorException {
        builder.append(String.format("SELECT %s FROM  %s ", fields, tableName));
    }

    private static void buildResultCount(String id, String tableName, StringBuilder builder) throws InternalErrorException {
        builder.append(String.format("SELECT count(%s) FROM  %s ", id, tableName));
    }

    private static void buildSampleQuery(List<QueryParam> queryParams, StringBuilder builder) throws InternalErrorException {

        if (queryParams.isEmpty()) {
            return;
        }

        StringBuilder where = new StringBuilder(" WHERE ");
        int index = 0;
        for (QueryParam queryParam : queryParams) {

            String field = queryParam.getField();
            if (field.equals(QueryConstant.LIMIT.getValue()) || field.equals(QueryConstant.OFFSET.getValue())) {
                continue;
            }

            where.append(" ").append(field).append(String.format(" " + queryParam.getConstant().getValue() + " ", queryParam.getValue()));
            if (index != queryParams.size() - 1) {
                where.append(" AND ");
            }

            index++;
        }
        builder.append(where);
    }


    private static void limitCredentials(Map queryMap, StringBuilder builder) {

        if(CollectionHelper.isEmpty(queryMap)){
            return;
        }

        Integer limit, offset;
        String asc, desc;
        limit = (Integer) queryMap.get(QueryConstant.LIMIT);
        offset = (Integer) queryMap.get(QueryConstant.OFFSET);
        asc = queryMap.get(QueryConstant.ASC).toString();
        desc = queryMap.get(QueryConstant.DESC).toString();
        if (limit != null) {
            builder.append(QueryConstant.LIMIT.getValue()).append(" ").append(limit);
            if (offset != null) {
                builder.append(QueryConstant.OFFSET.getValue()).append(" ").append(offset);
            }
        }

        if(StringHelper.isNotBlank(asc)){
            builder.append(" ").append(String.format(QueryConstant.ASC.getValue(),asc)) ;
        }

        if(StringHelper.isNotBlank(desc)){
            builder.append(" ").append(String.format(QueryConstant.DESC.getValue(),desc)) ;
        }



    }

    public static void main(String[] args) {
        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", new Integer[]{0, 15}, QueryConstant.CONTAINS));
        queryParams.add(new QueryParam("deleted", 0, QueryConstant.EQUAL));
        try {
            String s = buildQuery("*", "iptv_channel_categories", queryParams, null);
            System.out.println(s);
        } catch (InternalErrorException e) {
            e.printStackTrace();
        }
    }

}
