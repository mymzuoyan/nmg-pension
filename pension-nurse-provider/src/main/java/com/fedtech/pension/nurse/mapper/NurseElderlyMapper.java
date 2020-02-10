package com.fedtech.pension.nurse.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.NurseElderly;
import org.apache.ibatis.annotations.Param;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
public interface NurseElderlyMapper extends BaseMapper<NurseElderly> {


    /**
     * 根据memberId来获取老人信息
     *
     * @param memberId
     * @return
     */
    NurseElderly findByMemberId(@Param("memberId") String memberId);


    /**
     * 根据idcardno来获取老人信息
     *
     * @param idcardno
     * @return
     */
    NurseElderly findByIdcardNo(@Param("idcardno") String idcardno);
}
