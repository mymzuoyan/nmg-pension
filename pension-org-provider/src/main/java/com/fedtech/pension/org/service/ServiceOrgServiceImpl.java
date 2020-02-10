package com.fedtech.pension.org.service;


import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.data.Point;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.GeoUtils;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.MD5;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.call.vo.ServiceOrgVisitVo;
import com.fedtech.pension.org.entity.Integrity;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.mapper.ServiceOrgMapper;
import com.fedtech.pension.org.quantity.ServiceOrgTypeQuantity;
import com.fedtech.pension.org.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.EmailService;
import com.fedtech.pension.sys.service.UserRoleService;
import com.fedtech.pension.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Administrat  or
 * @date 2016/9/9
 */
@Service(interfaceClass = ServiceOrgService.class, version = "1.0.0", retries = 0, timeout = 600000)
public class ServiceOrgServiceImpl extends BaseServiceImpl<ServiceOrg> implements ServiceOrgService {

    @Autowired
    private ServiceOrgMapper serviceOrgMapper;
    @Autowired
    private ServiceOrgLocationService serviceOrgLocationService;
    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Reference(version = "1.0.0")
    private AreaService areaService;
    @Reference(version = "1.0.0")
    private UserService userService;
    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;
    @Reference(version = "1.0.0", timeout = 60000, retries = 0)
    private EmailService emailService;

    @Value("${baidu.ak}")
    private String ak;

    private static String PASSWORD = "123456";
    private static int currentNum = 1;

    private static String BAIDU_API_GEOCODING = "";

    //机构账号前缀
    private static String INSTITUTIONCODE = "jg";
    //组织前缀
    private static String SERVICEORGCODE = "zz";

    @Override
    public BaseMapper<ServiceOrg> getMapper() {
        return serviceOrgMapper;
    }


