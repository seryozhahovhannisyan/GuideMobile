package com.connectto.guide.common.exception;

/**
 * Internal Server Error exception class
 */
public class ObjectConvertException extends Exception {

    public ObjectConvertException() {
        super();
    }

    public ObjectConvertException(String message) {
        super(message);
    }

    public ObjectConvertException(String message, Throwable cause) {
        super(message, cause);
    }

    public ObjectConvertException(Throwable cause) {
        super(cause);
    }
}