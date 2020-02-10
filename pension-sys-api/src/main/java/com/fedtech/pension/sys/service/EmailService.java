package com.fedtech.pension.sys.service;

/**
 * @author gengqiang
 * @date 2018/1/24
 */
public interface EmailService {

    /**
     * 发送邮件
     *
     * @param toUser
     * @param subject
     * @param text
     * @throws Exception
     */
    void send(String toUser, String subject, String text) throws Exception;

}
