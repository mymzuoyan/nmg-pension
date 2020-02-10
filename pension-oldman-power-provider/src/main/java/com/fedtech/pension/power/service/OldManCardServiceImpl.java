package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.OldManCard;
import com.fedtech.pension.power.mapper.OldManCardMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = OldManCardService.class, version = "1.0.0")
public class OldManCardServiceImpl extends BaseServiceImpl<OldManCard> implements OldManCardService {
    @Autowired
    private OldManCardMapper oldManCardMapper;

    @Override
    public BaseMapper<OldManCard> getMapper() {
        return oldManCardMapper;
    }

    @Override
    public boolean updateOldManCard(OldManCard oldManCard) {
        if (null != oldManCard) {
            if (oldManCard.getId() != null)
                return 1 == oldManCardMapper.updateByPrimaryKeySelective(oldManCard);
            else {
                return 1 == oldManCardMapper.insert(oldManCard);
            }
        }
        return true;
    }

    @Override
    public OldManCard selectByEntity(OldManCard oldManCard) {
                return  oldManCardMapper.selectByEntity(oldManCard);
    }

    @Override
    public boolean updateOldManCardMoney(OldManCard oldManCard) {
        if (null != oldManCard) {
            oldManCardMapper.updateOldManCardMoney(oldManCard);
        }
        return true;
    }


}
