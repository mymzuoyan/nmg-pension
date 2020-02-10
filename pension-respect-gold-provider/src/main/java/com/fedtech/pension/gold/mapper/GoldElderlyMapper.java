package com.fedtech.pension.gold.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.gold.entity.GoldElderly;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * @author csn
 * @date 2018/1/4
 */

public interface GoldElderlyMapper extends BaseMapper<GoldElderly>{

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    int deleteSome(@Param("ids") List<Integer> ids);

    /**
     * 获取老人信息
     *
     * @param cardNo
     * @return
     */
    GoldElderly selectByCardNoForGoldSend(@Param("cardNo") String cardNo);

    /* //人员注销
    int updateByPrimaryKey(GoldElderly goldElderly);*/

    /**
     * 获取所有id，把id赋值给发放的elderId
     *
     * */
    List<GoldElderly> selectAllId();

    /**
     * 批量添加高龄补贴老人
     *
     * */
    int insertSomeGoldElderly(@Param("goldElderlies") List<GoldElderly> goldElderlies);

    /**
     * 批量更新
     *
     * */
    int updateByIds(@Param("ids") List<Integer> ids ,@Param("applyType") Integer applyType);
}
