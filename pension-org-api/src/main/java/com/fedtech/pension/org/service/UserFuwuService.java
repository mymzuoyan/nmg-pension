package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.org.entity.UserFuWu;

import java.util.List;
import java.util.Map;

/**
 * Created by zhnn on 2017/2/26.
 */
public interface UserFuwuService extends BaseService<UserFuWu> {

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    UserFuWu selectByUserId(Integer userId);

    UserFuWu selectByIdCardNoAndServiceOrgId(UserFuWu userFuWu);

    /**
     * 更新
     *
     * @param record
     * @return
     */
    boolean updateByUserId(UserFuWu record);

    /**
     * 更新
     *
     * @param userId
     * @return
     */
    boolean updateNullByUserId(Integer userId);

    /**
     * 根据组织id删除用户
     *
     * @param serviceOrgIds
     * @return
     */
    boolean deleteByServiceOrgIds(List<Integer> serviceOrgIds);

    /**
     * 根据身份证获取用户
     *
     * @param idcardno
     * @return
     */
    UserFuWu selectByIdCardNo(String idcardno);

    /**
     * 批量删除
     *
     * @param idList
     * @return
     */
    boolean deleteSomeUser(List<Integer> idList);

    List<UserFuWu> selectDutyTypeList(UserFuWu filter);

    List<Map<String, Object>> selectServiceType();

    List<UserFuWu> selectByServiceOrgId(Integer serviceOrgId);

    UserFuWu selectUserById(Integer id);

    /**
     * 根据用户名称和密码查询
     *
     * @param loginName
     * @param loginPwd
     * @return
     */
    UserFuWu login(String loginName, String loginPwd);

    /**
     * 服务人员记录列表数据
     *
     * @param userFuWu
     * @param pageRequest
     * @return
     */
    PageResponse<UserFuWu> selectRecordPageList(UserFuWu userFuWu, PageRequest pageRequest);


    /**
     * 服务人员反馈列表数据
     *
     * @param userFuWu
     * @param pageRequest
     * @return
     */
    PageResponse<UserFuWu> selectFeedbackPageList(UserFuWu userFuWu, PageRequest pageRequest);


    /**
     * 服务人员反馈列表
     *
     * @param userFuWu
     * @return
     */
    List<UserFuWu> selectFeedbackList(UserFuWu userFuWu);


    /**
     * 根据身份证获取从业服务人员信息
     *
     * @param cardNo
     * @return
     */
    UserFuWu selectByCardNo(String cardNo);

}
