package com.connectto.guide.controller.dto;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@Component
public class ResponseDto implements Serializable {

    private ResponseStatus status;

    private String actionerror;
    private String actionmessage;

    private Map<String, String> fielderrors;

    private Map<String, Object> response;

    public void addResponse(String key, Object value) {
        if (response == null || response.size() == 0) {
            response = new HashMap<String, Object>();
        }
        response.put(key, value);
    }

    public void addFieldError(String name, String error) {
        if (fielderrors == null || fielderrors.size() == 0) {
            fielderrors = new HashMap<String, String>();
        }
        fielderrors.put(name, error);
    }

    public void cleanMessages() {

        status = null;
        actionerror = null;
        actionmessage = null;

        if (fielderrors != null) {
            fielderrors.clear();
        }

        if (response != null) {
            response.clear();
        }
    }

    public ResponseStatus getStatus() {
        return status;
    }

    public void setStatus(ResponseStatus status) {
        this.status = status;
    }

    public String getActionerror() {
        return actionerror;
    }

    public void setActionerror(String actionerror) {
        this.actionerror = actionerror;
    }

    public String getActionmessage() {
        return actionmessage;
    }

    public void setActionmessage(String actionmessage) {
        this.actionmessage = actionmessage;
    }

    public Map<String, String> getFielderrors() {
        return fielderrors;
    }

    public void setFielderrors(Map<String, String> fielderrors) {
        this.fielderrors = fielderrors;
    }

    public Map<String, Object> getResponse() {
        return response;
    }

    public void setResponse(Map<String, Object> response) {
        this.response = response;
    }

    @Override
    public String toString() {
        return "ResponseDto{" +
                "status=" + status +
                ", actionerror='" + actionerror + '\'' +
                ", actionmessage='" + actionmessage + '\'' +
                ", fielderrors=" + fielderrors +
                ", response=" + response +
                '}';
    }
}
