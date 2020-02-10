package com.fedtech.pension.nurse.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import org.apache.ibatis.annotations.Param;

/**
 * @author gengqiang
 */
public interface ServiceOrgNurseElderlyMapper extends BaseMapper<ServiceOrgNurseElderly> {

    /**
     * 删除
     *
     * @param elderId
     * @param number
     * @return
     */
    int deleteByIdcardnoAndNumber(@Param("elderId") Integer elderId, @Param("number") String number);

    /**
     * 根据老人ID和编码来获取看护对象
     *
     * @param elderId
     * @param number
     * @return
     */
    ServiceOrgNurseElderly findByIdcardnoAndNumber(@Param("elderId") Integer elderId, @Param("number") String number);

}