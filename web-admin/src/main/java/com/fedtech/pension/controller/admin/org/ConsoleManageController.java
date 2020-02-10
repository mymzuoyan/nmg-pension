package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderLinkManService;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.sys.service.UserService;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author gxy
 * @date 2019/10/11 - 20:59
 */


@Controller
@RequestMapping("/admin/serviceOrg/ConsoleManager/")
@EnableScheduling
public class ConsoleManageController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceOrgTowerCourtyardInformationService serviceOrgTowerCourtyardInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgFloorInformationService serviceOrgFloorInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerRoomInformationService serviceOrgTowerRoomInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgBedsInformationService serviceOrgBedsInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyService serviceOrgElderlyService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private HealthRecordsService healthRecordsService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private ElderLinkManService elderLinkManService;




    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");






    /**
     * 控制台显示
     *
     * @return
     */
    @RequestMapping("ShowConsoleManage")
    public String consoleManage() {
        return ADMIN_PREFIX + "consoleManage";
    }





    /**
     * 根据机构Id ServiceOrgId获取楼院编号信息
     * @return
     */
    @RequestMapping("findTowerCourtyardNumByServiceOrgId")
    @ResponseBody
    public List<String> findTowerCourtyardNumByServiceOrgId( ){

        List<String> strList = new ArrayList<>();
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            List<ServiceOrgTowerCourtyardInformation> serviceOrgTowerCourtyardInformations=serviceOrgTowerCourtyardInformationService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            for (ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation : serviceOrgTowerCourtyardInformations) {
                strList.add(serviceOrgTowerCourtyardInformation.getTowerCourtyardNum());
            }
        }


        return strList;
    }


    /**
     * 根据楼院编号获取信息
     * @return
     */
    @RequestMapping("findOldManAndbedRoomByTowerCourtyardNum")
    @ResponseBody
    public HashMap findOldManAndbedRoomByTowerCourtyardNum(String towerCourtyardNum ){

        HashMap map = new HashMap();
        ArrayList arrayList = new ArrayList();
        List<String> strList=null;
        Integer FreeBedNum=0;
        Integer checkInElderNum=0;
        Integer serviceOrgId=Integer.parseInt(currentUser().getServiceOrgId());
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation = serviceOrgTowerCourtyardInformationService.selectByTowerCourtyardNumAndServiceOrgId(towerCourtyardNum, serviceOrgId);
            map.put("kickafk", serviceOrgTowerCourtyardInformation.getKickafk());
            map.put("rooms", serviceOrgTowerCourtyardInformation.getRooms());
            map.put("bedNum", serviceOrgTowerCourtyardInformation.getBedNum());
            List<ServiceOrgTowerCourtyardInformation> serviceOrgTowerCourtyardInformations = serviceOrgTowerCourtyardInformationService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            for (ServiceOrgTowerCourtyardInformation orgTowerCourtyardInformation : serviceOrgTowerCourtyardInformations) {
                if (orgTowerCourtyardInformation.getTowerCourtyardNum().equals(towerCourtyardNum)) {

                List<ServiceOrgFloorInformation> serviceOrgFloorInformations = serviceOrgFloorInformationService.selectByTowerCourtyardId(orgTowerCourtyardInformation.getId());
                for (ServiceOrgFloorInformation serviceOrgFloorInformation : serviceOrgFloorInformations) {
                    strList = new ArrayList<>();
                    List<ServiceOrgTowerRoomInformation> serviceOrgTowerRoomInformations = serviceOrgTowerRoomInformationService.selectByFloorId(serviceOrgFloorInformation.getId());
                    for (ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation : serviceOrgTowerRoomInformations) {
                        strList.add(serviceOrgTowerRoomInformation.getRoomNum());
                        List<ServiceOrgBedsInformation> serviceOrgBedsInformations = serviceOrgBedsInformationService.selectByRoomId(serviceOrgTowerRoomInformation.getId());
                        for (ServiceOrgBedsInformation serviceOrgBedsInformation : serviceOrgBedsInformations) {

                            if (serviceOrgBedsInformation.getBedsState() == 1) {
                                FreeBedNum++;
                            }
                            if(serviceOrgBedsInformation.getBedsState() ==2){
                                checkInElderNum++;
                            }

                        }
                        map.put(serviceOrgTowerRoomInformation.getRoomNum(), FreeBedNum);
                        FreeBedNum = 0;
                    }
                    /* map1.put(serviceOrgFloorInformation.getFloorNumber(),strList);*/
                    arrayList.add(strList);
                }
            }
        }
            map.put("floor",arrayList);
            /*Integer uid = userService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId())).getUid();
            List<ServiceOrgElderly> serviceOrgElderly=serviceOrgElderlyService.selectByServiceOrgId(uid);
            for (ServiceOrgElderly orgElderly : serviceOrgElderly) {
                if(orgElderly.getCheckOutTime()==null){
                    checkInElderNum++;
                }
            }*/
            map.put("checkInElderNum",checkInElderNum);

        }

        return map;
    }


    /**
     * 根据房间编号获取老人房间床位信息
     * @return
     */
    @RequestMapping("findElderAndRoomNumByroomNum")
    @ResponseBody
    public AppResult findElderAndRoomNumByroomNum(String roomNum){

        try {
            List<String> leisureBedNumber=new ArrayList<>();
            List<ElderlyMsg> elderlyMsgs = new ArrayList<>() ;
            ServiceOrgTowerRoomInformation information = serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum, currentUser().getServiceOrgId());
            Integer uid = userService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId())).getUid();
            //查询床位
            List<ServiceOrgBedsInformation> orgBedsInformations = serviceOrgBedsInformationService.selectByRoomId(information.getId());

            orgBedsInformations.forEach(o->{
                //空闲床位
                if(o!=null&&o.getBedsState()==1){
                    leisureBedNumber.add(o.getBedNumber());
                }
                //查询老人入住信息
                List<ServiceOrgElderly> serviceOrgElderlies = serviceOrgElderlyService.selectByServiceOrgIdAndBedNumber(uid,o.getBedNumber());
                for (ServiceOrgElderly serviceOrgElderly : serviceOrgElderlies) {
                    //判断该房间是否有老人入住
                    if(serviceOrgElderly!=null && serviceOrgElderly.getCheckOutTime()==null){
                        //查询入住老人的信息
                        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(serviceOrgElderly.getElderlyMsg().getId());
                        elderlyMsg.setCheckInTime(serviceOrgElderly.getCheckInTime());
                        elderlyMsg.setBedNumber(serviceOrgElderly.getBedNumber());
                        elderlyMsg.setDisableStutiation(serviceOrgElderly.getDisableStutiation());
                        //查询老人相关联系人
                        List<ElderLinkMan> elderLinkMEN = elderLinkManService.selectByElderId(serviceOrgElderly.getElderlyMsg().getId());
                        for (ElderLinkMan elderLinkMAN : elderLinkMEN) {
                            elderlyMsg.setLinkName(elderLinkMAN.getLinkName());
                            elderlyMsg.setLinkTel(elderLinkMAN.getLinkTel());
                        }
                        elderlyMsgs.add(elderlyMsg);
                    }
                }
            });
            information.setElderlyMsgs(elderlyMsgs);
            information.setLeisureBedNumber(leisureBedNumber);

            return AppResult.ok("查询成功",information);
        }catch (Exception e){
            e.printStackTrace();
            return AppResult.error("查询异常");
        }
    }




}
