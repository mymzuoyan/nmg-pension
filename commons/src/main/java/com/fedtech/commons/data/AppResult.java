package com.fedtech.commons.data;

import java.io.Serializable;

/**
 * @author Gong
 * @date 2016/4/7
 */
public class AppResult implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer success;
    private Object data;
    private String message;


    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }


    @Override
    public String toString() {
        return "AppResult{" +
                "success=" + success +
                ", data=" + data +
                ", message='" + message + '\'' +
                '}';
    }

    public AppResult() {
    }


    public AppResult success(Integer code) {
        this.success = code;
        return this;
    }

    public AppResult message(String message) {
        this.message = message;
        return this;
    }

    public AppResult data(Object data) {
        this.data = data;
        return this;
    }


    public AppResult(Integer success, String message) {
        this.success = success;
        this.message = message;
    }

    public Integer getSuccess() {
        return success;
    }

    public void setSuccess(Integer success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void markSuccess(String message, Object data) {
        this.success = 1;
        this.message = message;
        this.data = data;
    }

    public void markSuccess(String message) {
        this.success = 1;
        this.message = message;
    }


    public void markError() {
        this.success = 0;
    }

    public void markError(String message) {
        this.success = 0;
        this.message = message;
    }


    public static AppResult ok() {
        return new AppResult().success(1);
    }

    public static AppResult ok(Object data) {
        return new AppResult()
                .data(data);
    }

    public static AppResult ok(String message, Object data) {
        return new AppResult()
                .message(message)
                .data(data);
    }

    public static AppResult error(String message) {
        return new AppResult()
                .success(0)
                .message(message);
    }
}
