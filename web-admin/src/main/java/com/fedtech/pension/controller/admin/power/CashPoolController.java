package com.fedtech.pension.controller.admin.power;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DateUtil;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.power.entity.MoneyFlow;
import com.fedtech.pension.power.entity.CashPool;
import com.fedtech.pension.power.service.MoneyflowService;
import com.fedtech.pension.power.service.CashPoolService;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/admin/api/power/cashPool/")
@EnableScheduling
public class CashPoolController  extends BaseController {
    @Reference(version = "1.0.0")
    public CashPoolService ashPoolService;

    @Reference(version = "1.0.0")
    public ServiceOrgService serviceOrgService;
    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;
    @Reference(version = "1.0.0")
    private MoneyflowService moneyflowService;
    @Reference(version = "1.0.0")
    private UserService userService;

    public final String ADMIN_PREFIX = "/admin/lrnlpg/";

    @RequestMapping(value = "addorupdate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "新增、修改")
    public JsonResult addOrUpdate(CashPool ashPool) throws Exception{
        JsonResult result = new JsonResult();
        boolean blean = false;
        String orgId=  ashPool.getServiceOrgId().substring(10);
        ashPool.setServiceOrgId(ashPool.getServiceOrgId().substring(10));
        ashPool.setAreaName(serviceOrgService.selectByPrimaryKey(Integer.parseInt(orgId)).getAreaName());

        Subject currentUser = SecurityUtils.getSubject();
        ashPool.setCreateUserId(currentUser().getUid() );
        if(ashPool.getId()==null){
            blean = ashPoolService.updateCashPool(ashPool);
            if(blean){
                ashPoolService.updateServiceMoney(ashPool);
                result.markSuccess("充值成功", null);
            }else{
                result.markError("充值失败");
            }
        }else {
            blean = ashPoolService.updateCashPool(ashPool);
            if(blean){
                result.markSuccess("充值修改成功", null);
            }else{
                result.markError("充值修改失败");
            }
        }
        return result;
    }


    /**
     * 维护绑卡
     *
     * @return
     */
    @RequestMapping("update")
    public String update( Model model,Integer id) {
        CashPool ashPool = ashPoolService.selectByPrimaryKey(id);
        model.addAttribute("cashPool", ashPool);
        return ADMIN_PREFIX + "cashPool_add";
    }
    /**
     * 详情页面
     *
     * @return
     */
    @RequestMapping("detail")
    public String detail( Model model,Integer id) {
        CashPool ashPool = ashPoolService.selectByPrimaryKey(id);
        model.addAttribute("cashPool", ashPool);
        return ADMIN_PREFIX + "cashPool_detail";
    }

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("list")
    public  String   list(Model model){
        Subject currentUser = SecurityUtils.getSubject();
        model.addAttribute("roleId", getRoleId());
        return ADMIN_PREFIX + "cashPool_list";
    }

    /**
     * 分页获取组织列表
     *
     * @return
     */
    @RequestMapping(value = "serviceList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<CashPool> serviceOrgList(PageRequest pageRequest, CashPool ashPool) {
        Subject currentUser = SecurityUtils.getSubject();
        if(RoleType.SuAdmin.getId()== getRoleId()){
            ashPool.setServiceOrgId("");
        }else{
            User user = userService.selectByPrimaryKey(currentUser().getUid());
            ashPool.setServiceOrgId(user.getServiceOrgId());
        }
        PageResponse<CashPool> dataTable = ashPoolService.selectPageList(ashPool, pageRequest);
        return dataTable;
    }
    /**
     * 绑卡页面
     *
     * @return
     */
    @RequestMapping("add")
    public  String   add(Model model){
        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        return ADMIN_PREFIX + "cashPool_add";
    }
    /**
     * 评估人删除
     *
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    @SystemControllerLog(description = "批量删除")
    public JsonResult delete(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (ashPoolService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     *
     *
     * @param ashPool
     * @return
     */
    @RequestMapping("export")
    @SystemControllerLog(description = "导出绑卡信息列表")
    public void export(CashPool ashPool, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        Subject currentUser = SecurityUtils.getSubject();
        if(RoleType.SuAdmin.getId()== getRoleId()){
            ashPool.setServiceOrgId("");
        }else{
            User user = userService.selectByPrimaryKey(currentUser().getUid());
            ashPool.setServiceOrgId(user.getServiceOrgId());
        }
        ashPool.setAreaName(URLDecoder.decode(ashPool.getAreaName(),"UTF-8"));
        ashPool.setServiceOrgName(URLDecoder.decode(ashPool.getServiceOrgName(), "UTF-8"));
//        ashPool.setIdNumber(URLDecoder.decode(ashPool.getIdNumber(), "UTF-8"));
//        ashPool.setOldManName(URLDecoder.decode(ashPool.getOldManName(), "UTF-8"));
        List<CashPool> ashPools = ashPoolService.getAllRecode(ashPool);
        response.setContentType("octets/stream");
        String fileName = "资金池.xls";
        String title = "资金池信息";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<CashPool> ex = new ExportExcel<>();
        String[] headers = {"区域 ",  "所属服务机构 ", "充值金额",  "充值时间"
        };
        String[] fieldNames = {"areaName", "serviceOrgName", "money", "createDate"};
        ex.exportExcel(title, headers, fieldNames, ashPools, out, "yyyy-MM-dd");
        out.close();
    }



    /**
     * 导出资金池信息
     * @param moneyFlow
     * @return
     */
    @RequestMapping("exportMoneyFlow")
    @SystemControllerLog(description = "导出资金池信息列表")
    public void exportMoneyFlow(MoneyFlow moneyFlow, HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        List<MoneyFlow> moneyFlows = moneyflowService.getAllRecode(moneyFlow);
        response.setContentType("octets/stream");
        String fileName = "助老卡资金池信息.xls";
        String title = "助老卡资金池信息";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<MoneyFlow> ex = new ExportExcel<>();
        String[] headers = {"区域 ",  "所属服务机构 ", "充值金额",  "充值时间"};
        String[] fieldNames = {"areaName", "erviceOrgName", "money", "createDate"};
        ex.exportExcel(title, headers, fieldNames, moneyFlows, out, "yyyy-MM-dd");
        out.close();
    }



/**
 * 列表页面
 *
 * @return
 */
    @RequestMapping("serviceOrg_cashPool_list")
    public  String   serviceOrgcashPoollist(){
        return ADMIN_PREFIX + "serviceOrg_cashPool_list";
    }
}
