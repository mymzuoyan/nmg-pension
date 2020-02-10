package com.fedtech.pension.controller.admin.lovebracelet;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.OAuthUtil;
import com.fedtech.commons.utils.Rc4Utils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.nurse.entity.NurseAlarm;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import com.fedtech.pension.nurse.service.NurseAlarmService;
import com.fedtech.pension.nurse.service.ServiceOrgNurseElderlyService;
import com.fedtech.pension.redis.RedisCacheUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by zhnn on 2018/3/16.
 */
@Controller
@RequestMapping("/admin/api/loveBracelet/")
public class LoveBraceletApiController extends BaseController {
    @Value("${lovebracelet.apikey}")
    private String APIKEY = "901399ed1ec94b9f8cae537070248ad2";
    @Value("${lovebracelet.apisecret}")
    private String APISECRET = "7b7e1cd8ce0f49278cc07d8009e017e4";
    @Value("${lovebracelet.url}")
    private String URL = "http://218.5.96.6:";
    @Value("${lovebracelet.port.api}")
    private Integer PORTAPI = 8300;
    @Value("${lovebracelet.port.register}")
    private Integer PORTREGISTER = 8302;
    @Value("${lovebracelet.port.ud}")
    private Integer PORTUD = 8304;
    @Value("${lovebracelet.port.push}")
    private Integer PORTPUSH = 30787;
    @Value("${lovebracelet.username}")
    private String USERNAME = "jskl_18550011972";
    @Value("${lovebracelet.password}")
    private String PASSWORD = "1234";

    @Reference(version = "1.0.0")
    private ServiceOrgNurseElderlyService serviceOrgNurseElderlyService;

    @Reference(version = "1.0.0")
    private NurseAlarmService nurseAlarmService;

    @Autowired
    private RedisCacheUtils redisCacheUtils;

    /**
     * 帐号注册(已经注册成功，不需要再次调用)
     *
     * @param acc 账号 ^shhs_1\d{10}$ shhs_13276588627 shhs_18068187726
     * @param mp  对应手机号 13276588627               18068187726
     * @return
     */
    @RequestMapping("accountRegistration")
    @ResponseBody
    public JsonResult accountRegistration(String acc, String mp) {
        JsonResult result = new JsonResult();
        TreeMap<String, String> treeMap = new TreeMap<>();
        treeMap.put("acc", acc);
        treeMap.put("mp", mp);
        treeMap.put("pwd", "1234");
        String plain = Rc4Utils.doRc4(APIKEY, APISECRET, treeMap);
        String content = HttpRequest.sendPost("http://218.5.96.6:8302/3rd_reg", plain);
        JSONObject jsonObject = JSONObject.parseObject(content);
        System.out.println(jsonObject);
        if (jsonObject.get("state").equals(0)) {
            // 注册成功 返回注册账号 手机号码 密码
            result.markSuccess("注册成功", treeMap);
        } else if (jsonObject.get("state").equals(1)) {
            result.markError("解密出错");
        } else if (jsonObject.get("state").equals(2)) {
            result.markError("帐号参数缺失");
        } else if (jsonObject.get("state").equals(3)) {
            result.markError("手机号参数缺失");
        } else if (jsonObject.get("state").equals(4)) {
            result.markError("密码参数缺失");
        } else if (jsonObject.get("state").equals(5)) {
            result.markError("手机号需短信验证（该状态仅出现于直接使用凌拓帐号的情况）");
        } else if (jsonObject.get("state").equals(6)) {
            result.markError("帐号重复");
        } else if (jsonObject.get("state").equals(7)) {
            result.markError("帐号格式错误");
        } else if (jsonObject.get("state").equals(8)) {
            result.markError("帐号来源错误，非oem帐号");
        } else if (jsonObject.get("state").equals(9)) {
            result.markError("帐号格式禁止为email");
        } else {
            result.markError("绑定失败");
        }
        return result;
    }


