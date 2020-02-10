package com.fedtech.commons.data;

import java.io.Serializable;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
public class LiAnResult implements Serializable {

    private static final Long serialVersionUID = 1L;
    private String code = "0000";
    private String message;
    private Object data;

    private LiAnResult() {

    }

    public String getCode() {
        return code;
    }


    public String getMessage() {
        return message;
    }

    public Object getData() {
        return data;
    }

    public LiAnResult code(String code) {
        this.code = code;
        return this;
    }

    public LiAnResult message(String message) {
        this.message = message;
        return this;
    }

    public LiAnResult data(Object data) {
        this.data = data;
        return this;
    }


    public static LiAnResult ok() {
        return new LiAnResult();
    }

    public static LiAnResult ok(Object data) {
        return new LiAnResult()
                .data(data);
    }
    public static LiAnResult ok(String message,Object data) {
        return new LiAnResult()
                .message(message)
                .data(data);
    }

    public static LiAnResult error(String code, String message) {
        return new LiAnResult()
                .code(code)
                .message(message);
    }
}