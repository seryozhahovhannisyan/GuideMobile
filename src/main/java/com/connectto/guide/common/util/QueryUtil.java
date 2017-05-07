package com.connectto.guide.common.util;

import com.connectto.guide.common.exception.InternalErrorException;

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

    public static StringBuilder buildIPTVChannel(String expr, Map<String, Object> params) {

        String partitionId = params.get("partitionId").toString();
        StringBuilder queryBuilder = new StringBuilder(String.format("select %s FROM iptv_channels c WHERE c.deleted = 0", expr));
        queryBuilder.append(" and (SELECT id FROM iptv_channel_country_timezone WHERE id = ( SELECT timezone_id FROM iptv_servers WHERE server_id = nvr_server_id ) ) IS NOT NULL")
                .append(String.format(" and (c.partition_id = %s OR c.channel_id IN ( SELECT ac.channel_id FROM iptv_accepted_channels ac  WHERE ac.partition_id = %s) )", partitionId, partitionId));

        if (params.containsKey("existsChannelIdes")) {
            List<Long> existsIdes = (List<Long>) params.get("existsChannelIdes");
            queryBuilder.append(String.format(" and c.channel_id not in (%s)", DataConverter.join(existsIdes, ",")));
        }

        if (params.containsKey("channelUpdateDate")) {
            String channelUpdateDate = (String) params.get("channelUpdateDate");
            queryBuilder.append(String.format(" and c.updated  &gt; %s", channelUpdateDate));
        }
        return queryBuilder;
    }

    public static StringBuilder  buildIPTVFavoriteBlock(String expr, Map<String, Object> params) {

        String partitionId = params.get("partitionId").toString();
        String userId = params.get("userId").toString();
        String channelUpdateDate = params.get("channelUpdateDate").toString();

        StringBuilder queryBuilder = new StringBuilder(String.format("SELECT %s FROM iptv_favorite_block ifb", expr));
        queryBuilder.append(String.format(" WHERE  ifb.partition_id = %s and  ifb.user_id = %s", partitionId, userId))
                .append(String.format(" AND (ifb.favorite_date_time  &gt;= %s or ifb.block_date_time  &gt;= %s)", channelUpdateDate, channelUpdateDate));


        return queryBuilder;
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

        if (CollectionHelper.isEmpty(queryMap)) {
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

        if (StringHelper.isNotBlank(asc)) {
            builder.append(" ").append(String.format(QueryConstant.ASC.getValue(), asc));
        }

        if (StringHelper.isNotBlank(desc)) {
            builder.append(" ").append(String.format(QueryConstant.DESC.getValue(), desc));
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