    /**
     * 获取令牌
     *
     * @param username 注册账号
     * @param pwd      密码
     * @return
     */
    @RequestMapping(value = "getToken")
    @ResponseBody
    public JsonResult getToken(String username, String pwd) {
        JsonResult result = new JsonResult();
        try {
            String url = "http://218.5.96.6:8302/shanxi_tk";
            String params = "username=" + username + "&pwd=" + pwd + "&api_key=" + APIKEY;
            System.out.println("token参数:" + params);
            result.markSuccess("success", HttpRequest.sendGet(url, params));
        } catch (Exception ex) {
            ex.printStackTrace();
            result.markError("获取失败！");
        }
        return result;
    }

    /**
     * 上报实网卡号
     *
     * @param pid 设备id
     * @param ak  设备id秘钥
     * @param mp  上报的11位手机号码
     * @return
     */
    @RequestMapping("patchTid")
    @ResponseBody
    public JsonResult patchTid(String pid, String ak, String mp) {
        JsonResult result = new JsonResult();
        //签名计算 传几个参数需要添加几个参数
        HashMap<String, String> dict = new HashMap<String, String>();
        dict.put("pid", pid);
        dict.put("ak", ak);
        dict.put("no", mp);
        String sign = OAuthUtil.getSignature(URL + PORTAPI + "/dev/patch_tid", dict, "POST", APIKEY, APISECRET);
        String params = "_sign=" + sign + "&_tk=" + getToken(USERNAME, PASSWORD).getData() + "&no=" + mp + "&pid=" + pid + "&ak=" + ak;
        String url = URL + PORTAPI + "/dev/patch_tid";
        try {
            String content = HttpRequest.sendPost(url, params);
            if (StringUtils.isEmpty(content)) {
                result.markSuccess("上报实网卡号成功", null);
            } else {
                result.markError("上报实网卡号失败");
            }
        } catch (Exception e) {
            result.markSuccess("上报实网卡号成功", null);
        }

        return result;
    }

    /**
     * 激活设备 将设备绑定到注册账号中
     *
     * @param pid 设备id
     * @param ak  设备id的秘钥
     * @return
     */
    @RequestMapping("bindPid")
    @ResponseBody
    public JsonResult bindPid(String pid, String ak) {
        JsonResult result = new JsonResult();
        HashMap<String, String> dict = new HashMap<String, String>();
        dict.put("pid", pid);
        dict.put("ak", ak);
        String sign = OAuthUtil.getSignature(URL + PORTAPI + "/dev/bind_pid", dict, "POST", APIKEY, APISECRET);
        String params = "_sign=" + sign + "&_tk=" + getToken(USERNAME, PASSWORD).getData() + "&pid=" + pid + "&ak=" + ak;
        String content = HttpRequest.sendPost(URL + PORTAPI + "/dev/bind_pid", params);
        JSONObject jsonObject = JSONObject.parseObject(content);
        if (StringUtils.isEmpty(jsonObject.getString("state")) || jsonObject.getString("state").equals(0)) {
            // 注册成功 返回注册账号 手机号码 密码
            result.markSuccess("绑定成功", jsonObject);
        } else if (jsonObject.get("state").equals(1)) {
            result.markSuccess("绑定成功", jsonObject);
            //绑定是异步操作。这只是说明绑定的命令发给设备了，设备是不是成功绑定，是需要拉下账号下设备是不是有了。
            /*result.markError("绑定过程中，常见于需短信回执的设备，例如pt30");*/
        } else if (jsonObject.get("state").equals(2)) {
            result.markError("工厂未登记");
        } else if (jsonObject.get("state").equals(3)) {
            result.markError("已被其他人绑定");
        } else if (jsonObject.get("state").equals(4)) {
            result.markError("二维码格式错误");
        } else if (jsonObject.get("state").equals(5)) {
            result.markError("api_key验证失败，app和帐号不匹配");
        } else if (jsonObject.get("state").equals(6)) {
            result.markError("app和设备不匹配");
        } else {
            result.markError("绑定失败");
        }
        return result;
    }

