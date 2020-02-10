package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApply;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApplyDoc;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApplyHandle;
import com.fedtech.pension.elderly.mapper.ElderlyGovbuyApplyMapper;
import com.fedtech.pension.elderly.quantity.GovBuyApplyStepQuantity;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * Created by gengqiang on 2017/7/24.
 */
@Service(interfaceClass = ElderlyGovbuyApplyService.class, version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyGovbuyApplyServiceImpl extends BaseServiceImpl<ElderlyGovbuyApply> implements ElderlyGovbuyApplyService {

    @Autowired
    private ElderlyGovbuyApplyMapper mapper;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyDocService elderlyGovbuyApplyDocService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

//    @Autowired
//    private MessageService messageService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyHandleService elderlyGovbuyApplyHandleService;

    @Reference(version = "1.0.0")
    private ElderlyGovBuyService elderlyGovBuyService;

    @Override
    public BaseMapper<ElderlyGovbuyApply> getMapper() {
        return mapper;
    }


    @Override
    public String findByLastNumber(String number) {
        return mapper.findByLastNumber(number);
    }


    @Override
    public String createApplyPreNumber(Integer areaId) {
        Area area = areaService.selectByPrimaryKey(areaId);
        String deptcode = area.getDistrictId();
        String number = "";
        if (deptcode.length() >= 7) {
            number = "NJ" + deptcode.substring(4, 6);
        } else {
            number = "NJ" + deptcode.substring(0, 2);
        }
        return number;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insert(ElderlyGovbuyApply record) {
        if (super.insert(record)) {
//            记录处理过程
            ElderlyGovbuyApplyHandle elderlyGovbuyApplyHandle = new ElderlyGovbuyApplyHandle();
            elderlyGovbuyApplyHandle.setApplyId(record.getId());
            elderlyGovbuyApplyHandle.setHandlerId(record.getCreatorId());
            elderlyGovbuyApplyHandle.setHandleName(record.getOperator());
            elderlyGovbuyApplyHandle.setCreateTime(new Date());
            elderlyGovbuyApplyHandle.setHandleTime(new Date());
            elderlyGovbuyApplyHandle.setHandleContent(record.getOperator() + "登记了老人" + record.getName() + "政府购买服务申请，送街道受理");
            elderlyGovbuyApplyHandleService.insert(elderlyGovbuyApplyHandle);
////            推送通知
//            Message message = new Message();
//            message.setTitle("政府购买服务申请审核");
//            User filter = new User();
//            List<Integer> uids = new ArrayList<>();
//            String content = "";
//            //已受理
//            content = "老人" + record.getName() + "已登记了政府购买服务申请，街道请尽快受理";
//            filter.setAreaName(record.getRegion2());
//            uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
//            message.setContent(content);
//            messageService.sendMessage(message, uids);
//            dwrService.sendMessgaeToUser2(uids, "2", "");
            return true;
        }
        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean handleGovBuyApply(ElderlyGovbuyApply apply, ElderlyGovbuyApplyDoc doc, User handleUser) {
        if (Objects.equals(apply.getStatus(), GovBuyApplyStepQuantity.BUYUSHOULI) ||
                Objects.equals(apply.getStatus(), GovBuyApplyStepQuantity.QUSHENHEBUTONGGUO) ||
                Objects.equals(apply.getStatus(), GovBuyApplyStepQuantity.QUZAISHENHEBUTONGGUO)
                ) {
            apply.setResult(2);
        } else if (Objects.equals(apply.getStatus(), GovBuyApplyStepQuantity.QUSANSHEHETONGGUO)) {
            apply.setResult(1);
        }
        String handleName = handleUser.getNick_name();
        if (this.updateByPrimaryKeySelective(apply)) {
            if (elderlyGovbuyApplyDocService.insert(doc)) {
                //通知
                apply = this.selectByPrimaryKey(apply.getId());
//                Message message = new Message();
//                message.setTitle("政府购买服务申请审核");
                User filter = new User();
                List<Integer> uids = new ArrayList<>();
                String content = "";
                String handleContent = "";
                switch (apply.getStatus()) {
                    case 0:
                        //已登记
                        break;
                    case 1:
                        //已受理
                        content = "街道" + apply.getRegion2() + "已受理了老人" + apply.getName() + "政府购买服务申请，街道请尽快审核";
                        handleContent = handleName + "已受理了老人" + apply.getName() + "政府购买服务申请，送街道审核";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                    case 2:
                        //已拒绝
                        content = "街道" + apply.getRegion2() + "已拒绝受理了老人" + apply.getName() + "政府购买服务申请";
                        handleContent = handleName + "已拒绝受理了老人" + apply.getName() + "政府购买服务申请";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        break;
                    case 3:
                        //初审(街道)通过
                        content = "街道" + apply.getRegion2() + "已审核通过了老人" + apply.getName() + "政府购买服务申请，区管理员请尽快处理";
                        handleContent = handleName + "已审核通过了老人" + apply.getName() + "政府购买服务申请，送区审核";
                        filter.setAreaName(apply.getRegion1());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.ReAdmin.getId());
                        break;
                    case 4:
                        //街道初审不通过,需补正
                        content = "街道：" + apply.getRegion1() + "没有通过了老人" + apply.getName() + "政府购买服务申请，街道管理员请尽快补正";
                        handleContent = handleName + "没有通过了老人" + apply.getName() + "政府购买服务申请，送街道补正";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        break;
                    case 5:
                        //区审核通过
                        content = "区：" + apply.getRegion1() + "通过了老人" + apply.getName() + "政府购买服务申请，评估机构请尽快安排评估";
                        handleContent = handleName + "通过了老人" + apply.getName() + "政府购买服务申请，送评估机构评估";
                        filter.setAssessOrgId(apply.getAssessOrgId());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.AssessAdmin.getId());
                        break;
                    case 6:
                        //区审核不通过，不予批准
                        content = "区：" + apply.getRegion1() + "不予批准老人" + apply.getName() + "政府购买服务申请";
                        handleContent = handleName + "不予批准老人" + apply.getName() + "政府购买服务申请";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        break;

                    case 7:
                        //评估组织发评估报告
                        content = "评估组织" + apply.getRegion2() + "已对老人" + apply.getName() + "进行了评估，区管理员请尽快处理";
                        handleContent = handleName + "已对老人" + apply.getName() + "进行了评估，送区审核";
                        filter.setAreaName(apply.getRegion1());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.ReAdmin.getId());
                        break;
                    case 8:
                        //区审核通过
                        content = "区：" + apply.getRegion1() + "通过了老人" + apply.getName() + "评估报告，街道进行公示";
                        handleContent = handleName + "通过了老人" + apply.getName() + "评估报告，送街道公示";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        break;
                    case 9:
                        //区审核不通过，不予批准
                        content = "区：" + apply.getRegion1() + "不予批准老人" + apply.getName() + "政府购买服务申请";
                        handleContent = handleName + "不予批准老人" + apply.getName() + "政府购买服务申请";

                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        break;
                    case 10:
                        //公示／反馈
                        content = "街道：" + apply.getRegion2() + "已对老人" + apply.getName() + "政府购买服务申请进行公示，区管理员请尽快处理";
                        handleContent = handleName + "已对老人" + apply.getName() + "政府购买服务申请进行公示，送区审核";
                        filter.setAreaName(apply.getRegion1());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.ReAdmin.getId());
                        break;
                    case 11:
                        //区审核通过
                        content = "区：" + apply.getRegion1() + "通过了老人" + apply.getName() + "政府购买服务申请";
                        handleContent = handleName + "通过了老人" + apply.getName() + "政府购买服务申请";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        //添加政府购买老人
                        insertElderGovBuy(apply);
                        break;

                    case 12:
                        //区审核不通过
                        content = "区：" + apply.getRegion1() + "没有通过了老人" + apply.getName() + "政府购买服务申请,需街道复审";
                        handleContent = handleName + "没有通过了老人" + apply.getName() + "政府购买服务申请,送街道复审";
                        filter.setAreaName(apply.getRegion2());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                        break;

                    case 13:
                        //区审核不通过
                        content = "区：" + apply.getRegion1() + "没有通过了老人" + apply.getName() + "政府购买服务申请,需评估组织复检";
                        handleContent = handleName + "没有通过了老人" + apply.getName() + "政府购买服务申请,送评估组织复检";
                        filter.setAssessOrgId(apply.getAssessOrgId());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.AssessAdmin.getId());
                        break;
                    case 14:
                        //街道复审通过
                        content = "街道" + apply.getRegion2() + "已复审通过了老人" + apply.getName() + "政府购买服务申请，区管理员请尽快处理";
                        handleContent = handleName + "已复审通过了老人" + apply.getName() + "政府购买服务申请，送区审核";
                        filter.setAreaName(apply.getRegion1());
                        uids = userService.selectAllUserIdByRole(filter, RoleType.ReAdmin.getId());
                        break;

                }
//                message.setContent(content);
//                messageService.sendMessage(message, uids);
//                dwrService.sendMessgaeToUser2(uids, "2", "");

//                记录过程
                ElderlyGovbuyApplyHandle elderlyGovbuyApplyHandle = new ElderlyGovbuyApplyHandle();
                elderlyGovbuyApplyHandle.setApplyId(apply.getId());
                elderlyGovbuyApplyHandle.setHandlerId(handleUser.getUid());
                elderlyGovbuyApplyHandle.setHandleName(handleName);
                elderlyGovbuyApplyHandle.setCreateTime(new Date());
                elderlyGovbuyApplyHandle.setHandleTime(new Date());
                elderlyGovbuyApplyHandle.setHandleContent(handleContent);
                elderlyGovbuyApplyHandleService.insert(elderlyGovbuyApplyHandle);
                return true;
            }
        }
        return false;
    }

    private boolean insertElderGovBuy(ElderlyGovbuyApply apply) {
        ElderlyGovBuy elderlyGovBuy = new ElderlyGovBuy();
        elderlyGovBuy.setElderId(apply.getElderId());
        elderlyGovBuy.setServiceOrgId(apply.getServiceOrgId());
        Integer subsidy = 0;
        Integer callertype = 0;
        switch (apply.getStandard()) {
            case 1:
                subsidy = 0;
                callertype = 1;
                break;
            case 2:
                subsidy = 0;
                callertype = 2;
                break;
            case 3:
                subsidy = 300;
                callertype = 1;
                break;
            case 4:
                subsidy = 400;
                callertype = 1;
                break;
            case 5:
                subsidy = 300;
                callertype = 0;
                break;
            case 6:
                subsidy = 400;
                callertype = 1;
                break;
            case 7:
                subsidy = 400;
                callertype = 2;
                break;
            case 8:
                subsidy = 400;
                callertype = 0;
                break;
            default:
                subsidy = 0;
                callertype = 0;
                break;
        }
        elderlyGovBuy.setSubsidy(subsidy);
        elderlyGovBuy.setCallertype(callertype);
        try {
            elderlyGovBuy.setCallerlabel(Integer.parseInt(apply.getCallerLabel()));

        } catch (Exception e) {
            elderlyGovBuy.setCallerlabel(0);
        }
        elderlyGovBuy.setCallerno(apply.getCardno());
        elderlyGovBuy.setStatus(1);
        return elderlyGovBuyService.insert(elderlyGovBuy);
    }
}
