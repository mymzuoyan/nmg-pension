package com.fedtech.pension.gold.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.gold.entity.GoldSend;
import com.fedtech.pension.gold.vo.GoldSendVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author csn
 * @date 2018/1/11
 */
public interface GoldSendMapper extends BaseMapper<GoldSend> {


    /**
     * 补发金额
     *
     * @param goldSend
     * @return
     */
    int buFaMoney(GoldSend goldSend);

    /**
     * 补发金额查询
     *
     * @param goldSend
     * @param pageRequest
     * @return
     */
    List<GoldSend> goldReissueList(@Param("filter") GoldSend goldSend, @Param("page") PageRequest pageRequest);

    /**
     * 统计筛选后的数据
     *
     * @param goldSend
     * @return
     */
    int count1(GoldSend goldSend);

    /**
     * 获得所有记录2
     *
     * @return
     */
    List<GoldSend> getAllRecode2(@Param("filter") GoldSend goldSend);

    /**
     * 获得所有记录3
     *
     * @return
     */
    List<GoldSend> getAllRecode3(@Param("filter") GoldSend goldSend);

    /**
     * 获得所有记录4
     *
     * @return
     */
    List<GoldSend> getAllRecode4(@Param("filter") GoldSend goldSend);
    /**
     * 发放统计
     *
     * @param level
     * @return
     */
    List<GoldSendVo> statistic(@Param("level") Integer level ,@Param("filter") GoldSendVo filter);

    /**
     * 补发统计
     *
     * @param level
     * @return
     */
    List<GoldSendVo> buFaStatistic(@Param("level") Integer level ,@Param("filter") GoldSendVo filter);

    /**
     * 批量导入
     *
     * @param
     * @return
     */
    int insertSomeGold(@Param("goldSends") List<GoldSend> goldSends);

    /**
     * 分页查询
     * 银行发放查询
     * @param goldSend
     * @param pageRequest
     * @return
     */
    List<GoldSend> selectPageList2(@Param("filter") GoldSend goldSend, @Param("page") PageRequest pageRequest);

    /**
     * 银行发放
     *
     * @param goldSend
     * @return
     */
    int count2(GoldSend goldSend);

    /**
     * 分页查询
     * 银行补发查询
     * @param goldSend
     * @param pageRequest
     * @return
     */
    List<GoldSend> selectBankBufaList(@Param("filter") GoldSend goldSend, @Param("page") PageRequest pageRequest);

    /**
     * 银行补发
     *
     * @param goldSend
     * @return
     */
    int countBankBufa(GoldSend goldSend);

    /**
     * 根据身份证号连查
     * */
    List<GoldSend> selectByIdCard(String idcardno);

    int goldSendCountByCity(@Param("city") String city);
    int goldSendCountByYear();
    int goldSendCountByDay();
    int goldSendCountByCityAndYear(@Param("city") String city);
    int goldSendCountByCityAndDay(@Param("city") String city);
}
