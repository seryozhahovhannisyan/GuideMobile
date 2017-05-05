package com.connectto.guide.common.util;

public enum QueryConstant {

    EQUAL("= %s"),

    CONTAINS("IN (%s)"),

    GREATETHEN("> %s "),

    LESSTHEN("< %s"),

    CONTAINSTR("LIKE '%%%s%%'"),

    ENDSWITH("LIKE '%%%s'"),

    STARTSWITH("LIKE '%s%%'"),

    ISNULL("IS NULL"),

    ISNOTNULL("IS NOT NULL"),

    LIMIT("LIMIT"),

    OFFSET("OFFSET"),

    ASC("ORDER BY %s ASC"),

    DESC("ORDER BY %s DESC");

    QueryConstant(final String value) {
        this.value = value;
    }


    public String getValue() {
        return value;
    }

    private final String value;
}
