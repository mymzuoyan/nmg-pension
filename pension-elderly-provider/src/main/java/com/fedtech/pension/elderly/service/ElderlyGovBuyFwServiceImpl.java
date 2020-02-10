package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.elderly.entity.ElderlyGovBuyFw;
import com.fedtech.pension.elderly.mapper.ElderlyGovBuyFwMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/11
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = ElderlyGovBuyFwService.class,version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyGovBuyFwServiceImpl extends BaseServiceImpl<ElderlyGovBuyFw> implements ElderlyGovBuyFwService {

    @Autowired
    private ElderlyGovBuyFwMapper mapper;

    @Override
    public BaseMapper<ElderlyGovBuyFw> getMapper() {
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
    public ElderlyGovBuyFw selectByElderId(Integer elderId) {
        return mapper.selectByElderId(elderId);
    }

    @Override
    public int insertSomeElderGovBuyFw(List<ElderlyGovBuyFw> elderlyGovBuyFws) {
        return mapper.insertSomeElderGovBuyFw(elderlyGovBuyFws);
    }


    @Override
    public boolean insert(ElderlyGovBuyFw elderlyGovBuyFw) {

            if(mapper.insert(elderlyGovBuyFw)>0){
                return true;
            }else{
                return false;
            }

    }

    @Override
    public boolean updateByElderId(ElderlyGovBuyFw record) {
        if (null != record) {
            return 1 == mapper.updateByElderId(record);
        }
        return false;
    }
    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        if(mapper.deleteByPrimaryKey(id)>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public PageResponse<ElderlyGovBuyFw> selectHandlePageList(ElderlyGovBuyFw filter, PageRequest pageRequest) {
        PageResponse<ElderlyGovBuyFw> pageResponse = new PageResponse<ElderlyGovBuyFw>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectPageListHandle(filter,pageRequest));
        pageResponse.setRecordsFiltered(mapper.countHandle(filter));
        return pageResponse;
    }
}
