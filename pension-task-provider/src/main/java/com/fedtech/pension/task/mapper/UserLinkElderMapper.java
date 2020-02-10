package com.fedtech.pension.task.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.task.entity.UserLinkElder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/3/8
 */
public interface UserLinkElderMapper extends BaseMapper<UserLinkElder> {

    /**
     * 获取用户关联老人
     *
     * @param userId
     * @return
     */
    List<UserLinkElder> selectByUserId(@Param("userId") Integer userId);

    /**
     * 居家服务老人分页
     * @param elder
     * @param pageRequest
     * @return
     */
    List<UserLinkElder> selectLinkElderList(@Param("elder") UserLinkElder elder, @Param("page") PageRequest pageRequest);

    /**
     * 居家服务老人总数
     * @param elder
     * @return
     */
    Integer selectPageCount(@Param("elder") UserLinkElder elder);
}
