package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.call.vo.ServiceOrgVisitVo;
import com.fedtech.pension.org.entity.Integrity;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.sys.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 * @date 2016/9/9
 * 服务组织
 */
public interface ServiceOrgService extends BaseService<ServiceOrg> {

    /**
     * 获取数据库中最大的Id
     *
     * @return
     */
    Integer selectMaxId();

    /**
     * 根据父级来获取
     *
     * @param areaId
     * @return
     */
    List<ServiceOrg> selectByAreaId(Integer areaId);


    /**
     * 更新组织地理位置
     * @param record
     * @return
     */
    boolean updateLocation(ServiceOrg record);

    /**
     * 组织数量统计（单位性质和组织等级）
     *
     * @return
     */
    Map<String, Map<String, List<Integer>>> serviceOrgStatistics(String institutionTypeDictId);

    /**
     * 批量添加组织
     *
     * @param serviceOrgs
     * @return
     */
    Integer insertSomeServiceOrg(List<ServiceOrg> serviceOrgs);

    /**
     * 批量删除组织
     *
     * @param idList
     * @return
     */
   /* boolean deleteSomeMsg(List<Integer> idList);*/

    /**
     * 添加组织并且生成账号
     *
     * @param serviceOrg
     * @return
     */
    User insertAndCreateUser(ServiceOrg serviceOrg);

    /**
     * 审核组织并且生成账号
     *
     * @param serviceOrg
     * @return
     */
    User updateAndCreateUser(ServiceOrg serviceOrg);

    /**
     * 各区各等级组织数量
     *
     * @return
     */
    Map<String, List<Integer>> getStatisticsByAreaAndLevel(Integer areaId);

    /**
     * 各等级组织数量
     *
     * @return
     */
    List<Integer> getStatisticsByLevel();

    /**
     * 各区组织数量
     *
     * @return
     */
    Map<String, Integer> getStatisticsByArea();


    /**
     * 组织数量统计（服务类型和组织等级）
     *
     * @return
     */
    Map<String, List<Integer>> getStatisticsByTypeAndLevel();


    /**
     * 需要回访的组织分页查询
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<ServiceOrgVisitVo> selectVisitPageList(ServiceOrg filter, PageRequest pageRequest);

    /**
     * 需要回访的组织数量
     *
     * @param filter
     * @return
     */
    int countVisit(ServiceOrg filter);


    /**
     * 获取圆内组织
     *
     * @param lat
     * @param lng
     * @param radius
     * @return
     */
    List<ServiceOrgLocation> getServiceOrgsByCircle(double lat, double lng, double radius);

    /**
     * 根据组织姓名查询组织
     *
     * @param filter
     * @return
     */
    List<ServiceOrg> selectByInstitutionName(ServiceOrg filter);

    /**
     * 根据机构名称获取id
     *
     * @param institutionName
     * @return
     */
    ServiceOrg getOrgIdByInstitutionName(String institutionName);


    /**
     * 根据名称和类型获取组织或者机构
     *
     * @param name
     * @param type
     * @return
     */
    ServiceOrg getByNameAndType(String name, Integer type);

    /**
     * 审核通知
     *
     * @param serviceOrg
     * @return
     */
    void sendUserAccountEmail(ServiceOrg serviceOrg, User user) throws Exception;

    /**
     * 审核不通过，并通知
     *
     * @param serviceOrg
     * @return
     */
    boolean deleteAndNotice(ServiceOrg serviceOrg, String content);

    /**
     *
     * @param id
     * @return
     */
    ServiceOrg  selectPositionByPrimaryKey(Integer id);



    /**
     * 更新分数
     * @param integrity
     * @return
     */
    Boolean updateScore(Integrity integrity);


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
