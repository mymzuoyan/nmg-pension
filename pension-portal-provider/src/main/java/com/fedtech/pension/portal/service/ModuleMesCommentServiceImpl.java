package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PaginationResponse;
import com.fedtech.pension.portal.entity.ModuleMesComment;
import com.fedtech.pension.portal.mapper.ModuleMesCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/5/18
 */
@Service(interfaceClass = ModuleMesCommentService.class, version = "1.0.0")
public class ModuleMesCommentServiceImpl extends BaseServiceImpl<ModuleMesComment> implements ModuleMesCommentService {
    @Autowired
    private ModuleMesCommentMapper moduleMesCommentMapper;

    @Override
    public BaseMapper<ModuleMesComment> getMapper() {
        return moduleMesCommentMapper;
    }

    @Override
    public PaginationResponse<ModuleMesComment> selectByModuleMesId(Integer mesId, int page, int pageSize) {
        PaginationResponse<ModuleMesComment> paginationResponse = new PaginationResponse<>();
        ModuleMesComment filter = new ModuleMesComment();
        filter.setMesId(mesId);
        PageRequest pr = new PageRequest();
        pr.setStart((page - 1) * pageSize);
        pr.setLength(pageSize);
        pr.setOrderDir("desc");
        pr.setOrderField("createTime");
        int filterCount = moduleMesCommentMapper.count(filter);
        List<ModuleMesComment> moduleMesComments = moduleMesCommentMapper.selectPageList(filter, pr);
        paginationResponse.setPage(page);
        paginationResponse.setTotalPage(filterCount % pageSize > 0 ? filterCount / pageSize + 1 : filterCount / pageSize);
        paginationResponse.setData(moduleMesComments);
        return paginationResponse;
    }
}