    /**
     * 解绑
     *
     * @param pid 设备id
     * @return
     */
    @RequestMapping("unbind")
    @ResponseBody
    public JsonResult unbind(String pid) {
        JsonResult result = new JsonResult();
        HashMap<String, String> dict = new HashMap<String, String>();
        dict.put("id", pid);
        String sign = OAuthUtil.getSignature(URL + PORTAPI + "/dev/unbind", dict, "POST", APIKEY, APISECRET);
        String params = "_sign=" + sign + "&_tk=" + getToken(USERNAME, PASSWORD).getData() + "&id=" + pid;
        String content = HttpRequest.sendPost(URL + PORTAPI + "/dev/unbind", params);
        JSONObject jsonObject = JSONObject.parseObject(content);
        if (StringUtils.isEmpty(jsonObject.get("state").toString())) {
            // 注册成功 返回注册账号 手机号码 密码
            result.markSuccess("解绑成功", jsonObject);
        } else if (jsonObject.get("state").equals(1)) {
            result.markSuccess("帐号格式不对", jsonObject);
            //绑定是异步操作。这只是说明绑定的命令发给设备了，设备是不是成功绑定，是需要拉下账号下设备是不是有了。
            /*result.markError("绑定过程中，常见于需短信回执的设备，例如pt30");*/
        } else if (jsonObject.get("state").equals(2)) {
            result.markError("设备id格式不正确/api_key来源非法");
        } else if (jsonObject.getString("state").equals(3)) {
            // 注册成功 返回注册账号 手机号码 密码
            result.markSuccess("已经是解绑状态", jsonObject);
        } else if (jsonObject.get("state").equals(4)) {
            result.markError("设备不属于当前帐号");
        } else if (jsonObject.get("state").equals(5)) {
            result.markError("子帐号解关注成功");
        } else if (jsonObject.get("state").equals(6)) {
            result.markError("设备io参数以及主帐号不匹配（实际上和2有些重复）");
        } else {
            result.markError("绑定失败");
        }
        return result;
    }

    /**
     * 获取设备最新位置
     *
     * @param id 设备id
     * @param id 手机号码
     * @return
     */
    @RequestMapping("getGpsLoc")
    @ResponseBody
    public JsonResult getGpsLoc(String id, String mp) {
        JsonResult result = new JsonResult();
        List list = new ArrayList();
        HashMap<String, String> dict = new HashMap<String, String>();
        dict.put("token", "");
        String sign = OAuthUtil.getSignature(URL + PORTAPI + "/res/pt30/" + id + "/gps_loc", dict, "GET", APIKEY, APISECRET);
        String params = "_sign=" + sign + "&_tk=" + getToken(USERNAME, PASSWORD).getData() + "&token=";
        String content = HttpRequest.sendGet(URL + PORTAPI + "/res/pt30/" + id + "/gps_loc", params);
        JSONObject jsonObject = JSONObject.parseObject(content);
        jsonObject.put("pid", id);
        jsonObject.put("mp", mp);
        list.add(jsonObject);
        result.markSuccess("查询成功", list);
        return result;
    }

