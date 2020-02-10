package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.org.entity.UserFuWu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * @author zhnn
 * @date 2017/2/26
 */
public interface UserFuwuMapper extends BaseMapper<UserFuWu> {

    /**
     * 根据userID来查询用户
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
    int updateByUserId(UserFuWu record);

    /**
     * 更新
     *
     * @param userId
     * @return
     */
    int updateNullByUserId(Integer userId);

    /**
     * 删除
     *
     * @param serviceOrgIds
     * @return
     */
    int deleteByServiceOrgIds(@Param("serviceOrgIds") List<Integer> serviceOrgIds);

    /**
     * 查询
     *
     * @param idcardno
     * @return
     */
    UserFuWu selectByIdCardNo(@Param("idcardno") String idcardno);

    /**
     * 删除
     *
     * @param idList
     * @return
     */
    int deleteSomeUser(@Param("idList") List<Integer> idList);

    List<UserFuWu> selectDutyTypeList(UserFuWu filter);

    List<Map<String,Object>> selectServiceType();

    List<UserFuWu> selectByServiceOrgId(@Param("serviceOrgId") Integer serviceOrgId);

    UserFuWu selectByLoginNameandPwd(@Param("loginName")String loginName,@Param("password") String loginPwd);

    /**
     * 服务人员记录列表数据
     * @param userFuWu
     * @param pageRequest
     * @return
     */
    List<UserFuWu> selectRecordList(@Param("filter") UserFuWu userFuWu, @Param("page") PageRequest pageRequest);

    /**
     * 服务人员反馈列表数据
     * @param userFuWu
     * @param pageRequest
     * @return
     */
    List<UserFuWu> selectFeedbackList(@Param("filter") UserFuWu userFuWu, @Param("page") PageRequest pageRequest);

    /**
     * 服务人员记录count
     * @param userFuWu
     * @return
     */
    int selectRecordCount(@Param("filter") UserFuWu userFuWu);

    /**
     * 根据身份证和姓名获取老人信息
     *
     * @param idcardno
     * @return
     */
    UserFuWu selectByCardNo(@Param("idcardno") String idcardno);
}
