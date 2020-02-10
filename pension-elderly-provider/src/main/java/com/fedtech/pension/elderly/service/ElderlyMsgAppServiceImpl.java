package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.IdcardValidator;
import com.fedtech.pension.elderly.entity.ElderlyMsgApp;
import com.fedtech.pension.elderly.mapper.ElderlyMsgAppMapper;
import com.fedtech.pension.elderly.redis.RedisTemplateUtil;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.SmsLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.List;


/**
 * 老人基础信息
 *
 * @author gengqiang
 */

@Service(version = "1.0.0", interfaceClass = ElderlyMsgAppService.class, timeout = 5000, retries = 0)
public class ElderlyMsgAppServiceImpl extends BaseServiceImpl<ElderlyMsgApp> implements ElderlyMsgAppService {

    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ElderlyMsgAppMapper elderlyMsgMapper;

    @Autowired
    private ElderlyGovBuyService elderlyGovBuyService;

    @Autowired
    private ElderlyAssessmentService elderlyAssessmentService;

    @Reference(version = "1.0.0")
    private SmsLogService smsLogService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    private IdcardValidator validator = null;

    @Override
    public BaseMapper<ElderlyMsgApp> getMapper() {
        return elderlyMsgMapper;
    }



    @Override
    public ElderlyMsgApp insertBackId(ElderlyMsgApp record) {
//        record.setCreateTime(new Date());
        if (super.insert(record)) {
            //更新缓存
//            updateElderStatistic(record);
            return record;
        }
        return null;
    }
    @Override
    public boolean insert(ElderlyMsgApp record) {
//        record.setCreateTime(new Date());
        if (super.insert(record)) {
            //更新缓存
//            updateElderStatistic(record);
            return true;
        }
        return false;
    }

    @Override
    public List<ElderlyMsgApp> selectCountList(ElderlyMsgApp elderlyMsgApp) {
        return elderlyMsgMapper.selectCountList(elderlyMsgApp);
    }

    @Override
    public ElderlyMsgApp selectByPrimaryKey(Integer id) {
        ElderlyMsgApp elderlyMsg = super.selectByPrimaryKey(id);

        return elderlyMsg;
    }


}