    /**
     * 批量绑定设备
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "信息导入")
    public JsonResult serviceOrgImport(@RequestParam("file") MultipartFile file) throws Exception {
        JsonResult result = new JsonResult();
        List<String> errorReasons = new ArrayList<>();
        List<Map<String, String>> data = new ArrayList<>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix) || "xlsx".equals(suffix)) {
                wb = WorkbookFactory.create(is);
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean enable = true;
                Row row = sheet.getRow(i);
                Map<String, String> tempData = new HashMap<String, String>();
                //设备号码（ID)
                String id = getCellValue(row.getCell(0));
                if (!StringUtils.isEmpty(id)) {
                    tempData.put("id", id.toLowerCase());
                } else {
                    errorReasons.add(String.format("第%d行设备号码为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                //手机号码
                String mp = getCellValue(row.getCell(1));
                if (!StringUtils.isEmpty(mp)) {
                    tempData.put("mp", mp);
                } else {
                    errorReasons.add(String.format("第%d行手机号码为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                //秘钥
                String key = getCellValue(row.getCell(2));

                if (!StringUtils.isEmpty(key)) {
                    tempData.put("key", key.toLowerCase());
                } else {
                    errorReasons.add(String.format("第%d行秘钥为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                if (enable) {
                    data.add(tempData);
                }
            }
        } else {
            result.markError("文件内容为空！");
        }
        if (data.size() > 0) {
            data.forEach(map -> {
                String successIds = "";
                JsonResult result1 = this.patchTid(map.get("id"), map.get("key"), map.get("mp"));
                System.out.println(result1.getData());
                if (result1.isSuccess()) {
                    JsonResult result2 = this.bindPid(map.get("id"), map.get("key"));
                    System.out.println(result1.getData());
                    if (result2.isSuccess()) {
                        successIds += map.get("id").toString() + ",";
                    } else {
                        errorReasons.add(String.format(map.get("id").toString() + "绑定设备失败, " + result2.getData()));
                    }
                } else {
                    errorReasons.add(String.format(map.get("id").toString() + "设备上报实网卡号失败," + result1.getData()));
                }
                result.markSuccess("导入成功", errorReasons);
            });

        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }

    public String getCellValue(Cell cell) {
        String value = "";
        try {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_NUMERIC: {
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        //用于转化为日期格式
                        Date d = cell.getDateCellValue();
                        DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                        value = formater.format(d);
                    } else {
                        value = String.valueOf(new DecimalFormat("#").format(cell.getNumericCellValue()));
                    }
                    break;
                }
                case Cell.CELL_TYPE_STRING: {
                    value = cell.getStringCellValue();
                    break;
                }
                default: {
                    value = "";
                    break;
                }
            }
        } catch (Exception e) {
            value = "";
        }
        return value;
    }

    @RequestMapping(value = "/getFamilyMembers", method = RequestMethod.GET)
    @ResponseBody
    @SystemControllerLog(description = "获取家庭成员")
    public JsonResult getFamilyMembers(@RequestParam("id") String id) {
        JsonResult result = new JsonResult();
        try {
            List list = new ArrayList();
            HashMap<String, String> dict = new HashMap<String, String>();
            dict.put("id", id);
            String url = URL + PORTAPI + "/dev/members";
            String sign = OAuthUtil.getSignature(url, dict, "POST", APIKEY, APISECRET);
            String params = "_sign=" + sign + "&_tk=" + getToken(USERNAME, PASSWORD).getData() + "&id=" + id;
            String content = HttpRequest.sendPost(url, params);
            JSONObject jsonObject = JSONObject.parseObject(content);
            list.add(jsonObject);
            result.markSuccess("查询成功", list);
        } catch (Exception e) {
            e.printStackTrace();
            result.markError("查询失败！");
        }
        return result;
    }

    @RequestMapping(value = "/getRealHeartRhythm", method = RequestMethod.GET)
    @ResponseBody
    @SystemControllerLog(description = "获取实时心率")
    public JsonResult getRealHeartRhythm(@RequestParam("id") String id, @RequestParam("ts") String ts) {
        JsonResult result = new JsonResult();
        try {
            List list = new ArrayList();
            HashMap<String, String> dict = new HashMap<String, String>();
            dict.put("ts", ts);
            dict.put("queue_index", "0");
            dict.put("range_index", "0");
            String url = URL + PORTAPI + "/res/pt30/" + id + "/heart_realtime";
            String sign = OAuthUtil.getSignature(url, dict, "GET", APIKEY, APISECRET);
            String params = "_sign=" + sign + "&_tk=" + getToken(USERNAME, PASSWORD).getData()
                    + "&queue_index=0&range_index=0&ts=" + ts;
            String content = HttpRequest.sendGet(url, params);
            JSONObject jsonObject = JSONObject.parseObject(content);
            list.add(jsonObject);
            result.markSuccess("查询成功", list);
        } catch (Exception e) {
            result.markError("查询失败！");
        }
        return result;
    }

    /**
     * 批量获取心律
     *
     * @param ts 指定时间
     * @return 返回结果
     */
    @RequestMapping(value = "/getBatchRealHeartRhythm")
    @ResponseBody
    @SystemControllerLog(description = "批量获取实时心率")
    public Map<String, Object> getBatchRealHeartRhythm(@RequestParam("ts") String ts, @RequestParam("start") String start,
                                                       @RequestParam("len") String len) {
        Map<String, Object> result = new HashMap<>();
        String tsb = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
        String tsd = new SimpleDateFormat("HH:mm:ss").format(new Date());
        ts = tsb + "T" + tsd;
        try {
            //获取数据库中的设备id
            ServiceOrgNurseElderly serviceOrgNurseElderly = new ServiceOrgNurseElderly();
            serviceOrgNurseElderly.setDeviceName("手环");
            List<ServiceOrgNurseElderly> serviceOrgNurseElderlyList = serviceOrgNurseElderlyService.getAllRecode(serviceOrgNurseElderly);
            //将id存入集合
            List<String> ids =
                    serviceOrgNurseElderlyList.stream().
                            filter(elderly -> !StringUtils.isEmpty(elderly.getDeviceNumber()))
                            .map(ServiceOrgNurseElderly::getDeviceNumber).collect(Collectors.toList());
            //获取总记录数
            result.put("recordsFiltered", ids.size());
            List<Map<String, String>> batch = new ArrayList<>();
            //如果不传，使用默认值
            if (StringUtils.isEmpty(start) || StringUtils.isEmpty(len)) {
                start = "0";
                len = "10";
            }
            int pageNum = Integer.parseInt(start), length = Integer.parseInt(len), allCount = ids.size();
            if (allCount <= pageNum) {
                ids = null;
            } else if (allCount < pageNum + length) {
                ids = ids.subList(pageNum, allCount);
            } else {
                ids = ids.subList(pageNum, pageNum + length);
            }
            for (String id : ids) {
                Map<String, String> map = new HashMap<>();
                map.put("id", id);
                map.put("rate", "0");
                map.put("ts", "");
                batch.add(map);
            }
            result.put("data", batch);
            result.put("msg", "查询成功！");
        } catch (Exception ex) {
            ex.printStackTrace();
            result.put("msg", "获取失败！");
        }
        return result;
    }


