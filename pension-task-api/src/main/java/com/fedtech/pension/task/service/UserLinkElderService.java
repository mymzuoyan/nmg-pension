package com.fedtech.pension.task.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.task.entity.UserLinkElder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/3/8
 */
public interface UserLinkElderService extends BaseService<UserLinkElder> {

    /**
     * 根据用户id获取老人
     *
     * @param userId
     * @return
     */
    List<UserLinkElder> selectByUserId(Integer userId);


    /**
     * 居家服务老人分页
     * @param elder
     * @param pageRequest
     * @return
     */
    PageResponse<UserLinkElder> selectLinkElderList(UserLinkElder elder, PageRequest pageRequest);


    /**
     * 居家服务老人总数
     * @param elder
     * @return
     */
    Integer selectPageCount(UserLinkElder elder);

}
