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
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.power.entity.CashPool;
import com.fedtech.pension.power.entity.MoneyFlow;
import com.fedtech.pension.power.entity.OldManCard;
import com.fedtech.pension.power.service.CashPoolService;
import com.fedtech.pension.power.service.MoneyflowService;
import com.fedtech.pension.power.service.OldManCardService;
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
@RequestMapping("/admin/api/power/oldmancard/")
@EnableScheduling
public class OldManCardController extends BaseController {
    @Reference(version = "1.0.0")
    public OldManCardService oldManCardService;
    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;
    @Reference(version = "1.0.0")
    private MoneyflowService moneyflowService;
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;
    @Reference(version = "1.0.0")
    private CashPoolService cashPoolService;
    @Reference(version = "1.0.0")
    public UserService userService;


    public final String ADMIN_PREFIX = "/admin/lrnlpg/";

    @RequestMapping(value = "addorupdate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "老人绑卡或维护卡")
    public JsonResult addOrUpdate(OldManCard oldManCard) throws Exception{
        JsonResult result = new JsonResult();
        boolean blean = false;
        if(oldManCard.getId()==null){
            blean = oldManCardService.updateOldManCard(oldManCard);
            if(blean){
                result.markSuccess("绑卡成功", null);
            }else{
                result.markError("绑卡失败");
            }
        }else {
            blean = oldManCardService.updateOldManCard(oldManCard);
            if(blean){
                result.markSuccess("绑卡维护成功", null);
            }else{
                result.markError("绑卡维护失败");
            }
        }
        return result;
    }

    @RequestMapping(value = "check", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "判断卡号及身份证")
    public JsonResult check(OldManCard oldManCard) throws Exception{
        JsonResult result = new JsonResult();
        OldManCard oldManCard2=new OldManCard();
        oldManCard2.setCardId(oldManCard.getCardId());
        oldManCard2.setStatus(0);
        oldManCard2.setId(oldManCard.getId());
        oldManCard2=oldManCardService.selectByEntity(oldManCard2);
        if(oldManCard2!=null){
            result.markError("绑卡失败,卡号已被占用");
        }else{
            ElderlyMsg elderlyMsg=elderlyMsgService.selectByCardNo(oldManCard.getIdNumber());
            if(elderlyMsg==null){
                result.markError("绑卡失败,未找到该身份证对应老人");
            }else if(!elderlyMsg.getElderName().equals(oldManCard.getOldManName())){
                result.markError("绑卡失败,身份证对应的老人姓名不匹配,请先查询");
            }else{
                oldManCard2=new OldManCard();
                oldManCard2.setIdNumber(oldManCard.getIdNumber());
                oldManCard2.setId(oldManCard.getId());
                oldManCard2.setStatus(0);
                oldManCard2=oldManCardService.selectByEntity(oldManCard2);
                if(oldManCard2!=null){
                    result.markError("绑卡失败,该身份证已被绑定卡号:"+oldManCard2.getCardId());
                }else{
                    result.markSuccess("检查成功,可以绑卡", null);
                }

            }
        }
        return result;
    }
    @RequestMapping(value = "find", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "查询身份证对应老人信息")
    public JsonResult find(OldManCard oldManCard) throws Exception{
        JsonResult result = new JsonResult();
            ElderlyMsg elderlyMsg=elderlyMsgService.selectByCardNo(oldManCard.getIdNumber());
            if(elderlyMsg==null){
                result.markError("查询失败,未找到该身份证对应老人");
            }else{
                result.markSuccess("查询成功", elderlyMsg);
            }
        return result;
    }
    /**
     * 维护绑卡
     *
     * @return
     */
    @RequestMapping("update")
    public String update( Model model,Integer id,String retile) {
        OldManCard oldManCard = oldManCardService.selectByPrimaryKey(id);
        model.addAttribute("oldManCard", oldManCard);
        model.addAttribute("retile", retile);
        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        return ADMIN_PREFIX + "oldManCard_add";
    }
    /**
     * 详情页面
     *
     * @return
     */
    @RequestMapping("detail")
    public String detail( Model model,Integer id) {
        OldManCard oldManCard = oldManCardService.selectByPrimaryKey(id);
        model.addAttribute("oldManCard", oldManCard);
        return ADMIN_PREFIX + "oldManCard_detail";
    }

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("list")
    public  String   list(){
        return ADMIN_PREFIX + "oldManCard_list";
    }

    /**
     * 分页获取组织列表
     *
     * @return
     */
    @RequestMapping(value = "serviceList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<OldManCard> serviceOrgList(PageRequest pageRequest, OldManCard oldManCard) {
        Subject currentUser = SecurityUtils.getSubject();
        if(RoleType.SuAdmin.getId()== getRoleId()){
            oldManCard.setServiceOrgId("");
        }else{
            User user = userService.selectByPrimaryKey(currentUser().getUid());
            oldManCard.setServiceOrgId(user.getServiceOrgId());
        }


        PageResponse<OldManCard> dataTable = oldManCardService.selectPageList(oldManCard, pageRequest);
        return dataTable;
    }
    /**
     * 绑卡页面
     *
     * @return
     */
    @RequestMapping("add")
    public  String   add(Model model){
//        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        Subject currentUser = SecurityUtils.getSubject();
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        return ADMIN_PREFIX + "oldManCard_add";
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
            if (oldManCardService.deleteSomeMsg(idList)) {
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
     * @param oldManCard
     * @return
     */
    @RequestMapping("export")
    @SystemControllerLog(description = "导出绑卡信息列表")
    public void export(OldManCard oldManCard, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
//        oldManCard.setArea(URLDecoder.decode(oldManCard.getArea(), "UTF-8"));
        oldManCard.setServiceOrgName(URLDecoder.decode(oldManCard.getServiceOrgName(), "UTF-8"));
        oldManCard.setCardId(URLDecoder.decode(oldManCard.getCardId(), "UTF-8"));
        oldManCard.setIdNumber(URLDecoder.decode(oldManCard.getIdNumber(), "UTF-8"));
        oldManCard.setOldManName(URLDecoder.decode(oldManCard.getOldManName(), "UTF-8"));
        List<OldManCard> oldManCards = oldManCardService.getAllRecode(oldManCard);
        response.setContentType("octets/stream");
        String fileName = "老人绑卡信息.xls";
        String title = "老人绑卡信息";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<OldManCard> ex = new ExportExcel<>();
        String[] headers = {"卡号 ",  "所属服务机构 ", "身份证号", "老人姓名", "绑卡时间",
                "退卡时间", "状态"
        };
        String[] fieldNames = {"cardId", "serviceOrgName", "idNumber", "oldManName", "createDate", "removeDate",
                "status"};
        ex.exportExcel(title, headers, fieldNames, oldManCards, out, "yyyy-MM-dd");
        out.close();
    }


    /**
     * 跳转充值页面
     *
     * @return
     */
    @RequestMapping("topup")
    public  String   topup(Model model){
        MoneyFlow moneyFlow=new MoneyFlow();
        String  flowNumber=DateUtil.getOrderNum()+new Random().nextInt(10000)+"";
        moneyFlow.setServerNum(flowNumber);
        model.addAttribute("m",moneyFlow);
        Subject currentUser = SecurityUtils.getSubject();
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        return ADMIN_PREFIX + "oldManCard_topup";
    }


    /**
     * 导出资金流水信息
     * @param moneyFlow
     * @return
     */
    @RequestMapping("exportMoneyFlow")
    @SystemControllerLog(description = "导出资金流水信息列表")
    public void exportMoneyFlow(MoneyFlow moneyFlow, HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        List<MoneyFlow> moneyFlows = moneyflowService.getAllRecode(moneyFlow);
        response.setContentType("octets/stream");
        String fileName = "助老卡资金流水信息.xls";
        String title = "助老卡资金流水信息";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<MoneyFlow> ex = new ExportExcel<>();
        String[] headers = {"姓名 ",  "卡号 ", "流水号", "金额", "时间"};
        String[] fieldNames = {"elderName", "cardId", "serverNum", "amount", "uptime"};
        ex.exportExcel(title, headers, fieldNames, moneyFlows, out, "yyyy-MM-dd");
        out.close();
    }

    /**
     * 根据卡号查找信息
     * @param oldManCard
     * @return
     */
    @RequestMapping(value = "findBycardId", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "根据卡号查找信息")
    public JsonResult findBycardId(OldManCard oldManCard) throws Exception{
        JsonResult result = new JsonResult();
        OldManCard card = oldManCardService.selectByEntity(oldManCard);
        if(card==null){
            result.markError("查询失败,未找到该卡号绑定信息");
        }else{
            result.markSuccess("查询成功", card);
        }
        return result;
    }

    /**
     * 助老卡充值
     * @param oldManCard
     * @return
     */
    @RequestMapping(value = "topupMoney", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "助老卡充值")
    public JsonResult topupMoney(OldManCard oldManCard) throws Exception{
        JsonResult result = new JsonResult();
        boolean blean = false;
            blean = oldManCardService.updateOldManCardMoney(oldManCard);
            if(blean){
                result.markSuccess("充值成功", null);
            }else{
                result.markError("充值失败");
            }
        return result;
    }

    /**
     * 助老卡充值流水
     * @param moneyFlow
     * @return
     */
    @RequestMapping(value = "insertMoneyFlow", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "助老卡充值流水")
    public JsonResult insertMoneyFlow(MoneyFlow moneyFlow) throws Exception{
        JsonResult result = new JsonResult();
        boolean blean = false;
        String str= moneyFlow.getServiceOrgId();
//        moneyFlow.setServiceOrgId(str);
            blean = moneyflowService.insertMoneyFlow(moneyFlow);
            if(blean){
                //组织机构余额减少
                CashPool cashPool=new CashPool();
                cashPool.setServiceOrgId(str);
                cashPool.setMoney(-moneyFlow.getAmount());
                cashPoolService.updateServiceMoney(cashPool);
                result.markSuccess("助老卡充值流水添加成功", null);
            }else{
                result.markError("助老卡充值流水添加失败");
            }

        return result;
    }

    @RequestMapping(value = "findOldManCardByCardNumber", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "通过卡号查询老人绑卡信息")
    public JsonResult findOldManCardByCardNumber(OldManCard oldManCard) throws Exception{
        JsonResult result = new JsonResult();
        oldManCard=oldManCardService.selectByEntity(oldManCard);
        if(oldManCard!=null){
            result.markSuccess("查询成功", oldManCard);
        }else{
            result.markError("此卡号无效");
        }
        return result;
    }


    /**
     * 根据组织id查组织余额
     * @param serviceOrgId
     * @return
     */
    @RequestMapping(value = "getServiceMoneyByserviceOrgId", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "根据卡号查找信息")
    public JsonResult getServiceMoneyByserviceOrgId(String serviceOrgId) throws Exception{
//        serviceOrgId=serviceOrgId.substring(10);
        JsonResult result = new JsonResult();
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(serviceOrgId));
        if(serviceOrg==null){
            result.markError("查询失败");
        }else{
            result.markSuccess("查询成功", serviceOrg);
        }
        return result;
    }
}
