package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PaginationResponse;
import com.fedtech.pension.portal.entity.ModuleMesComment;

/**
 * @author CoderQiang
 * @date 2017/5/18
 */
public interface ModuleMesCommentService extends BaseService<ModuleMesComment> {

    /**
     * 分页获取数据--Pagination形式
     *
     * @param mesId
     * @param page
     * @param pageSize
     * @return
     */
    PaginationResponse<ModuleMesComment> selectByModuleMesId(Integer mesId, int page, int pageSize);
}
