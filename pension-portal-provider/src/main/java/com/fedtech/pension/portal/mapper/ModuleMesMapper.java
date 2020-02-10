package com.fedtech.pension.portal.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.portal.entity.ModuleMes;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/12
 */
public interface ModuleMesMapper extends BaseMapper<ModuleMes> {

    /**
     * 按类型分组，获取每一组前top个
     *
     * @param top
     * @return
     */
    List<ModuleMes> selectTopNByModule(@Param("top") Integer top);

    /**
     * 获取特定类型的最新新闻
     *
     * @param moduleId
     * @return
     */
    List<ModuleMes> selectTopNByModuleId(@Param("moduleId") Integer moduleId, @Param("count") Integer count);

    /**
     * 获取count个置顶文章
     *
     * @param count
     * @return
     */

    List<ModuleMes> selectPutTopMes(@Param("count") Integer count);


    /**
     * 获取指定一个新闻的前几个或后几个
     *
     * @param id
     * @param moduleId
     * @param n
     * @param topOrLast
     * @return
     */
    List<ModuleMes> selectTopOrLastN(@Param("id") Integer id, @Param("moduleId") Integer moduleId, @Param("n") Integer n, @Param("topOrLast") String topOrLast);

    /**
     * 获取最大id
     *
     * @return
     */
    int selectMaxId();

    /**
     * 审核
     *
     * @param ids
     * @return
     */
    int verifyModuleMeses(@Param("ids") List<Integer> ids);

}
