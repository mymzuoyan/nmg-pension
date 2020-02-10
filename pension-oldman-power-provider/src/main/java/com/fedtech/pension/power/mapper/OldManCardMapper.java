package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.OldManCard;

public interface OldManCardMapper extends BaseMapper<OldManCard> {


    /**
     *
     * @param oldManCard
     * @return
     */
    OldManCard selectByEntity(OldManCard oldManCard);

    Boolean updateOldManCardMoney(OldManCard oldManCard);

}
