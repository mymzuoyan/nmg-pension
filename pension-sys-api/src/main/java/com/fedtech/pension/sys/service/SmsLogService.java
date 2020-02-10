package com.fedtech.pension.sys.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.sys.entity.SmsLog;
import com.fedtech.pension.sys.vo.SmsLogVo;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/3/23
 */
public interface SmsLogService extends BaseService<SmsLog> {

    /**
     * 发送验证码
     *
     * @param phone   手机号码
     * @param content 内容
     * @param ip      客户端ip
     * @return
     */
    String sendYZM(String phone, String content, String ip);


//    /**
//     * 给多个老人发送告知短信
//     *
//     * @param elders
//     * @param content
//     * @param ip
//     * @return
//     */
//    String sendTips(List<ElderlyMsg> elders, String content, String ip);


    /**
     * 批量添加
     *
     * @param smsLogs
     * @return
     */
    boolean insertSomeRecode(List<SmsLog> smsLogs);

    /**
     * 分页获取发送给老人的短信列表
     *
     * @param t
     * @param pageRequest
     * @return
     */
    PageResponse<SmsLogVo> selectElderLySmsPageList(SmsLogVo t, PageRequest pageRequest);

}
