package com.fedtech.pension.volunteer.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.volunteer.entity.VolStoreOrDraw;

/**
 * @author gengqiang
 */
public interface VolStoreOrDrawMapper extends BaseMapper<VolStoreOrDraw> {

        Integer countVolunteers(String organizationName);
}