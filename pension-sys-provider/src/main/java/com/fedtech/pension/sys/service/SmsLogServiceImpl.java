package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.sys.entity.SmsLog;
import com.fedtech.pension.sys.mapper.SmsLogMapper;
import com.fedtech.pension.sys.quantity.SmsLogQuantity;
import com.fedtech.pension.sys.quantity.SmsQuantity;
import com.fedtech.pension.sys.vo.SmsLogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;


@Service(interfaceClass = SmsLogService.class, version = "1.0.0")
public class SmsLogServiceImpl extends BaseServiceImpl<SmsLog> implements SmsLogService {
    @Value("${sms.url}")
    private String url;
    @Value("${sms.company}")
    private String company;
    @Value("${sms.username}")
    private String username;
    @Value("${sms.password}")
    private String password;
    @Value("${sms.key}")
    private String key;
    @Value("${sms.yzmcontent}")
    private String yzmContent;
    @Autowired
    private SmsLogMapper mapper;


    @Override
    public BaseMapper<SmsLog> getMapper() {
        return mapper;
    }

    @Override
    public String sendYZM(String phone, String num, String ip) {
        String result = checkLegalRequest(phone, ip);
        if ("true".equals(result)) {
            String messageContent = String.format(yzmContent, num);
            try {
                messageContent = URLEncoder.encode(messageContent, "GBK");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            String param = "SpCode=" + company + "&LoginName=" + username + "&Password=" + password + "&MessageContent=" + messageContent + "&UserNumber=" + phone + "&SerialNumber=0" + new Date().getTime() + "&ScheduleTime=&f=1";
            String sr = HttpRequest.sendPost_GBK(url, param);
            if (sr.contains("result=0")) {
                SmsLog smsLog = new SmsLog();
                smsLog.setContent(String.format(yzmContent, num));
                smsLog.setCreateTime(new Date());
                smsLog.setPhone(phone);
                smsLog.setIp(ip);
                smsLog.setType(SmsLogQuantity.YANZHENGMA);
                smsLog.setStatus(1);
                //发送成功
                this.insert(smsLog);
                return "true";
            } else {
                return sr.substring(sr.lastIndexOf("description=") + 12, sr.lastIndexOf("&faillist"));
            }
        }
        return result;
    }


    @Override
    public boolean insertSomeRecode(List<SmsLog> smsLogs) {
        if (mapper.insertSomeRecode(smsLogs) > 0) {
            return true;
        }
        return false;
    }


    public String checkLegalRequest(String phone, String ip) {
        String result = "true";
        //1.同一个ip一天最多发送条数
        SmsLog smsLog = new SmsLog();
        smsLog.setIp(ip);
        int ipCount = mapper.countByDay(smsLog);
        if (ipCount >= SmsQuantity.IP_DAY_MAXSENDCOUNT) {
            return "当前IP[" + ip + "]今天最多发送" + SmsQuantity.IP_DAY_MAXSENDCOUNT;
        }

        //2.同一个号码一天最多发送条数
        smsLog = new SmsLog();
        smsLog.setPhone(phone);
        int phoneCount = mapper.countByDay(smsLog);
        if (phoneCount >= SmsQuantity.PHONEIP_DAY_MAXSENDCOUNT) {
            return "当前手机号[" + ip + "]今天最多发送" + SmsQuantity.PHONEIP_DAY_MAXSENDCOUNT;
        }

        //3.发送间隔不能低于最大间隔
        SmsLog last = mapper.selectLastLog(phone);
        if (ObjectUtils.isNotNull(last) && ObjectUtils.isNotNull(last.getCreateTime())) {
            Long timeCount = (System.currentTimeMillis()) - last.getCreateTime().getTime();
            if (timeCount < SmsQuantity.MAXTIMEINTERVAL * 60) {
                return "发送短信验证码的间隔为" + SmsQuantity.MAXTIMEINTERVAL + ",还剩" + (SmsQuantity.MAXTIMEINTERVAL * 60 - timeCount) + "s";
            }
        }
        return result;
    }


    @Override
    public PageResponse<SmsLogVo> selectElderLySmsPageList(SmsLogVo filter, PageRequest pageRequest) {
        PageResponse<SmsLogVo> pageResponse = new PageResponse<SmsLogVo>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectElderLySmsPageList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(mapper.countElderLySms(filter));
        return pageResponse;
    }
}
