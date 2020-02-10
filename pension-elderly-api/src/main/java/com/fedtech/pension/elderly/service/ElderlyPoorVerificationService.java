package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyPoorVerification;

import java.util.List;

/**
 * Created by gengqiang on 2017/9/27.
 */
public interface ElderlyPoorVerificationService extends BaseService<ElderlyPoorVerification> {

    /**
     * 批量插入
     *
     * @param verifications
     * @return
     */
    boolean insertSomeRecode(List<ElderlyPoorVerification> verifications);
}
