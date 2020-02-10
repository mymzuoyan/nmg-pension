package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.portal.entity.ModuleMes;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/12
 */
public interface ModuleMesService extends BaseService<ModuleMes> {

    /**
     * 按类型分组，获取每一组前top个
     *
     * @param top
     * @return
     */
    List<ModuleMes> selectTopNByModule(Integer top);

    /**
     * 获取特定类型的最新新闻
     *
     * @param moduleId
     * @return
     */
    List<ModuleMes> selectTopNByModuleId(Integer moduleId, Integer count);

    /**
     * 获取count个置顶文章
     *
     * @param count
     * @return
     */

    List<ModuleMes> selectPutTopMes(Integer count);

    /**
     * 获取指定一个新闻的前几个或后几个
     *
     * @param id
     * @param moduleId
     * @param n
     * @param topOrLast
     * @return
     */
    List<ModuleMes> selectTopOrLastN(Integer id, Integer moduleId, Integer n, String topOrLast);


    /**
     * 获取最大id
     *
     * @return
     */
    int selectMaxId();


    /**
     * 批量审核
     * @param ids
     * @return
     */
    boolean verifyModuleMeses(List<Integer> ids);

}
