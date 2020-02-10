package com.fedtech.pension.task.service;

import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 * @date 2016/10/25
 */
@Service
public interface JpushService {

    /**
     * 推送
     *
     * @param receiveIds
     * @param content
     * @param task
     * @param type
     * @return
     */
    boolean sendUserMessage(List<String> receiveIds, String content, String task, Integer type);

    /**
     * 推送  (透传)
     *
     * @param receiveIds
     * @param content
     * @param type
     * @return
     */
    boolean sendUserMessage(List<String> receiveIds, String content, Integer type);


    /**
     * 清空别名
     *
     * @param alias
     * @param type
     * @return
     */
    boolean deleteAlias(String alias, Integer type);


}
