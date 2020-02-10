package com.fedtech.pension.task.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.mapper.UserLinkElderMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/3/8
 */
@Service(version = "1.0.0", interfaceClass = UserLinkElderService.class, timeout = 5000, retries = 0)
public class UserLinkElderServiceImpl extends BaseServiceImpl<UserLinkElder> implements UserLinkElderService {

    @Autowired
    private UserLinkElderMapper mapper;


    @Override
    public BaseMapper<UserLinkElder> getMapper() {
        return mapper;
    }

    @Override
    public List<UserLinkElder> selectByUserId(Integer userId) {
        return mapper.selectByUserId(userId);
    }

    @Override
    public PageResponse<UserLinkElder> selectLinkElderList(UserLinkElder elder, PageRequest pageRequest) {
        PageResponse<UserLinkElder> pageResponse = new PageResponse<>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectLinkElderList(elder, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(mapper.selectPageCount(elder));
        return pageResponse;
    }


    @Override
    public Integer selectPageCount(UserLinkElder elder) {
        return mapper.selectPageCount(elder);
    }
}
