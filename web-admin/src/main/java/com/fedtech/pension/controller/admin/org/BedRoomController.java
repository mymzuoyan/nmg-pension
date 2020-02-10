package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author gxy
 * @date 2019/10/11 - 20:59
 */


@Controller
@RequestMapping("/admin/serviceOrg/BedRoomManager/")
@EnableScheduling
public class BedRoomController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceOrgTowerCourtyardInformationService serviceOrgTowerCourtyardInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgFloorInformationService serviceOrgFloorInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerRoomInformationService serviceOrgTowerRoomInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgBedsInformationService serviceOrgBedsInformationService;


    @Reference(version = "1.0.0")
    private HealthRecordsService healthRecordsService;
    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;
    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");



    /**
     * 房间床位信息管理
     * @return
     */
    @RequestMapping("List")
    public  String  showBedRoomList(Model model){
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "bed_room_list";
    }

    /**
     * 根据id查询楼院楼层信息
     * @return
     */
    @RequestMapping("findTowerCourtyardId")
    @ResponseBody
    public String findTowerCourtyardId(ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation,Integer floorId){
        serviceOrgTowerCourtyardInformation = serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgTowerCourtyardInformation.getId());
        ServiceOrgFloorInformation serviceOrgFloorInformation = serviceOrgFloorInformationService.selectByPrimaryKey(floorId);
        return serviceOrgTowerCourtyardInformation.getTowerCourtyardNum() + serviceOrgFloorInformation.getFloorNumber();
    }

    /**
     * 根据房间编号查询床位编号
     * @return
     */
    @RequestMapping("findBedNumberByRoomNum")
    @ResponseBody
    public List<String> findBedNumberByRoomNum(ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation){

        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgId=currentUser().getServiceOrgId();
        }

        List<ServiceOrgTowerRoomInformation> roomList= serviceOrgTowerRoomInformationService.selectByFloorNumber(serviceOrgTowerRoomInformation.getRoomNum(), serviceOrgId );
        List<String> strList = new ArrayList<>();
        String status;
        for(int i = 0; i < roomList.size(); i++){
            List<ServiceOrgBedsInformation> bedList = serviceOrgBedsInformationService.selectByRoomId(roomList.get(i).getId());
            for(int j = 0; j < bedList.size(); j++){
                strList.add(roomList.get(i).getRoomNum());
                strList.add(bedList.get(j).getBedNumber());
                if(bedList.get(j).getBedsState() == 1){
                    status = "空闲";
                }else{
                    status = "使用中";
                }
                strList.add(status);
            }
        }
        return strList;
    }

    /**
     * 楼院信息管理列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getTowerCourtyardList")
    @ResponseBody
    public PageResponse<ServiceOrgTowerCourtyardInformation> getTowerCourtyardList(ServiceOrgTowerCourtyardInformation filter, PageRequest pageRequest) throws Exception{
        if(getCurrentUser().hasRole(RoleType.JgAdmin.getValue())){
            filter.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        return  serviceOrgTowerCourtyardInformationService.selectPageList(filter,pageRequest);
    }



    /**
     * 删除楼院记录信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteTowerCourtyard", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除楼院记录信息")
    public JsonResult deleteTowerCourtyard(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;

        if(serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(id).getKickafk()!=0){
            result.markError("楼院存在楼层信息，请先删除楼层信息再删除楼院信息！");
        }else{
            if (serviceOrgTowerCourtyardInformationService.deleteByPrimaryKey(id)) {
                b = true;
            }
            if (b) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }



    /**
     * 楼院新增信息列表
     *
     * @return
     */
   /* @RequestMapping("TowerCourtyardAdd")*/
    @RequestMapping("TowerCourtyardAdd")
    @ResponseBody
    @SystemControllerLog(description = "新增楼院信息")
    public JsonResult TowerCourtyardAdd(ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation) {
        JsonResult result = new JsonResult();
        //ServiceOrgTowerCourtyardInformation serviceOrgFloorInformation1= serviceOrgTowerCourtyardInformationService.selectByTowerCourtyardNum(serviceOrgTowerCourtyardInformation.getTowerCourtyardNum());

        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation1 = serviceOrgTowerCourtyardInformationService.selectByTowerCourtyardNumAndServiceOrgId(serviceOrgTowerCourtyardInformation.getTowerCourtyardNum(), Integer.parseInt(currentUser().getServiceOrgId()));

        if(getCurrentUser().hasRole(RoleType.JgAdmin.getValue())){
            serviceOrgTowerCourtyardInformation.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        if(serviceOrgTowerCourtyardInformation1==null){
            serviceOrgTowerCourtyardInformation.setKickafk(0);
            serviceOrgTowerCourtyardInformation.setRooms(0);
            serviceOrgTowerCourtyardInformation.setBedNum(0);
            if (serviceOrgTowerCourtyardInformationService.insert(serviceOrgTowerCourtyardInformation)) {
                result.markSuccess("新增楼院信息成功", null);
            } else {
                result.markSuccess("新增楼院信息失败", null);
            }
            return result;
        }else {
            result.markSuccess("楼院编号已存在", null);
            return result;
        }

        /*return ADMIN_PREFIX + "tower_courtyard_add";*/
    }

//
//    /**
//     * 楼院记录新增
//     * @return
//     */
//    @RequestMapping(value = "TowerCourtyardsAdd", method = RequestMethod.POST)
//    @ResponseBody
//    @SystemControllerLog(description = "楼院记录新增")
//    public JsonResult TowerCourtyardsAdd(ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation) {
//        JsonResult result = new JsonResult();
//        if (serviceOrgTowerCourtyardInformationService.insert(serviceOrgTowerCourtyardInformation)) {
//            result.markSuccess("添加楼院记录新增成功", null);
//        } else {
//            result.markError("添加楼院记录新增失败");
//        }
//        return result;
//    }



    /**
     * 楼层信息管理列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getFloorList")
    @ResponseBody
    public PageResponse<ServiceOrgFloorInformation> getTowerCourtyardList(ServiceOrgFloorInformation filter, PageRequest pageRequest,Integer towerCourtyardId) throws Exception{

        filter.setTowerCourtyardId(towerCourtyardId);
        return serviceOrgFloorInformationService.selectPageList(filter,pageRequest);
    }


    /**
     * 删除楼层记录信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteFloor", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除楼层记录信息")
    public JsonResult deleteFloor(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        ServiceOrgFloorInformation serviceOrgFloorInformation=serviceOrgFloorInformationService.selectByPrimaryKey(id);
        Integer towerCourtyardId=serviceOrgFloorInformation.getTowerCourtyardId();
        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(towerCourtyardId);
        serviceOrgTowerCourtyardInformation.setKickafk(serviceOrgTowerCourtyardInformation.getKickafk()-1);
        if(serviceOrgFloorInformationService.selectByPrimaryKey(id).getRooms()!=0){
            result.markError("楼层存在房间信息，请先删除房间信息再删除楼层信息！");
        }else{
            if (serviceOrgFloorInformationService.deleteByPrimaryKey(id)) {
                b = true;
                serviceOrgTowerCourtyardInformationService.updateByPrimaryKeySelective(serviceOrgTowerCourtyardInformation);
            }
            if (b) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }


    /**
     * 新增楼层信息
     * @param serviceOrgFloorInformation
     * @return
     */
    @RequestMapping("floorAdd")
    @ResponseBody
    @SystemControllerLog(description = "新增楼层信息")
    public JsonResult floorAdd(ServiceOrgFloorInformation serviceOrgFloorInformation,Integer towerCourtyardId) {
        JsonResult result = new JsonResult();
        ServiceOrgFloorInformation serviceOrgFloorInformation1= serviceOrgFloorInformationService.selectByFloorNumber(serviceOrgFloorInformation.getFloorNumber(),towerCourtyardId);
        if(serviceOrgFloorInformation1==null){
            serviceOrgFloorInformation.setBedNum(0);
            serviceOrgFloorInformation.setRooms(0);
            serviceOrgFloorInformation.setTowerCourtyardId(towerCourtyardId);
            ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(towerCourtyardId);
            serviceOrgTowerCourtyardInformation.setKickafk(serviceOrgTowerCourtyardInformation.getKickafk()+1);
            if (serviceOrgFloorInformationService.insert(serviceOrgFloorInformation)) {
                serviceOrgTowerCourtyardInformationService.updateByPrimaryKeySelective(serviceOrgTowerCourtyardInformation);
                result.markSuccess("新增楼层信息成功", null);
            } else {
                result.markSuccess("新增楼层信息失败", null);
            }
            return result;
        }else {
            result.markSuccess("楼层编号已存在", null);
            return result;
        }


    }



    /**
     * 房间信息管理列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getRoomList")
    @ResponseBody
    public PageResponse<ServiceOrgTowerRoomInformation> getRoomList(ServiceOrgTowerRoomInformation filter, PageRequest pageRequest,Integer floorId) throws Exception{


        filter.setFloorId(floorId);

        return serviceOrgTowerRoomInformationService.selectPageList(filter,pageRequest);
    }


    /**
     * 新增房间信息
     * @param serviceOrgTowerRoomInformation
     * @return
     */
    @RequestMapping("RoomAdd")
    @ResponseBody
    @SystemControllerLog(description = "新增房间信息")
    public JsonResult RoomAdd(ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation,Integer floorId ) {
        JsonResult result = new JsonResult();

        ServiceOrgFloorInformation serviceOrgFloorInformation2 = serviceOrgFloorInformationService.selectByPrimaryKey(floorId);
        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation2=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgFloorInformation2.getTowerCourtyardId());
        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation1 =serviceOrgTowerRoomInformationService.selectByFloorNumberAndfloorId(serviceOrgTowerCourtyardInformation2.getTowerCourtyardNum() + serviceOrgFloorInformation2.getFloorNumber()+serviceOrgTowerRoomInformation.getRoomNum(),floorId);
        if(serviceOrgTowerRoomInformation1==null){

            serviceOrgTowerRoomInformation.setRoomStatus(2);
            serviceOrgTowerRoomInformation.setBedNum(0);
            serviceOrgTowerRoomInformation.setFloorId(floorId);
            ServiceOrgFloorInformation serviceOrgFloorInformation=serviceOrgFloorInformationService.selectByPrimaryKey(floorId);
            serviceOrgFloorInformation.setRooms(serviceOrgFloorInformation.getRooms()+1);

            ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgFloorInformation.getTowerCourtyardId());
            serviceOrgTowerCourtyardInformation.setRooms(serviceOrgTowerCourtyardInformation.getRooms()+1);

            serviceOrgTowerRoomInformation.setRoomNum(serviceOrgTowerCourtyardInformation.getTowerCourtyardNum()+serviceOrgFloorInformation.getFloorNumber()+serviceOrgTowerRoomInformation.getRoomNum());
            if(serviceOrgTowerRoomInformationService.insert(serviceOrgTowerRoomInformation)){
                serviceOrgTowerCourtyardInformationService.updateByPrimaryKeySelective(serviceOrgTowerCourtyardInformation);
                serviceOrgFloorInformationService.updateByPrimaryKeySelective(serviceOrgFloorInformation);
                result.markSuccess("新增房间信息成功", null);
            }else{
                result.markSuccess("新增房间信息失败", null);
            }
            return result;

        }else{
            result.markSuccess("房间号已存在", null);
            return result;
        }
    }




    /**
     * 删除房间信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteRoom", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除房间信息")
    public JsonResult deleteRoom(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation=serviceOrgTowerRoomInformationService.selectByPrimaryKey(id);
        Integer floorId=serviceOrgTowerRoomInformation.getFloorId();
        ServiceOrgFloorInformation ServiceOrgFloorInformation=serviceOrgFloorInformationService.selectByPrimaryKey(floorId);
        ServiceOrgFloorInformation.setRooms(ServiceOrgFloorInformation.getRooms()-1);
        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation= serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(ServiceOrgFloorInformation.getTowerCourtyardId());
        serviceOrgTowerCourtyardInformation.setRooms(serviceOrgTowerCourtyardInformation.getRooms()-1);
        if(serviceOrgTowerRoomInformationService.selectByPrimaryKey(id).getBedNum()!=0){
            result.markError("房间存在床位信息，请先删除床位信息再删除房间信息！");
        }else {
            if (serviceOrgTowerRoomInformationService.deleteByPrimaryKey(id)) {
                b = true;
                serviceOrgFloorInformationService.updateByPrimaryKeySelective(ServiceOrgFloorInformation);
                serviceOrgTowerCourtyardInformationService.updateByPrimaryKeySelective(serviceOrgTowerCourtyardInformation);
            }
            if (b) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }


    /**
     * 床位信息管理列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getBedsList")
    @ResponseBody
    public PageResponse<ServiceOrgBedsInformation> getBedsList(ServiceOrgBedsInformation filter, PageRequest pageRequest,Integer roomId) throws Exception{

        filter.setRoomId(roomId);
        return serviceOrgBedsInformationService.selectPageList(filter,pageRequest);
    }

    /**
     * 新增床位信息
     * @param serviceOrgBedsInformation
     * @return
     */
    @RequestMapping("bedsAdd")
    @ResponseBody
    @SystemControllerLog(description = "新增床位信息")
    public JsonResult bedsAdd(ServiceOrgBedsInformation serviceOrgBedsInformation,Integer roomId) {
        JsonResult result = new JsonResult();


        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation2 = serviceOrgTowerRoomInformationService.selectByPrimaryKey(roomId);

        ServiceOrgBedsInformation serviceOrgBedsInformation1= serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgTowerRoomInformation2.getRoomNum()+serviceOrgBedsInformation.getBedNumber(),roomId);
        if(serviceOrgBedsInformation1==null){
            serviceOrgBedsInformation.setBedsState(1);
            serviceOrgBedsInformation.setRoomId(roomId);
            ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation=serviceOrgTowerRoomInformationService.selectByPrimaryKey(roomId);
            serviceOrgTowerRoomInformation.setBedNum(serviceOrgTowerRoomInformation.getBedNum()+1);
            ServiceOrgFloorInformation serviceOrgFloorInformation=serviceOrgFloorInformationService.selectByPrimaryKey(serviceOrgTowerRoomInformation.getFloorId());
            serviceOrgFloorInformation.setBedNum(serviceOrgFloorInformation.getBedNum()+1);
            ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgFloorInformation.getTowerCourtyardId());
            serviceOrgTowerCourtyardInformation.setBedNum(serviceOrgTowerCourtyardInformation.getBedNum()+1);
            serviceOrgBedsInformation.setBedNumber(serviceOrgTowerRoomInformation.getRoomNum()+serviceOrgBedsInformation.getBedNumber());
            if (serviceOrgBedsInformationService.insert(serviceOrgBedsInformation)) {
                serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
                serviceOrgFloorInformationService.updateByPrimaryKeySelective(serviceOrgFloorInformation);
                serviceOrgTowerCourtyardInformationService.updateByPrimaryKeySelective(serviceOrgTowerCourtyardInformation);
                result.markSuccess("新增房间信息成功", null);
            } else {
                result.markSuccess("新增房间信息失败", null);
            }
            return result;
        }else {
            result.markSuccess("房间编号已存在", null);
            return result;
        }


    }



    /**
     * 删除床位记录信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteBeds", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除床位记录信息")
    public JsonResult deleteBeds(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        ServiceOrgBedsInformation serviceOrgBedsInformation1 = serviceOrgBedsInformationService.selectByPrimaryKey(id);
        if(serviceOrgBedsInformation1.getBedsState()==2){
            result.markError("该床位已占用，不可删除");
            return result;
        }

        ServiceOrgBedsInformation serviceOrgBedsInformation=serviceOrgBedsInformationService.selectByPrimaryKey(id);
        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation=serviceOrgTowerRoomInformationService.selectByPrimaryKey(serviceOrgBedsInformation.getRoomId());
        serviceOrgTowerRoomInformation.setBedNum(serviceOrgTowerRoomInformation.getBedNum()-1);
        ServiceOrgFloorInformation serviceOrgFloorInformation=serviceOrgFloorInformationService.selectByPrimaryKey(serviceOrgTowerRoomInformation.getFloorId());
        serviceOrgFloorInformation.setBedNum(serviceOrgFloorInformation.getBedNum()-1);
        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgFloorInformation.getTowerCourtyardId());
        serviceOrgTowerCourtyardInformation.setBedNum(serviceOrgTowerCourtyardInformation.getBedNum()-1);

        if (serviceOrgBedsInformationService.deleteByPrimaryKey(id)) {
            serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
            serviceOrgFloorInformationService.updateByPrimaryKeySelective(serviceOrgFloorInformation);
            serviceOrgTowerCourtyardInformationService.updateByPrimaryKeySelective(serviceOrgTowerCourtyardInformation);
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }
    


    /**
     * 根据id查询房间编号
     * @return
     */
    @RequestMapping("findRoomNum")
    @ResponseBody
    public String findRoomNum(Integer roomId){
        return serviceOrgTowerRoomInformationService.selectByPrimaryKey(roomId).getRoomNum();

    }


    /**
     * 房间记录详情更新
     *
     * @return
     */
    @RequestMapping("roomDetailAndUpdate")
    public String roomDetailAndUpdate(Model model, ServiceOrgTowerRoomInformation filter) {
        filter=serviceOrgTowerRoomInformationService.selectByPrimaryKey(filter.getId());

        ServiceOrgFloorInformation serviceOrgFloorInformation = serviceOrgFloorInformationService.selectByPrimaryKey(filter.getFloorId());
        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgFloorInformation.getTowerCourtyardId());
        int lengthNum=serviceOrgTowerCourtyardInformation.getTowerCourtyardNum().length() + serviceOrgFloorInformation.getFloorNumber().length();
        filter.setRoomNum(filter.getRoomNum().substring(lengthNum));
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "room_detail_and_update";
    }

    /**
     * 更新房间记录详情
     *
     * @param
     * @return
     */
    @RequestMapping(value = "updateRoom", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新房间记录详情")
    public JsonResult updateRoom(ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation) {
        JsonResult result = new JsonResult();

        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation3=serviceOrgTowerRoomInformationService.selectByPrimaryKey(serviceOrgTowerRoomInformation.getId());

        if(serviceOrgTowerRoomInformation.getRoomNum().equals(serviceOrgTowerRoomInformation3.getRoomNum())){

            if (serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation)) {
                result.markSuccess("更新房间记录信息成功", null);
            } else {
                result.markError("更新房间记录信息失败");
            }
            return result;
        }else{
            ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation1 =serviceOrgTowerRoomInformationService.selectByFloorNumberAndfloorId(serviceOrgTowerRoomInformation.getRoomNum(),serviceOrgTowerRoomInformation.getFloorId());
            if(serviceOrgTowerRoomInformation1==null){
                if (serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation)) {
                    result.markSuccess("更新房间记录信息成功", null);
                } else {
                    result.markError("更新房间记录信息失败");
                }
            }else{
                result.markSuccess("房间号已存在", null);

            }

        }


        return result;
    }


    /**
     * 根据房间id查询楼层楼院编号
     * @return
     */
    @RequestMapping("findNumByIds")
    @ResponseBody
    public String findNumByIds(Integer roomIds){

        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation = serviceOrgTowerRoomInformationService.selectByPrimaryKey(roomIds);
        ServiceOrgFloorInformation serviceOrgFloorInformation = serviceOrgFloorInformationService.selectByPrimaryKey(serviceOrgTowerRoomInformation.getFloorId());
        ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation=serviceOrgTowerCourtyardInformationService.selectByPrimaryKey(serviceOrgFloorInformation.getTowerCourtyardId());
        return serviceOrgTowerCourtyardInformation.getTowerCourtyardNum() + serviceOrgFloorInformation.getFloorNumber();
    }

}
