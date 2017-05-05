package com.connectto.guide.controller.dto;

import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Serozh
 * Date: 05.05.13
 * Time: 19:02
 * To change this template use File | Settings | File Templates.
 */
@XmlRootElement
public class ResponseDto implements Serializable {
    private ResponseStatus status;
    private List<String> messages;
    public void addMessage(String message) {
        if (messages == null) {
            messages = new ArrayList<String>();
        }
        messages.add(message);
    }

    public void cleanMessages() {
        if (messages != null) {
            messages.clear();
        }
        status = null;
    }



    public ResponseStatus getStatus() {
        return status;
    }

    public void setStatus(ResponseStatus status) {
        this.status = status;
    }

    public List<String> getMessages() {
        return messages;
    }

    public void setMessages(List<String> messages) {
        this.messages = messages;
    }

    @Override
    public String toString() {
        return "ResponseDto{" +
                "status=" + status +
                ", messages=" + messages +
                '}';
    }
}
