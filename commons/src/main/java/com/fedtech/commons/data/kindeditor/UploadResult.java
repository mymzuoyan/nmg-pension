package com.fedtech.commons.data.kindeditor;
/**
 * Created by Gong on 2016/4/29.
 */
public class UploadResult {
    private int error;
    private String url;
    private String message;
    public int getError() {
        return error;
    }
    public void setError(int error) {
        this.error = error;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public void markSuccess(String url){
        this.url = url;
        error = 0;
    }
    public void markError(String message){
        this.message = message;
        error = 1;
    }
}