    @Override
    public boolean insert(ServiceOrg record) {
        if (super.insert(record)) {
            ServiceOrgLocation serviceOrgLocation = new ServiceOrgLocation();
            serviceOrgLocation = updateCacheObject(record, serviceOrgLocation);
            redisServiceOrgLocationUtil.putServiceOrgLocation(record.getId(), serviceOrgLocation);
            return true;
        }
        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateByPrimaryKeySelective(ServiceOrg record) {
        if (super.updateByPrimaryKeySelective(record)) {
            if (record.getAddress() == null) {
                return true;
            }
            String address = record.getAddress();
            JSONObject jsonObject = addressToLatLng(address);
            try {
                uploadLocaton(record, jsonObject);
            } catch (Exception e) {
                e.printStackTrace();
            }
            ServiceOrgLocation cache = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(record.getId());
            if (ObjectUtils.isNotNull(cache)) {
                cache = updateCacheObject(record, cache);
                redisServiceOrgLocationUtil.putServiceOrgLocation(record.getId(), cache);
            }
            if (ObjectUtils.isNotNull(record.getInstitutionName())) {
                //更新用户组织的名称
                userService.updateUserServiceOrgName(record.getId(), record.getInstitutionName());
                return true;
            }
            return true;
        }
        return false;
    }


    @Override
    public boolean updateLocation(ServiceOrg record) {
        String address = record.getAddress();
        try {
            JSONObject jsonObject = addressToLatLng(address);
            uploadLocaton(record, jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
        ServiceOrgLocation cache = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(record.getId());
        if (ObjectUtils.isNotNull(cache)) {
            cache = updateCacheObject(record, cache);
            redisServiceOrgLocationUtil.putServiceOrgLocation(record.getId(), cache);
        }
        return true;
    }


    public JSONObject addressToLatLng(String address) {
        JSONObject jsonObject = null;
        BAIDU_API_GEOCODING = "http://api.map.baidu.com/geocoder/v2/?address=ADDRESS&output=json&ak=AK&callback=showLocation";
        BAIDU_API_GEOCODING = BAIDU_API_GEOCODING.replace("AK", ak).replace("ADDRESS", address);
        String str = HttpRequest.sendGet(BAIDU_API_GEOCODING, "");
        System.out.println("------------:" + BAIDU_API_GEOCODING);
        System.out.println("------------:" + str);
        try {
            jsonObject = JSON.parseObject(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }


    public void uploadLocaton(ServiceOrg s, JSONObject jsonObject) throws Exception {
        ServiceOrgLocation serviceOrgLocation = new ServiceOrgLocation();
        serviceOrgLocation.setServiceOrgId(s.getId());
        int status = jsonObject.getInteger("status");
        if (status == 0) {
            //成功
            JSONObject result = jsonObject.getJSONObject("result");
            JSONObject location = result.getJSONObject("location");
            Double lat = location.getDouble("lat");
            Double lng = location.getDouble("lng");
            serviceOrgLocation.setLat(lat);
            serviceOrgLocation.setLng(lng);
            serviceOrgLocationService.updateOrInsertLocation(serviceOrgLocation);

        }
    }

    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        if (super.deleteByPrimaryKey(id)) {
            redisServiceOrgLocationUtil.removeServiceOrgLocation(id);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteSomeMsg(List<Integer> idList) {
        if (super.deleteSomeMsg(idList)) {
            //todo 更新缓存
            for (Integer id : idList) {
                redisServiceOrgLocationUtil.removeServiceOrgLocation(id);
            }
            return true;
        }
        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public User insertAndCreateUser(ServiceOrg serviceOrg) {
        insert(serviceOrg);
        return createUser(serviceOrg);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public User updateAndCreateUser(ServiceOrg serviceOrg) {
        super.updateByPrimaryKeySelective(serviceOrg);
        return createUser(serviceOrg);
    }


    public User createUser(ServiceOrg serviceOrg) {
        boolean b = false;
        //生成账号
        User user = new User();
        int roleId = RoleType.ZuAdmin.getId();
        String lastName = userService.selectLastZuAdmin(SERVICEORGCODE + serviceOrg.getZipcode(), roleId);
        if (ServiceOrgTypeQuantity.INSTITUTION.equals(serviceOrg.getType())) {
            roleId = RoleType.JgAdmin.getId();
            lastName = userService.selectLastZuAdmin(INSTITUTIONCODE + serviceOrg.getZipcode(), roleId);
        }

        if (!ObjectUtils.isNull(lastName)) {
            if (ServiceOrgTypeQuantity.INSTITUTION.equals(serviceOrg.getType())) {
                if (lastName.indexOf(INSTITUTIONCODE) >= 0) {
                    lastName = lastName.substring(INSTITUTIONCODE.length());
                }
                user.setLogin_name(INSTITUTIONCODE + (Long.parseLong(lastName) + 1) + "");
            } else {
                if (lastName.indexOf(SERVICEORGCODE) >= 0) {
                    lastName = lastName.substring(SERVICEORGCODE.length());
                }
                user.setLogin_name(SERVICEORGCODE + (Long.parseLong(lastName) + 1) + "");
            }
        } else {
            if (ServiceOrgTypeQuantity.INSTITUTION.equals(serviceOrg.getType())) {
                user.setLogin_name(INSTITUTIONCODE + serviceOrg.getZipcode() + "0001");
            } else {
                user.setLogin_name(SERVICEORGCODE + serviceOrg.getZipcode() + "0001");
            }
        }

        user.setNick_name(serviceOrg.getInstitutionName());
        user.setPhone(serviceOrg.getMobile());
        user.setLinkName(serviceOrg.getApplyName());
        user.setServiceOrgId(serviceOrg.getId().toString());
        user.setServiceOrgName(serviceOrg.getInstitutionName());
        user.setAreaId(serviceOrg.getAreaId());
        user.setAreaName(serviceOrg.getAreaName());
        String password = PASSWORD;
        user.setPass_word(MD5.MD5Encode(password));
        user.setCreate_time(System.currentTimeMillis());
        user.setStatus(1);
        user = userService.insertBackId(user);
        if (ObjectUtils.isNotNull(user.getUid())) {
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUid());
            if (ServiceOrgTypeQuantity.INSTITUTION.equals(serviceOrg.getType())) {
                //养老机构
                userRole.setRoleId(RoleType.JgAdmin.getId());
            } else {
                userRole.setRoleId(RoleType.ZuAdmin.getId());
            }
            if (userRoleService.insert(userRole)) {
                //发送
                user.setPass_word(password);
                b = true;
            }
        }
        if (b) {
            return user;
        } else {
            return null;
        }
    }


    @Override
    public Integer selectMaxId() {
        Integer id = serviceOrgMapper.selectMaxId();
        return id;
    }

    @Override
    public List<ServiceOrg> selectByAreaId(Integer areaId) {
        return serviceOrgMapper.selectByAreaId(areaId);
    }


    @Override
    public Map<String, List<Integer>> getStatisticsByAreaAndLevel(Integer areaId) {
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        Area area = areaService.selectByPrimaryKey(areaId);
        List<Area> level1Areas = areaService.selectByParentId(areaId);
        if (area.getLevel() > 1) {
            level1Areas.add(0, area);
        }
        Map<String, List<Integer>> map = new LinkedHashMap<String, List<Integer>>();
        /**
         * 各区各等级统计情况
         */
        Integer[] allcount = {0, 0, 0, 0, 0, 0};
        for (Area a : level1Areas) {
            Integer[] count = {0, 0, 0, 0, 0, 0};
            for (Integer sid : ids) {
                ServiceOrgLocation s = (ServiceOrgLocation) hashMap.get(sid);
                if (StringUtils.isEmpty(s.getAreaName())) {
                    continue;
                }
                if (s.getAreaName().indexOf(a.getName()) >= 0) {
                    count[0]++;//数量
                    allcount[0]++;
                    if (s.getGradeDictId() != null) {
                        switch (s.getGradeDictId()) {
                            case 4:
                                count[1]++;//AAAAA
                                allcount[1]++;//AAAAA
                                break;
                            case 3:
                                count[2]++;//AAAA
                                allcount[2]++;//AAAA
                                break;
                            case 2:
                                count[3]++;//AAA
                                allcount[3]++;//AAA
                                break;
                            case 1:
                                count[4]++;//AA
                                allcount[4]++;//AA
                                break;
                            case 0:
                                count[5]++;//A
                                allcount[5]++;//A
                                break;
                        }
                    }
                }
                map.put(a.getName(), Arrays.asList(count));
            }
        }
        return map;
    }

    @Override
    public List<Integer> getStatisticsByLevel() {
        List<ServiceOrg> allService = this.getAllRecode(null);
        /**
         * 各等级统计情况
         */
        Integer[] count = {0, 0, 0, 0, 0, 0};
        for (ServiceOrg s : allService) {
            count[0]++;//数量
            if (s.getGradeDictId() != null) {
                switch (s.getGradeDictId()) {
                    case 4:
                        count[1]++;//AAAAA
                        break;
                    case 3:
                        count[2]++;//AAAA
                        break;
                    case 2:
                        count[3]++;//AAA
                        break;
                    case 1:
                        count[4]++;//AA
                        break;
                    case 0:
                        count[5]++;//A
                        break;
                }
            }
        }
        return Arrays.asList(count);
    }

    @Override
    public Map<String, Integer> getStatisticsByArea() {
        List<ServiceOrg> allService = this.getAllRecode(null);
        List<Area> level1Areas = areaService.selectByParentId(1);
        Map<String, Integer> result = new LinkedHashMap<>();//各区各等级统计情况
        for (Area area : level1Areas) {
            Integer count = 0;
            for (ServiceOrg s : allService) {
                if (StringUtils.isEmpty(s.getAreaName())) {
                    continue;
                }
                if (s.getAreaName().indexOf(area.getName()) >= 0) {
                    count++;
                }
            }
            result.put(area.getName(), count);
        }
        return result;
    }

    @Override
    public Map<String, Map<String, List<Integer>>> serviceOrgStatistics(String institutionTypeDictId) {
        Map<String, Map<String, List<Integer>>> result = new LinkedHashMap<>();
        ServiceOrg filter = new ServiceOrg();
        filter.setInstitutionTypeDictId(institutionTypeDictId);
        List<ServiceOrg> allService = this.getAllRecode(filter);
        List<Area> level1Areas = areaService.selectByParentId(1);
        Map<String, List<Integer>> map = new LinkedHashMap<String, List<Integer>>();//各区各等级统计情况
        Map<String, List<Integer>> map2 = new LinkedHashMap<String, List<Integer>>();//各区各单位性质统计情况
        /**
         * 各区各等级统计情况
         */
        Integer[] allcount = {0, 0, 0, 0, 0, 0};
        for (Area a : level1Areas) {
            Integer[] count = {0, 0, 0, 0, 0, 0};
            Integer[] count2 = {0, 0, 0, 0};
            for (ServiceOrg s : allService) {
                if (StringUtils.isEmpty(s.getAreaName())) {
                    continue;
                }
                if (s.getAreaName().indexOf(a.getName()) >= 0) {
                    count[0]++;//数量
                    count2[0]++;
                    allcount[0]++;
                    if (s.getGradeDictId() != null) {
                        switch (s.getGradeDictId()) {
                            case 4:
                                count[1]++;//AAAAA
                                allcount[1]++;//AAAAA
                                break;
                            case 3:
                                count[2]++;//AAAA
                                allcount[2]++;//AAAA
                                break;
                            case 2:
                                count[3]++;//AAA
                                allcount[3]++;//AAA
                                break;
                            case 1:
                                count[4]++;//AA
                                allcount[4]++;//AA
                                break;
                            case 0:
                                count[5]++;//A
                                allcount[5]++;//A
                                break;
                            default:
                                break;
                        }
                    }

                    if (s.getInstProp() != null) {
                        switch (s.getInstProp()) {
                            case 3:
                                count2[1]++;//公建民营
                                break;
                            case 2:
                                count2[2]++;//民办
                                break;
                            case 1:
                                count2[3]++;//公办
                                break;
                            default:
                                break;
                        }
                    }

                }
                map.put(a.getName(), Arrays.asList(count));
                map2.put(a.getName(), Arrays.asList(count2));
            }
        }
        result.put("各区各等级统计情况", map);
        result.put("各区各单位性质统计情况", map2);
        return result;
    }


    @Override
    public Map<String, List<Integer>> getStatisticsByTypeAndLevel() {
        Map<String, List<Integer>> result = new LinkedHashMap<>();
        ServiceOrg query = new ServiceOrg();
        query.setType(1);
        List<ServiceOrg> allService = this.getAllRecode(query);
        /**
         * 各服务类型统计情况
         */
        Integer[] count2 = {0, 0, 0, 0, 0, 0, 0, 0, 0};
        String[] strs = {"1", "2", "3", "9", "4", "5", "6", "7", "8"};
        for (ServiceOrg s : allService) {
            String institutionTypeDictId = s.getInstitutionTypeDictId();
            if (ObjectUtils.isNotNull(institutionTypeDictId)) {
                for (int i = 0; i < strs.length; i++) {
                    if (institutionTypeDictId.contains(strs[i])) {
                        count2[i]++;
                        break;
                    }
                }
            }
        }
        /**
         * 各等级统计情况
         */
        Integer[] count = {0, 0, 0, 0, 0, 0};
        for (ServiceOrg s : allService) {
            count[0]++;//数量
            if (s.getGradeDictId() != null && s.getType().equals(1)) {
                switch (s.getGradeDictId()) {
                    case 3:
                        count[2]++;//AAAA
                        break;
                    case 2:
                        count[3]++;//AAA
                        break;
                    case 1:
                        count[4]++;//AA
                        break;
                    case 0:
                        count[5]++;//A
                        break;
                    case 4:
                        count[1]++;//AAAAA
                        break;
                }
            }
        }
        result.put("各区各等级统计情况", Arrays.asList(count));
        result.put("各区各服务类型统计情况", Arrays.asList(count2));
        return result;
    }


    @Override
    public Integer insertSomeServiceOrg(List<ServiceOrg> serviceOrgs) {
        Integer result = serviceOrgMapper.insertSomeServiceOrg(serviceOrgs);
        return result;
    }


    @Override
    public List<ServiceOrgLocation> getServiceOrgsByCircle(double lat, double lng, double radius) {
        List<ServiceOrgLocation> serviceOrgLocations = new ArrayList<>();
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) hashMap.get(id);
            if (ObjectUtils.isNull(serviceOrgLocation.getLat()) || ServiceOrgTypeQuantity.INSTITUTION.equals(serviceOrgLocation.getType())) {
                continue;
            }
            if (ObjectUtils.isNotNull(serviceOrgLocation.getLat()) && ObjectUtils.isNotNull(serviceOrgLocation.getLng()) && serviceOrgLocation.getLat() != 0 && serviceOrgLocation.getLng() != 0) {
                Point point = new Point(serviceOrgLocation.getLat(), serviceOrgLocation.getLng());
                Point center = new Point(lat, lng);
                if (GeoUtils.isPointInCircle(point, center, radius)) {
                    serviceOrgLocations.add(serviceOrgLocation);
                }
            }
        }
        return serviceOrgLocations;
    }

    @Override
    public List<ServiceOrg> selectByInstitutionName(ServiceOrg filter) {
        return serviceOrgMapper.selectByInstitutionName(filter);
    }

    @Override
    public ServiceOrg getOrgIdByInstitutionName(String institutionName) {
        return serviceOrgMapper.getOrgIdByInstitutionName(institutionName);
    }

    @Override
    public ServiceOrg getByNameAndType(String name, Integer type) {
        return serviceOrgMapper.getByNameAndType(name, type);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteAndNotice(ServiceOrg serviceOrg, String content) {
        boolean b = false;
        if (ObjectUtils.isNotNull(serviceOrg.getId())) {
            if (this.deleteByPrimaryKey(serviceOrg.getId())) {
                try {
                    sendUserNoticeEmail(serviceOrg, content);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                b = true;
            }
        }
        return b;
    }


    @Override
    public void sendUserAccountEmail(ServiceOrg serviceOrg, User user) throws Exception {
        Date createTime = serviceOrg.getCreateTime();
        SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
        String time = sdf.format(createTime);
        String text = "<html><head></head><body><p>您于" + time + "申请的内蒙古市养老服务综合信息平台组织帐号，经审核已申请成功。</p>" +
                "<p>平台网址为：<a href='http://121.46.4.79:8080/admin/index.html'>http://121.46.4.79:8080/admin/index.html</a></p>" +
                "<p>用户账号：" + user.getLogin_name() + "</p>" +
                "<p>初始密码：" + user.getPass_word() + "</p>" +
                "<p>登录后请及时修改密码并完善组织资料。</p>" +
                "</body></html>";
        emailService.send(serviceOrg.getApplyEmail(), "内蒙古市养老服务综合信息平台-用户账号", text);
    }


    public void sendUserNoticeEmail(ServiceOrg serviceOrg, String content) throws Exception {
        Date createTime = serviceOrg.getCreateTime();
        SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
        String time = sdf.format(createTime);
        String text = "<html><head></head><body><p>您于" + time + "申请的内蒙古市养老服务综合信息平台组织帐号，审核不通过。</p>" +
                "<p>原因：" + content + "。</p>" +
                "<p>请重新申请。</p>" +
                "</body></html>";
        emailService.send(serviceOrg.getApplyEmail(), "内蒙古市养老服务综合信息平台", text);
    }


    public ServiceOrgLocation updateCacheObject(ServiceOrg record, ServiceOrgLocation cache) {


        if (ObjectUtils.isNotNull(record.getId())) {
            cache.setServiceOrgId(record.getId());
        }

        if (ObjectUtils.isNotNull(record.getInstitutionName())) {
            cache.setServiceOrgName(record.getInstitutionName());
        }
        if (ObjectUtils.isNotNull(record.getServiceProject())) {
            cache.setServiceProject(record.getServiceProject());
        }
        if (ObjectUtils.isNotNull(record.getServiceProjectName())) {
            cache.setServiceProjectName(record.getServiceProjectName());
        }
        if (ObjectUtils.isNotNull(record.getType())) {
            cache.setType(record.getType());
        }
        if (ObjectUtils.isNotNull(record.getInstitutionTypeDictId())) {
            cache.setInstitutionTypeDictId(record.getInstitutionTypeDictId());
        }
        if (ObjectUtils.isNotNull(record.getGradeDictId())) {
            cache.setGradeDictId(record.getGradeDictId());
        }
        if (ObjectUtils.isNotNull(record.getAreaId())) {
            cache.setAreaId(record.getAreaId());
        }
        if (ObjectUtils.isNotNull(record.getAreaName())) {
            cache.setAreaName(record.getAreaName());
        }
        if (ObjectUtils.isNotNull(record.getAddress())) {
            cache.setAddress(record.getAddress());
        }
        if (ObjectUtils.isNotNull(record.getLinkMan())) {
            cache.setLinkMan(record.getLinkMan());
        }
        if (ObjectUtils.isNotNull(record.getLinkMan())) {
            cache.setLinkMan(record.getLinkMan());
        }
        if (ObjectUtils.isNotNull(record.getMobile())) {
            cache.setPhone(record.getMobile());
        }
        if (ObjectUtils.isNotNull(record.getBedCount())) {
            cache.setBedCount(record.getBedCount());
        }
        if (ObjectUtils.isNotNull(record.getBedCount())) {
            cache.setBedCount(record.getBedCount());
        }
        if (ObjectUtils.isNotNull(record.getBedEmptyCount())) {
            cache.setBedEmptyCount(record.getBedEmptyCount());
        }
        if (ObjectUtils.isNotNull(record.getBedMoney())) {
            cache.setBedMoney(record.getBedMoney());
        }
        if (ObjectUtils.isNotNull(record.getBedNurseCount())) {
            cache.setBedNurseCount(record.getBedCount());
        }
        if (ObjectUtils.isNotNull(record.getBedNurseEmptyCount())) {
            cache.setBedNurseEmptyCount(record.getBedEmptyCount());
        }
        if (ObjectUtils.isNotNull(record.getBedNurseMoney())) {
            cache.setBedNurseMoney(record.getBedNurseMoney());
        }
        if (ObjectUtils.isNotNull(record.getBedCareCount())) {
            cache.setBedCareCount(record.getBedCareCount());
        }
        if (ObjectUtils.isNotNull(record.getBedCareEmptyCount())) {
            cache.setBedCareEmptyCount(record.getBedCareEmptyCount());
        }
        if (ObjectUtils.isNotNull(record.getBedCareMoney())) {
            cache.setBedCareMoney(record.getBedCareMoney());
        }

        return cache;
    }

    @Override
    public PageResponse<ServiceOrgVisitVo> selectVisitPageList(ServiceOrg filter, PageRequest pageRequest) {
        PageResponse<ServiceOrgVisitVo> pageResponse = new PageResponse<ServiceOrgVisitVo>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(serviceOrgMapper.selectVisitPageList(filter, pageRequest));
        pageResponse.setRecordsFiltered(serviceOrgMapper.countVisit(filter));
        return pageResponse;
    }

    @Override
    public int countVisit(ServiceOrg filter) {
        return serviceOrgMapper.countVisit(filter);
    }

    @Override
    public ServiceOrg selectPositionByPrimaryKey(Integer id) {
        return serviceOrgMapper.selectPositionByPrimaryKey(id);
    }

    @Override
    public Boolean updateScore(Integrity integrity) {
        return serviceOrgMapper.updateScore(integrity) > 0;
    }

    @Override
    public Boolean insertIns(ServiceOrg serviceOrg) {
        return serviceOrgMapper.insertIns(serviceOrg);
    }

    @Override
    public Boolean insertOrg(ServiceOrg serviceOrg) {
        return serviceOrgMapper.insertOrg(serviceOrg);
    }
}
