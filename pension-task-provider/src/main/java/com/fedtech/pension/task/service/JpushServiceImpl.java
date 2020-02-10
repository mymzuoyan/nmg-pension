package com.fedtech.pension.task.service;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.Notification;
import com.alibaba.dubbo.config.annotation.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;

/**
 * Created by MaiBenBen on 2017/1/6.
 */
@Service(interfaceClass = JpushService.class, version = "1.0.0",timeout = 0,retries = 0)
public class JpushServiceImpl implements JpushService {
    public Logger LOG = LoggerFactory.getLogger(JpushServiceImpl.class);
    //服务人员key&&secret
    @Value("${serviceUser.jPush.AppKey}")
    private String SUKey;
    @Value("${serviceUser.jPush.secret}")
    private String SUSecret;
    //服务对象key&&secret
    @Value("${serviceObject.jPush.AppKey}")
    private String SOKey;
    @Value("${serviceObject.jPush.secret}")
    private String SOSecret;
    //服务组织管理员key&&secret
    @Value("${serviceAdmin.jPush.AppKey}")
    private String SAKey;
    @Value("${serviceAdmin.jPush.secret}")
    private String SASecret;

    @Override
    public boolean sendUserMessage(List<String> receiveIds, String content, String task, Integer type) {
        String key = null;
        String secret = null;
        switch (type) {
            case 0:
                key = SUKey;
                secret = SUSecret;
                break;
            case 1:
                key = SAKey;
                secret = SASecret;
                break;
            case 2:
                key = SOKey;
                secret = SOSecret;
                break;
            default:
                return false;
        }
        JPushClient jpushClient = new JPushClient(secret, key, 3);
        // For push, all you need do is to build PushPayload object.
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.newBuilder()
                        .addAudienceTarget(AudienceTarget.alias(receiveIds))
                        .build())
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(AndroidNotification.newBuilder()
                                .setAlert(content)
                                .addExtra("task", task)
                                .build())
                        .build())
                .build();
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("Got result - " + result);

        } catch (APIConnectionException e) {
            // Connection error, should retry later
            LOG.error("Connection error, should retry later", e);

        } catch (APIRequestException e) {
            // Should review the error, and fix the request
            LOG.error("Should review the error, and fix the request", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
        }
        return false;
    }


    @Override
    public boolean sendUserMessage(List<String> receiveIds, String content, Integer type) {
        String key = null;
        String secret = null;
        switch (type) {
            case 0:
                key = SUKey;
                secret = SUSecret;
                break;
            case 1:
                key = SAKey;
                secret = SASecret;
                break;
            case 2:
                key = SOKey;
                secret = SOSecret;
                break;
            default:
                return false;
        }
        JPushClient jpushClient = new JPushClient(secret, key, 3);
        // For push, all you need do is to build PushPayload object.
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.newBuilder()
                        .addAudienceTarget(AudienceTarget.alias(receiveIds))
                        .build())
                .setMessage(Message.content(content))
                .build();
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("透传 - " + result);

        } catch (APIConnectionException e) {
            // Connection error, should retry later
            LOG.error("Connection error, should retry later", e);
        } catch (APIRequestException e) {
            // Should review the error, and fix the request
            LOG.error("Should review the error, and fix the request", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
        }
        return false;
    }

    @Override
    public boolean deleteAlias(String alias, Integer type) {
        String key = null;
        String secret = null;
        switch (type) {
            case 0:
                key = SUKey;
                secret = SUSecret;
                break;
            case 1:
                key = SAKey;
                secret = SASecret;
                break;
            case 2:
                key = SOKey;
                secret = SOSecret;
                break;
            default:
                return false;
        }
        JPushClient jpushClient = new JPushClient(secret, key, 3);
        try {
            jpushClient.deleteAlias(alias, "");
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
        return true;
    }
}