    /**
     *获取推送心率（缓存中最新值）
     */
    @RequestMapping(value = "/getHeartRhythmFromCache")
    @ResponseBody
    public JsonResult getHeartRhythmFromCache(){
        JsonResult jsonResult = new JsonResult();
        List<NurseAlarm> result = new ArrayList<>();
        try {
            List<NurseAlarm> nurseAlarms = null;
            NurseAlarm nurseAlarm = null;
            Map<String,List<NurseAlarm>> cacheList = (Map<String,List<NurseAlarm>>)redisCacheUtils.getHash("LOVE_BRACELET_RATE_CACHE");
            for (Map.Entry<String,List<NurseAlarm>> entry : cacheList.entrySet()) {
                nurseAlarms = entry.getValue();
                if(nurseAlarms != null && nurseAlarms.size()>0){
                    nurseAlarm = nurseAlarms.stream().sorted(Comparator.comparing(
                            NurseAlarm::getCreateTime).
                            reversed()).findFirst().orElse(null);
                }
            }
            if(null != nurseAlarm){
                result.add(nurseAlarm);
            }
            jsonResult.markSuccess("success",result);
        }catch (Exception ex){
            ex.printStackTrace();
            jsonResult.markError("获取失败！");
        }
        return  jsonResult;
    }

}
