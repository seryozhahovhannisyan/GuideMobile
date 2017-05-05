package com.connectto.guide.common.util;

import java.util.List;

/**
 * Created by User on 06.05.2017.
 */
public class QueryParam {

    private String field;
    private String value;
    private QueryConstant constant;

    public QueryParam(String field, String value, QueryConstant constant) {
        this.field = field;
        this.value = value;
        this.constant = constant;
    }

    public QueryParam(String field, int value, QueryConstant constant) {
        this.field = field;
        this.value = "" + value;
        this.constant = constant;
    }

    public QueryParam(String field, long value, QueryConstant constant) {
        this.field = field;
        this.value = "" + value;
        this.constant = constant;
    }

    public QueryParam(String field, List value, QueryConstant constant) {
        this.field = field;
        this.value = DataConverter.join(value, ",");
        this.constant = constant;
    }

    public QueryParam(String field, Object[] value, QueryConstant constant) {
        this.field = field;
        this.value = DataConverter.join(value, ",");
        this.constant = constant;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public QueryConstant getConstant() {
        return constant;
    }

    public void setConstant(QueryConstant constant) {
        this.constant = constant;
    }
}
