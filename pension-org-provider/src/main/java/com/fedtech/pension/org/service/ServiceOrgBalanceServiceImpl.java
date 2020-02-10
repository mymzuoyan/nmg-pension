package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.AlipayKeys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.commons.utils.WXpayKeys;
import com.fedtech.pension.org.mapper.ServiceOrgBalanceMapper;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgBalance;
import com.fedtech.pension.org.entity.ServiceOrgCashRegister;
import com.fedtech.pension.org.quantity.PayTypeQuantity;
import com.github.binarywang.wxpay.bean.request.WxEntPayRequest;
import com.github.binarywang.wxpay.bean.result.WxEntPayResult;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Objects;

/**
 * @author gengqiang
 * @date 2017/8/4
 */
@Service(interfaceClass = ServiceOrgBalanceService.class, version = "1.0.0")
public class ServiceOrgBalanceServiceImpl extends BaseServiceImpl<ServiceOrgBalance> implements ServiceOrgBalanceService {

    @Autowired
    private ServiceOrgBalanceMapper mapper;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgCashRegisterService cashRegisterService;

    @Resource(name = "wxPayService")
    private WxPayService wxPayService;


    @Override
    public BaseMapper<ServiceOrgBalance> getMapper() {
        return mapper;
    }


    @Override
    public ServiceOrgBalance findByServiceOrgId(Integer serviceOrgId) {
        return mapper.findByServiceOrgId(serviceOrgId);
    }

    @Override
    public boolean addBalance(Integer serviceOrgId, Double money, Integer type) {
        ServiceOrgBalance serviceOrgBalance = this.findByServiceOrgId(serviceOrgId);
        Boolean b = false;
        if (!ObjectUtils.isNotNull(serviceOrgBalance)) {
            serviceOrgBalance = new ServiceOrgBalance();
            serviceOrgBalance.setServiceOrgId(serviceOrgId);
            serviceOrgBalance.setCreateTime(new Date());
            if (Objects.equals(PayTypeQuantity.ZHIFUBAOPAYMENT, type)) {
                //支付宝
                serviceOrgBalance.setAlipayBalance(money);
            } else if (Objects.equals(PayTypeQuantity.WECHATPAYMENT, type)) {
                //微信
                serviceOrgBalance.setWxpayBalance(money);
            }
            b = insert(serviceOrgBalance);
        } else {
            if (Objects.equals(PayTypeQuantity.ZHIFUBAOPAYMENT, type)) {
                Double balance = serviceOrgBalance.getAlipayBalance() == null ? 0d : serviceOrgBalance.getAlipayBalance();
                //支付宝
                serviceOrgBalance.setAlipayBalance(money + balance);
            } else if (Objects.equals(PayTypeQuantity.WECHATPAYMENT, type)) {
                //微信
                Double balance = serviceOrgBalance.getWxpayBalance() == null ? 0d : serviceOrgBalance.getWxpayBalance();
                serviceOrgBalance.setWxpayBalance(money + balance);
            }
            b = updateByPrimaryKeySelective(serviceOrgBalance);
        }
        if (b) {
            ServiceOrgCashRegister cashRegister = new ServiceOrgCashRegister();
            cashRegister.setCash(-money);
            cashRegister.setCasherId(0);
            cashRegister.setCashTime(new Date());
            cashRegister.setServiceOrgId(serviceOrgId);
            cashRegister.setType(type);
            return cashRegisterService.insert(cashRegister);
        }
        return b;
    }

