package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.call.vo.ServiceOrgVisitVo;
import com.fedtech.pension.org.entity.Integrity;
import com.fedtech.pension.org.entity.ServiceOrg;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface ServiceOrgMapper extends BaseMapper<ServiceOrg> {
    /**
     * 获取最大Id值
     *
     * @return
     */
    Integer selectMaxId();

    List<ServiceOrg> selectByAreaId(@Param("areaId") Integer areaId);

    /**
     * 批量导入
     *
     * @param serviceOrgs
     * @return
     */
    int insertSomeServiceOrg(@Param("serviceOrgs") List<ServiceOrg> serviceOrgs);


    /**
     * 根据名称模糊查询
     *
     * @param filter
     * @return
     */
    List<ServiceOrg> selectByInstitutionName(ServiceOrg filter);

    /**
     * 根据名称获取机构id
     *
     * @param institutionName
     * @return
     */
    ServiceOrg getOrgIdByInstitutionName(@Param("institutionName") String institutionName);


    /**
     * 根据名称和类型获取组织或者机构
     *
     * @param name
     * @param type
     * @return
     */
    ServiceOrg getByNameAndType(@Param("name") String name, @Param("type") Integer type);

    /**
     * 养老服务组织统计
     *
     * @param areaId
     * @return
     */
    List<Map> getServiceOrgStatistics1(Integer areaId);


    /**
     * 需要回访的组织分页查询
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<ServiceOrgVisitVo> selectVisitPageList(@Param("filter") ServiceOrg t, @Param("page") PageRequest pageRequest);

    /**
     * 统计筛选后的需要回访的组织数据
     *
     * @param filter
     * @return
     */
    int countVisit(ServiceOrg filter);

    /**
     * @param id
     * @return
     */
    ServiceOrg selectPositionByPrimaryKey(@Param("id") Integer id);


    /**
     * @param integrity
     * @return
     */
    int updateScore(@Param("integrity") Integrity integrity);

    /**
     * 新增机构
     * @return
     */
    Boolean insertIns(ServiceOrg serviceOrg);

    /**
     * 新增组织
     * @return
     */
    Boolean insertOrg(ServiceOrg serviceOrg);

}