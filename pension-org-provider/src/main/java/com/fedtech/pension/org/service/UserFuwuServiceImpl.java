package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.mapper.UserFuwuMapper;
import com.fedtech.pension.org.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.utils.PinyinTool;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @author zhnn
 * @date 2017/2/26
 */
@Service(interfaceClass = UserFuwuService.class, version = "1.0.0")
public class UserFuwuServiceImpl extends BaseServiceImpl<UserFuWu> implements UserFuwuService {

    @Autowired
    private UserFuwuMapper userFuwuMapper;

    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Override
    public BaseMapper<UserFuWu> getMapper() {
        return userFuwuMapper;
    }

    @Override
    public boolean insert(UserFuWu record) {
        String name = record.getName();
        PinyinTool tool = new PinyinTool();
        String namePy = null;
        String namePySX = null;
        try {
            namePy = tool.toPinYin(name, "", PinyinTool.Type.FIRSTUPPER);
            namePySX = tool.toPinYinSX(name, "", PinyinTool.Type.UPPERCASE);
            record.setNamePy(namePy);
            record.setNamePySx(namePySX);
            record.setStatus(0);
        } catch (BadHanyuPinyinOutputFormatCombination badHanyuPinyinOutputFormatCombination) {
            badHanyuPinyinOutputFormatCombination.printStackTrace();
        }
        if (super.insert(record)) {
            //更新缓存
            ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(record.getServiceOrgId());
            if (serviceOrgLocation != null) {
                if (ObjectUtils.isNotNull(serviceOrgLocation.getServiceUserCount())) {
                    serviceOrgLocation.setServiceUserCount(serviceOrgLocation.getServiceUserCount() + 1);
                } else {
                    serviceOrgLocation.setServiceUserCount(1);
                }
                redisServiceOrgLocationUtil.putServiceOrgLocation(record.getServiceOrgId(), serviceOrgLocation);
            }
            return true;
        }
        return false;
    }

    @Override
    public UserFuWu selectByUserId(Integer userId) {
        return userFuwuMapper.selectByUserId(userId);
    }

    @Override
    public UserFuWu selectByIdCardNoAndServiceOrgId(UserFuWu userFuWu) {
        return userFuwuMapper.selectByIdCardNoAndServiceOrgId(userFuWu);
    }

    @Override
    public boolean updateByUserId(UserFuWu record) {
        if (ObjectUtils.isNotNull(record)) {
            String name = record.getName();
            PinyinTool tool = new PinyinTool();
            String namePy = null;
            String namePySX = null;
            try {
                namePy = tool.toPinYin(name, "", PinyinTool.Type.FIRSTUPPER);
                namePySX = tool.toPinYinSX(name, "", PinyinTool.Type.UPPERCASE);
                record.setNamePy(namePy);
                record.setNamePySx(namePySX);
            } catch (BadHanyuPinyinOutputFormatCombination badHanyuPinyinOutputFormatCombination) {
                badHanyuPinyinOutputFormatCombination.printStackTrace();
            }
            return userFuwuMapper.updateByUserId(record) > 0;
        }
        return false;
    }

    @Override
    public boolean updateNullByUserId(Integer userId) {
        return userFuwuMapper.updateNullByUserId(userId) >= 0;
    }

    @Override
    public boolean deleteByServiceOrgIds(List<Integer> serviceOrgIds) {
        return userFuwuMapper.deleteByServiceOrgIds(serviceOrgIds) >= 0;
    }

    @Override
    public List<UserFuWu> selectDutyTypeList(UserFuWu filter) {
        return userFuwuMapper.selectDutyTypeList(filter);
    }

    @Override
    public UserFuWu selectByIdCardNo(String idcardno) {
        return userFuwuMapper.selectByIdCardNo(idcardno);
    }

    @Override
    public boolean deleteSomeUser(List<Integer> idList) {
        return userFuwuMapper.deleteSomeUser(idList) > 0;
    }

    @Override
    public List<Map<String, Object>> selectServiceType() {
        return userFuwuMapper.selectServiceType();
    }

    @Override
    public List<UserFuWu> selectByServiceOrgId(Integer serviceOrgId) {
        return userFuwuMapper.selectByServiceOrgId(serviceOrgId);
    }

    @Override
    public UserFuWu selectUserById(Integer id) {
        return userFuwuMapper.selectByPrimaryKey(id);
    }

    @Override
    public UserFuWu login(String login_name, String loginPwd) {
        return userFuwuMapper.selectByLoginNameandPwd(login_name, loginPwd);
    }

    @Override
    public PageResponse<UserFuWu> selectRecordPageList(UserFuWu userFuWu, PageRequest pageRequest) {
        PageResponse<UserFuWu> pageResponse = new PageResponse<>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(userFuwuMapper.selectRecordList(userFuWu, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(userFuwuMapper.selectRecordCount(userFuWu));
        return pageResponse;
    }

    @Override
    public PageResponse<UserFuWu> selectFeedbackPageList(UserFuWu userFuWu, PageRequest pageRequest) {
        PageResponse<UserFuWu> pageResponse = new PageResponse<>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(userFuwuMapper.selectFeedbackList(userFuWu, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(userFuwuMapper.selectRecordCount(userFuWu));
        return pageResponse;
    }


    @Override
    public List<UserFuWu> selectFeedbackList(UserFuWu userFuWu) {
        return userFuwuMapper.selectFeedbackList(userFuWu, new PageRequest());
    }


    @Override
    public UserFuWu selectByCardNo(String idcardno) {
        return userFuwuMapper.selectByCardNo(idcardno);
    }
}
