package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.KeyWork;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface KeyWorkMapper extends BaseMapper<KeyWork> {

    /**
     * 根据类型获取次数
     *
     * @return
     */
  List<Map<String, Object>> getCountByType(@Param("filter") KeyWork filter);

}