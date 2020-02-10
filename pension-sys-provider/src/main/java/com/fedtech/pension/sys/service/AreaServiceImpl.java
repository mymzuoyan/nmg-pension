package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 * @date 2016/9/9
 */
@Service(version = "1.0.0", interfaceClass = AreaService.class)
public class AreaServiceImpl extends BaseServiceImpl<Area> implements AreaService {

    @Autowired
    private AreaMapper mapper;

    @Override
    public BaseMapper<Area> getMapper() {
        return mapper;
    }

    @Override
    public List<Area> selectByParentId(Integer parentId) {
        return mapper.selectByParentId(parentId);
    }

    @Override
    public List<Area> selectAreaIdByName(String name) {
        return mapper.selectAreaIdByName(name);
    }

    @Override
    public String getDepCode(Integer areaId) {
        return mapper.getDepCode(areaId);
    }

    @Override
    public String getAreaName(Integer areaId) {
        return mapper.getAreaName(areaId);
    }

    @Override
    public Area findByDepCode(String code) {
        return mapper.findByDepCode(code);
    }

    @Override
    public Area getArea() {
        return mapper.getArea();
    }

    @Override
    public Area getAreaByNameFromCache(String name) {
        List<Area> areas = this.selectAreaIdByName(name);
        if (ObjectUtils.isNotNull(areas)) {
            return this.selectAreaIdByName(name).get(0);
        } else {
            return null;
        }
    }

    @Override
    public Map<String, Object> getArea(String areaName) {
        Map<String, Object> map = new HashMap<>();
        try {
            if (StringUtils.isBlank(areaName)) {
                return map;
            }
            String[] areaNames = areaName.split(",");
            for (int i = areaNames.length - 1; i >= 0; i--) {
                Area area = getAreaByNameFromCache(areaNames[i]);
                if (ObjectUtils.isNull(area)) {
                    continue;
                }
                map.put("areaId", area.getId());
                String aName = "";
                for (int j = 0; j <= i; j++) {
                    aName += areaNames[j] + ",";
                }
                map.put("areaName", aName.substring(0, aName.length() - 1));
                break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("areaId", "");
            map.put("areaName", "");
        }
        return map;
    }

    @Override
    public Area selectbyDistrictId(String districtId) {
        return mapper.selectbyDistrictId(districtId);
    }
}
