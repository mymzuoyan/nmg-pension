
package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyMsgApp;

import java.util.List;

/**
 * 老人基础信息
 *
 * @author gengqiang
 */

public interface ElderlyMsgAppService extends BaseService<ElderlyMsgApp> {
    public boolean insert(ElderlyMsgApp record) ;

    public List<ElderlyMsgApp> selectCountList(ElderlyMsgApp elderlyMsgApp);
}