    @Override
    @Transactional
    public synchronized boolean subBalance(Integer serviceOrgId, Integer casherId, Double money, Integer type) {
        ServiceOrgBalance serviceOrgBalance = this.findByServiceOrgId(serviceOrgId);
        if (!ObjectUtils.isNotNull(serviceOrgBalance)) {
            return false;
        } else {
            if (Objects.equals(PayTypeQuantity.ZHIFUBAOPAYMENT, type)) {
                Double balance = serviceOrgBalance.getAlipayBalance() == null ? 0d : serviceOrgBalance.getAlipayBalance();
                //支付宝
                if (balance >= money) {
                    serviceOrgBalance.setAlipayBalance(balance - money);
                } else
                    return false;
            } else if (Objects.equals(PayTypeQuantity.WECHATPAYMENT, type)) {
                //微信
                Double balance = serviceOrgBalance.getWxpayBalance() == null ? 0d : serviceOrgBalance.getWxpayBalance();
                if (balance >= money) {
                    serviceOrgBalance.setWxpayBalance(balance - money);
                }
                return
                        false;
            }
            if (updateByPrimaryKeySelective(serviceOrgBalance)) {
                ServiceOrgCashRegister cashRegister = new ServiceOrgCashRegister();
                cashRegister.setCash(money);
                cashRegister.setCasherId(casherId);
                cashRegister.setCashTime(new Date());
                cashRegister.setServiceOrgId(serviceOrgId);
                cashRegister.setType(type);
                return cashRegisterService.insert(cashRegister);
            }
            return false;
        }
    }

    @Override
    public boolean cashMoney(String number, Integer serviceOrgId, String ip, Integer cashId, Double money, Integer type) {
        boolean b = false;
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgId);
        if (ObjectUtils.isNotNull(serviceOrg)) {
            if (Objects.equals(PayTypeQuantity.ZHIFUBAOPAYMENT, type)) {
                if (ObjectUtils.isNotNull(serviceOrg.getAlipayCount())) {
                    if (aliTansferAccount(number, serviceOrg.getAlipayCount(), money)) {
                        return subBalance(serviceOrgId, cashId, money, type);
                    }
                }
            } else if (Objects.equals(PayTypeQuantity.WECHATPAYMENT, type)) {
                if (ObjectUtils.isNotNull(serviceOrg.getWxpayCount())) {
                    if (wxTansferAccount(number, serviceOrg.getAlipayCount(), money, ip)) {
                        return subBalance(serviceOrgId, cashId, money, type);
                    }
                }
            }
        }
        return b;
    }

    /**
     * 支付宝转账
     *
     * @param account
     * @return
     */
    private boolean aliTansferAccount(String number, String account, Double money) {
        boolean b = false;
        AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", AlipayKeys.APP_ID, AlipayKeys.APP_PRIVATE_KEY, "json", AlipayKeys.CHARSET, AlipayKeys.ALIPAY_PUBLIC_KEY, "RSA2");
        AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("out_biz_no", number);
        jsonObject.put("payee_type", "ALIPAY_LOGONID");
        jsonObject.put("payee_account", account);
        jsonObject.put("amount", money);
        jsonObject.put("remark", "组织支付宝资金提现");

        request.setBizContent(jsonObject.toJSONString());
        AlipayFundTransToaccountTransferResponse response = null;
        try {
            response = alipayClient.execute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
            b = false;
        }
        if (response.isSuccess()) {
            System.out.println("调用成功");
            b = true;
        } else {
            System.out.println("调用失败");
            b = false;
        }
        return b;
    }

    /**
     * 微信转账
     *
     * @return
     */
    private boolean wxTansferAccount(String number, String account, Double money, String ip) {
        boolean b = false;
        WxPayConfig payConfig = new WxPayConfig();
        payConfig.setAppId(WXpayKeys.APP_ID);
        payConfig.setMchId(WXpayKeys.MCHID);
        payConfig.setMchKey(WXpayKeys.MCHKEY);
        wxPayService.setConfig(payConfig);
        WxEntPayRequest request = new WxEntPayRequest();
        Double money_fen = money * 100;
        request.setAmount(money_fen.intValue());
        request.setDescription("组织微信资金提现");
        request.setAppid(account);
        request.setSpbillCreateIp(ip);
        request.setCheckName("NO_CHECK");
        try {
            WxEntPayResult result = wxPayService.entPay(request);
            if ("SUCCESS".equals(result.getResultCode())) {
                b = true;
            }
        } catch (WxPayException e) {
            e.printStackTrace();
        }
        return b;
    }
}
