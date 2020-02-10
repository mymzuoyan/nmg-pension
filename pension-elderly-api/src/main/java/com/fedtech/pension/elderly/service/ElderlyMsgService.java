
package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.elderly.entity.ElderlyAssessment;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.entity.Min;
import com.fedtech.pension.elderly.vo.ElderlyMsgVo;
import org.apache.ibatis.annotations.Param;

import java.io.InputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 老人基础信息
 *
 * @author gengqiang
 */

public interface ElderlyMsgService extends BaseService<ElderlyMsg> {

    /**
     * 确认老人去世
     *
     * @param id
     * @return
     */
    boolean isDeadElder(Integer id);

    Integer selectByAreaId(Integer areaId);

    Integer selectCount();

    /**
     * 批量确认老人去世
     *
     * @param idList
     * @return
     */
    boolean updateIsDeath(List<Integer> idList);


    /**
     * 批量删除老人
     *
     * @param idList
     * @return
     */
   /* boolean deleteSomeMsg(List<Integer> idList);*/

    /**
     * 根据areaId分页查询老人信息数据，查询该行政区及子区域下的老人信息。
     *
     * @param
     * @return
     */
    List<ElderlyMsg> selectByMsg(ElderlyMsg elderlyMsg);

    List<ElderlyMsg> selectAll(ElderlyMsg elderlyMsg);

    /**
     * 加载老人评分信息LIST
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<ElderlyMsg> selectAssePageList(ElderlyMsg filter, PageRequest pageRequest, Map map);

    /**
     * 加载老人评估多次信息LIST
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<ElderlyMsg> selectAsseAllPageList(ElderlyMsg filter, PageRequest pageRequest);

    /**
     * 根据户籍来统计老人信息
     *
     * @param elderlyMsg
     * @return
     */
    Map<String, Integer> getStatisticsByArea(ElderlyMsg elderlyMsg);

    /**
     * getStatisticsByGovBuy
     *
     * @param elderlyGovBuy
     * @return
     */
    Map<String, Integer> getStatisticsByGovBuy(ElderlyGovBuy elderlyGovBuy);



    /**
     * 根据评估来统计老人信息
     *
     * @return
     */
    Map<String, Integer> getStatisticsByAssess(ElderlyAssessment elderlyAssessment);

    /**
     * 特定范围的老人数
     *
     * @param filter
     * @param startTime
     * @param endTime
     * @return
     */
    Map<String, Integer> getStatisticsByDate(ElderlyMsg filter, String startTime, String endTime) throws ParseException;

    /**
     * 根据身份证获取信息
     *
     * @param cardNo
     * @return
     */
    ElderlyMsg selectByCardNo(String cardNo);

    /**
     * 根据身份证获取信息2
     *
     * @param cardNo
     * @return
     */
    ElderlyMsg selectByCardNoForGold(String cardNo);

    /**
     * 批量添加老人
     *
     * @param elderlyMsgs
     * @return
     */
    int insertSomeElder(List<ElderlyMsg> elderlyMsgs);

    /**
     * 批量更新老人
     *
     * @param elderlyMsgs
     * @return
     */
    int updateSomeElder(List<ElderlyMsg> elderlyMsgs);

    /**
     * 批量获取老人
     *
     * @param idList
     * @return
     */
    List<ElderlyMsg> selectBySomeId(List<Integer> idList);

    /**
     * 各区各类老人数量
     *
     * @param elderlyMsg
     * @return
     */
    HashMap<String, List<Long>> getCountByAreaAndelderTypeDictIdsFromCache(ElderlyMsg elderlyMsg);

    /**
     * 各区各类老人数量
     *
     * @param elderlyMsg
     * @return
     */
    HashMap<String, List<Long>> getCountByAreaAndelderTypeDictIds(ElderlyMsg elderlyMsg);

