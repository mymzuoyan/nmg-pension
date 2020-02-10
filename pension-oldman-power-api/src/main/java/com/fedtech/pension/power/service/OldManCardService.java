package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.OldManCard;


public interface OldManCardService extends BaseService<OldManCard> {


    /**
     * 新增、修改
     *
     * @param oldManCard
     * @return
     */
    boolean updateOldManCard(OldManCard oldManCard);
    /**
     *
     * @param oldManCard
     * @return
     */
    OldManCard selectByEntity(OldManCard oldManCard);

    /**
     * 充值
     * @param oldManCard
     * @return
     */
    boolean updateOldManCardMoney(OldManCard oldManCard);


}
