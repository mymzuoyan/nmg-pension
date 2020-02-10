package com.fedtech.pension.sys.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.Area;

import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface AreaService extends BaseService<Area> {

    /**
     * 根据父级来获取
     *
     * @param parentId
     * @return
     */
    List<Area> selectByParentId(Integer parentId);

    /**
     * 根据姓名来获取
     *
     * @param name
     * @return
     */
    List<Area> selectAreaIdByName(String name);

    /**
     * 根据代码获取
     *
     * @param code
     * @return
     */
    Area findByDepCode(String code);

    /**
     * 区域数据推送接口
     *
     * @return
     */
    Area getArea();

    /**
     * 获取代码
     *
     * @param areaId
     * @return
     */
    String getDepCode(Integer areaId);

    /**
     * 获取区域全称
     *
     * @param areaId
     * @return
     */
    String getAreaName(Integer areaId);

    /**
     * 根据name从缓存中获取
     *
     * @param name
     * @return
     */
    Area getAreaByNameFromCache(String name);



    /**
     * 处理所属区域---------->南京市,栖霞区,西岗街道
     *
     * @param areaName
     * @return
     */
    Map<String, Object> getArea(String areaName);


    /**
     * 根据区域编码查询区域信息
     * @param districtId
     * @return
     */
    Area selectbyDistrictId(String districtId);

}
