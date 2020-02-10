package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.call.vo.ElderlyGovBuyVisitVo;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.mapper.ElderlyGovBuyMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/11
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = ElderlyGovBuyService.class,version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyGovBuyServiceImpl extends BaseServiceImpl<ElderlyGovBuy> implements ElderlyGovBuyService {

    @Autowired
    private ElderlyGovBuyMapper mapper;

    @Override
    public BaseMapper<ElderlyGovBuy> getMapper() {
        return mapper;
    }

    @Override
    public boolean deleteSome(List<Integer> ids) {
        if (null != ids) {
            return 0 != mapper.deleteSome(ids);
        }
        return false;
    }

    @Override
    public ElderlyGovBuy selectByElderId(Integer elderId) {
        return mapper.selectByElderId(elderId);
    }

    @Override
    public int insertSomeElderGovBuy(List<ElderlyGovBuy> elderlyGovBuys) {
        return mapper.insertSomeElderGovBuy(elderlyGovBuys);
    }


    @Override
    public boolean updateByElderId(ElderlyGovBuy record) {
        if (null != record) {
            return 1 == mapper.updateByElderId(record);
        }
        return false;
    }

    @Override
    public PageResponse<ElderlyGovBuyVisitVo> selectVisitPageList(ElderlyGovBuy filter, PageRequest pageRequest) {
        PageResponse<ElderlyGovBuyVisitVo> pageResponse = new PageResponse<ElderlyGovBuyVisitVo>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectVisitPageList(filter,pageRequest));
        pageResponse.setRecordsFiltered(mapper.countVisit(filter));
        return pageResponse;
    }

    @Override
    public PageResponse<ElderlyGovBuy> selectHandlePageList(ElderlyGovBuy filter, PageRequest pageRequest) {
        PageResponse<ElderlyGovBuy> pageResponse = new PageResponse<ElderlyGovBuy>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectPageListHandle(filter,pageRequest));
        pageResponse.setRecordsFiltered(mapper.countHandle(filter));
        return pageResponse;
    }
}
