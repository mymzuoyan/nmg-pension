package com.fedtech.pension.gold.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.gold.entity.GoldSend;
import com.fedtech.pension.gold.vo.GoldSendVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * @author csn
 * @date 2018/1/11
 */
public interface GoldSendService extends BaseService<GoldSend> {

    /**补发金额*/
    Boolean buFaMoney(GoldSend goldSend);

    /**补发金额查询*/
    PageResponse<GoldSend> goldReissueList(GoldSend filter, @Param("page") PageRequest pageRequest);

    int count1(GoldSend goldSend);

    List<GoldSend> getAllRecode(GoldSend goldSend);

    List<GoldSend> getAllRecode2(GoldSend goldSend);

    List<GoldSend> getAllRecode3(GoldSend goldSend);

    List<GoldSend> getAllRecode4(GoldSend goldSend);

    /**
     * 发放统计
     * */
    List<GoldSendVo> statistics(Integer areaId ,@Param("filter") GoldSendVo filter);

    /**
     * 补发统计
     * */
    List<GoldSendVo> buFaStatistics(Integer areaId ,@Param("filter") GoldSendVo filter);

    /**批量发放*/
    boolean insertSomeGold();

    /**
     * 银行发放的查询
     * */
    PageResponse<GoldSend> selectPageList2(GoldSend filter, PageRequest pageRequest);

    int count2(GoldSend goldSend);

    /**
     * 银行补发的查询
     * */
    PageResponse<GoldSend> selectBankBufaList(GoldSend filter, PageRequest pageRequest);

    int countBankBufa(GoldSend goldSend);

    /**
     * 根据身份证号连查
     * */
    List<GoldSend> selectByIdCard(String idcardno);
    /**
     * 按区统计高龄补贴
     */
    int goldSendCountByCity(String city);

    /**
     * 分区 今年
     * @param city
     * @return
     */
    int goldSendCountByCityAndYear(String city);

    /**
     * 分区 今日
     * @param city
     * @return
     */
    int goldSendCountByCityAndDay(String city);
    /**
     * 今年
     */
    int goldSendCountByYear();
    /**
     * 今日
     */
    int goldSendCountByDay();
}
