package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyPoorVerification;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface ElderlyPoorVerificationMapper extends BaseMapper<ElderlyPoorVerification> {

    /**
     * 批量插入
     *
     * @param verifications
     * @return
     */
    int insertSomeRecode(@Param("verifications") List<ElderlyPoorVerification> verifications);
}