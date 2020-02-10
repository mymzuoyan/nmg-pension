package com.fedtech.pension.mobile.api.ServiceOrgAdmin;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.FileUtil;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.elderly.vo.ElderlyMsgVo;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgBalance;
import com.fedtech.pension.org.quantity.PayTypeQuantity;
import com.fedtech.pension.org.service.ServiceOrgBalanceService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.task.entity.ElderlyWallet;
import com.fedtech.pension.task.service.ElderlyWalletService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * Created by gengqiang on 2017/8/4.
 */
@Controller
@RequestMapping("/api/serviceAdmin/pay/")
public class SOAPayApiController {

    @Reference(version = "1.0.0",timeout = 6000)
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private ElderlyWalletService elderlyWalletService;


    @Reference(version = "1.0.0")
    private ServiceOrgBalanceService serviceOrgBalanceService;

    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmssSSS");


    /**
     * 绑定二维码
     * @param request
     * @param type
     * @param serviceOrgId
     * @param avatar
     * @return
     */
    @RequestMapping(value = "bindAccountQr")
    @ResponseBody
    public AppResult updatePhotoUrl(HttpServletRequest request, @RequestParam("type") Integer type,
                                    @RequestParam("serviceOrgId") Integer serviceOrgId,
                                    MultipartFile avatar) {
        AppResult result = new AppResult();
        FileUtil util = new FileUtil();
        try {
            JsonResult saveResult = util.saveFile(request, avatar, util.SAVEURL_QR_IMAGE);
            ServiceOrg serviceOrg = new ServiceOrg();
            serviceOrg.setId(serviceOrgId);
            if (Objects.equals(PayTypeQuantity.ZHIFUBAOPAYMENT, type)) {
                serviceOrg.setAlipayCount(saveResult.getData().toString());
            } else if (Objects.equals(PayTypeQuantity.WECHATPAYMENT, type)) {
                serviceOrg.setWxpayCount(saveResult.getData().toString());
            }
            if (serviceOrgService.updateByPrimaryKeySelective(serviceOrg)) {
                result.markSuccess("绑定成功", saveResult.getData().toString());
            } else {
                result.markError("绑定失败") ;

            }
        } catch (MultipartException e) {
            result.markError("绑定失败");
        }
        return result;
    }


    /**
     * 绑定支付账号
     *
     * @param account
     * @param type
     * @param serviceOrgId
     * @return
     */
    @RequestMapping(value = "bindAccount")
    @ResponseBody
    public AppResult bindPayCount(@RequestParam("account") String account,
                                  @RequestParam("type") Integer type,
                                  @RequestParam("serviceOrgId") Integer serviceOrgId) {
        AppResult result = new AppResult();
        ServiceOrg serviceOrg = new ServiceOrg();
        serviceOrg.setId(serviceOrgId);
        if (Objects.equals(PayTypeQuantity.ZHIFUBAOPAYMENT, type)) {
            serviceOrg.setAlipayCount(account);
        } else if (Objects.equals(PayTypeQuantity.WECHATPAYMENT, type)) {
            serviceOrg.setWxpayCount(account);
        }
        if (serviceOrgService.updateByPrimaryKeySelective(serviceOrg)) {
            result.markSuccess("绑定成功", null);
        } else {
            result.markError("绑定失败") ;

        }
        return result;
    }

    /**
     * 获取支付账号
     *
     * @param serviceOrgId
     * @return
     */
    @RequestMapping(value = "getAccount")
    @ResponseBody
    public AppResult getAccount(@RequestParam("serviceOrgId") Integer serviceOrgId) {
        AppResult result = new AppResult();
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("alipayCount", serviceOrg.getAlipayCount());
        jsonObject.put("wxpayCount", serviceOrg.getWxpayCount());
        result.markSuccess("获取成功", jsonObject);
        return result;
    }

    /**
     * 提现
     *
     * @param serviceOrgId
     * @param casherId
     * @param money
     * @param type
     * @return
     */
    @RequestMapping(value = "cashMoney")
    @ResponseBody
    public AppResult cashMoney(@RequestParam("serviceOrgId") Integer serviceOrgId,
                               @RequestParam("casherId") Integer casherId,
                               @RequestParam("money") Double money,
                               @RequestParam("type") Integer type,
                               HttpServletRequest request) {
        AppResult result = new AppResult();
        if (ObjectUtils.isNull(serviceOrgId)) {
            result.markError("提现组织id不能为空");
            return result;
        }
        if (ObjectUtils.isNull(casherId)) {
            result.markError("提现人员id不能为空");
            return result;
        }
        if (ObjectUtils.isNull(money)) {
            result.markError("提现金额不能为空");
            return result;
        }
        if (ObjectUtils.isNull(type)) {
            result.markError("提现类型不能为空");
            return result;
        }
        String number = df.format(new Date());

        if (serviceOrgBalanceService.cashMoney(number, serviceOrgId, request.getRemoteAddr(), casherId, money, type)) {
            result.markSuccess("提现成功", null);
        } else {
            result.markError("提现失败") ;
        }
        return result;
    }

    /**
     * 获取组织特定区域的总金额
     *
     * @param serviceOrgId
     * @return
     */
    @RequestMapping(value = "countMoney")
    @ResponseBody
    public AppResult countMoney(@RequestParam("serviceOrgId") Integer serviceOrgId) {
        AppResult result = new AppResult();
        ServiceOrgBalance balance = serviceOrgBalanceService.findByServiceOrgId(serviceOrgId);
        if (ObjectUtils.isNotNull(balance)) {
            result.markSuccess("获取价格成功", balance);
        } else {
            result.markSuccess("获取价格失败", balance);

        }
        return result;
    }

    /**
     * 根据身份证号获取虚拟货币 (金额)
     *
     * @param idcardno
     * @return
     */
    @RequestMapping("getIdealMoney")
    @ResponseBody
    public AppResult idealMoneyPayment(@RequestParam("idcardno") String idcardno) {
        AppResult result = new AppResult();
        ElderlyWallet elderlyWallet = new ElderlyWallet();
        if (StringUtils.isEmpty(idcardno)) {
            result.markError("身份证号为空");
            return result;
        } else {
            ElderlyMsgVo elderlyMsgVo = elderlyMsgService.selectGovBuyByCardNo(idcardno);
            if (!ObjectUtils.isNotNull(elderlyMsgVo)) {
                result.markError("该老人不是政府购买老人");
                return result;
            }
            elderlyWallet.setIdcardno(idcardno);
            List<ElderlyWallet> elderlyWallets = elderlyWalletService.getAllRecode(elderlyWallet);
            if (!ObjectUtils.isNotNull(elderlyWallets)) {
                result.markError("老人无虚拟货币");
                return result;
            } else if (elderlyWallets.size() > 1) {
                result.markError("老人虚拟币不唯一");
                return result;
            } else {
                elderlyWallet = elderlyWallets.get(0);
                result.markSuccess("获取老人虚拟币成功", elderlyWallet);
            }
        }
        return result;
    }

}
