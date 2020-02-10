package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.entity.Min;
import com.fedtech.pension.elderly.vo.ElderlyMsgVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface ElderlyMsgMapper extends BaseMapper<ElderlyMsg> {

    /**
     * 确认老人去世
     *
     * @param id
     * @return
     */
    boolean isDeadElder(Integer id);

    /**
     * 根据areaId分页查询老人信息数据，查询该行政区及子区域下的老人信息。
     *
     * @param
     * @return
     */
    List<ElderlyMsg> selectByMsg(ElderlyMsg elderlyMsg);

    List<ElderlyMsg> selectAll(ElderlyMsg elderlyMsg);

    Integer selectByAreaId(Integer areaId);

    Integer selectCount();

    /**
     * 根据身份证和姓名获取老人信息
     *
     * @param idcardno
     * @param elderName
     * @return
     */
    ElderlyMsg selectByNameAndCardNo(@Param("idcardno") String idcardno,@Param("elderName") String elderName);

    /**
     * 批量更新殡葬老人
     *
     * @param idList
     * @return
     */
    boolean updateIsDeath(@Param("idList") List<Integer> idList);


    /**
     * 批量获取
     *
     * @param idList
     * @return
     */
    List<ElderlyMsg> selectBySomeId(@Param("idList") List<Integer> idList);

    /**
     * 老人评分信息分页查询
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<ElderlyMsg> selectAssePageList(@Param("filter") ElderlyMsg t, @Param("page") PageRequest pageRequest, @Param("map") Map map);

    /**
     * 老人多次评分list
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<ElderlyMsg> selectAsseAllPageList(@Param("filter") ElderlyMsg t, @Param("page") PageRequest pageRequest);

    /**
     * 统计评估的数据数量
     *
     * @param filter
     * @return
     */
    int countAss(@Param("filter") ElderlyMsg filter);

    /**
     * 统计筛选后评估的数据数量
     *
     * @param filter
     * @return
     */
    int countAssAll(ElderlyMsg filter);

    /**
     * 获取老人信息
     *
     * @param cardNo
     * @return
     */
    ElderlyMsg selectByCardNo(@Param("cardNo") String cardNo);

    /**
     * 获取老人信息2
     *
     * @param cardNo
     * @return
     */
    ElderlyMsg selectByCardNoForGold(@Param("cardNo") String cardNo);


    /**
     * 获取老人信息（包含政府购买信息）
     *
     * @param cardNo
     * @return
     */
    ElderlyMsgVo selectGovBuyByCardNo(@Param("cardNo") String cardNo);

    /**
     * 获取老人信息（包含政府购买信息）
     *
     * @param id
     * @return
     */
    ElderlyMsgVo selectGovBuyByPrimaryKey(Integer id);

    /**
     * 批量导入老人信息
     *
     * @param elderlyMsgs
     * @return
     */
    int insertSomeElder(@Param("elderlyMsgs") List<ElderlyMsg> elderlyMsgs);

    /**
     * 批量更新老人信息
     * <p>
     * * @param elderlyMsgs
     *
     * @return
     */
    int updateSomeElder(@Param("elderlyMsgs") List<ElderlyMsg> elderlyMsgs);

    /**
     * 各类老人数量
     *
     * @return
     */
    List<Map<Object, Object>> getCountByElderTypeDictIds(@Param("filter") ElderlyMsg elderlyMsg);


    /**
     * 获取多少岁的老人
     *
     * @param age
     * @return
     */
    List<ElderlyMsg> getEldersByAge(Integer age);

    /**
     * 获取id和idcardno
     *
     * @param t
     * @return
     */
    List<ElderlyMsg> getIdAndIdCardno(@Param("filter") ElderlyMsg t);


    /**
     * 分页查询（包含政府购买信息）
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<ElderlyMsgVo> selectGovBuyPageList(@Param("filter") ElderlyMsg t, @Param("page") PageRequest pageRequest);

    /**
     * 根据身份证来查询姓名
     *
     * @param idcardno
     * @return
     */
    String findNameByIdcardno(@Param("idcardno") String idcardno);


    /**
     * 根据老人类型导出老人数据
     *
     * @param elderlyMsg
     * @return
     */
    List<ElderlyMsg> exportLowInsuranceElderly(@Param("filter") ElderlyMsg elderlyMsg);

    /**
     * 根据老人类型导出老人数据
     *
     * @return
     */
    List<ElderlyMsg> exportDeathElderly();


    /**
     * 通过二维码获取老人信息
     *
     * @param qrCoder
     * @return
     */
    Map selectByQrCoder(String qrCoder);

    /**
     * 分页查询老人信息和服务表联查
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<ElderlyMsg> selectPageServiceList(@Param("filter") ElderlyMsg t, @Param("page") PageRequest pageRequest);

    int serviceCount(ElderlyMsg t);

    /**
     * 根据出生日期获取老人列表
     *
     * @param birthDay
     */
    List<ElderlyMsg> getAllBirth(String birthDay);


    /**
     * 通过助老卡找老人
     *
     * @param helpCardNo
     * @return
     */
    ElderlyMsg findByHelpCardNo(@Param("helpCardNo") String helpCardNo);


    /**
     * 老人与助老卡绑定
     *
     * @param helpCardNo
     * @param idcardno
     * @return
     */
    int updateHelpCardNoByIdcardno(@Param("helpCardNo") String helpCardNo, @Param("idcardno") String idcardno);
    ElderlyMsg selectByPhone(@Param("phone")String phone);

    /**
     * 根据身份证号查询老人信息
     * @param idcardno
     * @return
     */
    ElderlyMsg selectElderByCardNo(@Param("idcardno") String idcardno);


    /**
     * 批量导入老人信息暂时使用（使用后删除）
     *
     * @param elderlyMsgs
     * @return
     */
    int insertBatch(@Param("elderlyMsgs") List<ElderlyMsg> elderlyMsgs);



}