    /**
     * 各区各类老人数量
     *
     * @param areaId
     * @return
     */
    HashMap<String, List<Long>> getCountByAreaAndelderTypeDictIds(Integer areaId);

    /**
     * 各区评估老人数量
     *
     * @param elderlyMsg
     * @return
     */
    HashMap<String, List<Long>> getCountByAreaAndAbilityAssess(ElderlyMsg elderlyMsg);

    /**
     * 各类老人数量(0:其他，1：....)
     *
     * @return
     */
    List<Long> getCountByElderTypeDictIds(ElderlyMsg elderlyMsg);

//    /**
//     * 添加呼叫客户
//     *
//     * @param msg
//     * @param currentId
//     * @return
//     */
//    boolean insertCallCustomer(ElderlyMsg msg, Integer currentId);

    /**
     * 筛选导进来的数据
     *
     * @param file
     * @param filer
     * @return
     */
    Map<String, List<ElderlyMsg>> filterElderMes(InputStream file, ElderlyMsg filer);

    /**
     * 导入老人数据
     *
     * @param file
     * @return
     */
    boolean importElderMes(InputStream file);

    /**
     * 获取多少岁的老人
     *
     * @param age
     * @return
     */
    List<ElderlyMsg> getEldersByAge(Integer age);


    /**
     * 分页查询（包含政府购买信息）
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    List<ElderlyMsgVo> selectGovBuyPageList(ElderlyMsg filter, PageRequest pageRequest);

    /**
     * 获取老人信息（包含政府购买信息）
     *
     * @param cardNo
     * @return
     */
    ElderlyMsgVo selectGovBuyByCardNo(String cardNo);


    /**
     * 获取老人信息（包含政府购买信息）
     *
     * @param id
     * @return
     */
    ElderlyMsgVo selectGovBuyByPrimaryKey(Integer id);


    /**
     * 获取新增和提档老人（79到80,89到90，99到100）
     *
     * @return
     */
    List<ElderlyMsg> getAddAndUpElder(ElderlyMsg filter);

    /**
     * 获取新增和提档老人情况
     *
     * @return
     */
    Map<String, List<Integer>> getAddAndUpElderInfo();


    /**
     * 80岁以下的，快到80岁的发送信息
     *
     * @param message
     * @return
     */
    boolean sendMessageToElder(String message, String ip);


    /**
     * 发送给特定老人信息
     *
     * @param elderlyMsgs
     * @param message
     * @param ip
     * @return
     */
    boolean sendMessageToElders(List<ElderlyMsg> elderlyMsgs, String message, String ip);


    /**
     * 根据身份证来查询姓名
     *
     * @param idcardno
     * @return
     */
    String findNameByIdcardno(String idcardno);


    /**
     * 导出
     *
     * @param elderlyMsg
     * @return
     */
    List<ElderlyMsg> exportLowInsuranceElderly(ElderlyMsg elderlyMsg);

    /**
     * 导出
     *
     * @return
     */
    List<ElderlyMsg> exportDeathElderly();


    /**
     * 根据二维码来获取老人信息
     *
     * @param qrCoder
     * @return
     */
    Map selectByQrCoder(String qrCoder);

    /**
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<ElderlyMsg> selectPageServiceList(ElderlyMsg filter, PageRequest pageRequest);

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
    ElderlyMsg findByHelpCardNo(String helpCardNo);


    /**
     * 老人与助老卡绑定
     *
     * @param helpCardNo
     * @param idcardno
     * @return
     */
    boolean updateHelpCardNoByIdcardno(String helpCardNo, String idcardno);

    ElderlyMsg selectByNameAndCardNo(String idcardno,String elderName);
    ElderlyMsg selectByPhone(String phone);

    ElderlyMsg selectElderByCardNo(String idcardno);

    /**
     * 批量导入老人信息暂时使用（使用后删除）
     * @param elderlyMsgs
     * @return
     */
    int insertBatch(List<ElderlyMsg> elderlyMsgs);

}
