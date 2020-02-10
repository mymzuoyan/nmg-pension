package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.data.kindeditor.UploadResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zhangcz
 * @date 2017/12/27
 * 服务人员
 */
@Controller
@RequestMapping("/admin/api/user/fuwu/")
public class UserFuWuApiController extends BaseController {
    protected Logger logger = LoggerFactory.getLogger(UserFuWuApiController.class);

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private UserFuWuCertificateService userFuWuCertificateService;

    @Reference(version = "1.0.0")
    private UserFuWuTrainService userFuWuTrainService;

    @Reference(version = "1.0.0")
    private UserFuWuPrizeService userFuWuPrizeService;

    @Reference(version = "1.0.0")
    private UserFuWuQuitService userFuWuQuitService;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    /**
     * 获取服务人员列表
     *
     * @param userFuWu    (serviceOrgType：1.组织、2.机构)
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    @SystemControllerLog(description = "获取服务人员列表")
    public PageResponse<UserFuWu> getFuwuList(UserFuWu userFuWu, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            userFuWu.setAreaName(currentUser().getAreaName());
        }
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            userFuWu.setServiceOrgName(currentUser().getServiceOrgName());
        }
        PageResponse<UserFuWu> dataTable = userFuwuService.selectPageList(userFuWu, pageRequest);
        return dataTable;
    }

    /**
     * 获取从业人员证书信息列表
     * @param pageRequest
     * @return
     */
    @RequestMapping("certificateList")
    @ResponseBody
    @SystemControllerLog(description = "获取从业人员证书信息列表")
    public PageResponse<UserFuWuCertificate> getCertificateList(UserFuWuCertificate userFuWuCertificate, PageRequest pageRequest, Integer serviceOrgId) {
        userFuWuCertificate.setServiceOrgId(serviceOrgId);
        PageResponse<UserFuWuCertificate> dataTable = userFuWuCertificateService.selectPageList(userFuWuCertificate, pageRequest);
        return dataTable;
    }

    /**
     * 获取从业人员培训信息列表
     * @param pageRequest
     * @return
     */
    @RequestMapping("trainList")
    @ResponseBody
    @SystemControllerLog(description = "获取从业人员培训信息列表")
    public PageResponse<UserFuWuTrain> getTrainList(UserFuWuTrain userFuWuTrain, PageRequest pageRequest, Integer serviceOrgId) {
        userFuWuTrain.setServiceOrgId(serviceOrgId);
        PageResponse<UserFuWuTrain> dataTable = userFuWuTrainService.selectPageList(userFuWuTrain, pageRequest);
        return dataTable;
    }

    /**
     * 获取从业人员获奖信息列表
     * @param pageRequest
     * @return
     */
    @RequestMapping("prizeList")
    @ResponseBody
    @SystemControllerLog(description = "获取从业人员获奖信息列表")
    public PageResponse<UserFuWuPrize> getPrizeList(UserFuWuPrize userFuWuPrize, PageRequest pageRequest, Integer serviceOrgId) {
        userFuWuPrize.setServiceOrgId(serviceOrgId);
        PageResponse<UserFuWuPrize> dataTable = userFuWuPrizeService.selectPageList(userFuWuPrize, pageRequest);
        return dataTable;
    }

    /**
     * 获取从业人员离职信息列表
     * @param pageRequest
     * @return
     */
    @RequestMapping("quitList")
    @ResponseBody
    @SystemControllerLog(description = "获取从业人员离职信息列表")
    public PageResponse<UserFuWuQuit> getQuitList(UserFuWuQuit userFuWuQuit, PageRequest pageRequest, Integer serviceOrgId) {
        userFuWuQuit.setServiceOrgId(serviceOrgId);
        PageResponse<UserFuWuQuit> dataTable = userFuWuQuitService.selectPageList(userFuWuQuit, pageRequest);
        return dataTable;
    }

    /**
     * 添加从业人员证书信息
     * @param userFuWuCertificate
     * @return
     */
    @RequestMapping("certificateAdd")
    @ResponseBody
    @SystemControllerLog(description = "添加从业人员证书信息")
    public JsonResult certificateAdd(UserFuWuCertificate userFuWuCertificate) {
        JsonResult result = new JsonResult();
        if (userFuWuCertificateService.insert(userFuWuCertificate)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 添加从业人员培训信息
     * @param userFuWuTrain
     * @return
     */
    @RequestMapping("trainAdd")
    @ResponseBody
    @SystemControllerLog(description = "添加从业人员培训信息")
    public JsonResult trainAdd(UserFuWuTrain userFuWuTrain) {
        JsonResult result = new JsonResult();
        if (userFuWuTrainService.insert(userFuWuTrain)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 添加从业人员获奖信息
     * @param userFuWuPrize
     * @return
     */
    @RequestMapping("prizeAdd")
    @ResponseBody
    @SystemControllerLog(description = "添加从业人员获奖信息")
    public JsonResult prizeAdd(UserFuWuPrize userFuWuPrize) {
        JsonResult result = new JsonResult();
        if (userFuWuPrizeService.insert(userFuWuPrize)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 添加从业人员离职信息
     * @param userFuWuQuit
     * @return
     */
    @RequestMapping("quitAdd")
    @ResponseBody
    @SystemControllerLog(description = "添加从业人员离职信息")
    public JsonResult quitAdd(UserFuWuQuit userFuWuQuit) {
        String idcardno = userFuWuQuit.getIdcardno();
        String sex = idcardno.substring(idcardno.length()-2,idcardno.length()-1);
        userFuWuQuit.setGender(sex);
        UserFuWu userFuWu = userFuwuService.selectByCardNo(idcardno);
        userFuWuQuit.setUserType(userFuWu.getUserType() + "");
        JsonResult result = new JsonResult();
        if (userFuWuQuitService.insert(userFuWuQuit)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 修改从业人员证书信息
     * @param userFuWuCertificate
     * @return
     */
    @RequestMapping("certificateUpdate")
    @ResponseBody
    @SystemControllerLog(description = "修改从业人员证书信息")
    public JsonResult certificateUpdate(UserFuWuCertificate userFuWuCertificate) {
        JsonResult result = new JsonResult();
        if (userFuWuCertificateService.updateByPrimaryKeySelective(userFuWuCertificate)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }

    /**
     * 修改从业人员培训信息
     * @param userFuWuTrain
     * @return
     */
    @RequestMapping("trainUpdate")
    @ResponseBody
    @SystemControllerLog(description = "修改从业人员培训信息")
    public JsonResult trainUpdate(UserFuWuTrain userFuWuTrain) {
        JsonResult result = new JsonResult();
        if (userFuWuTrainService.updateByPrimaryKeySelective(userFuWuTrain)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }

    /**
     * 修改从业人员获奖信息
     * @param userFuWuPrize
     * @return
     */
    @RequestMapping("prizeUpdate")
    @ResponseBody
    @SystemControllerLog(description = "修改从业人员获奖信息")
    public JsonResult prizeUpdate(UserFuWuPrize userFuWuPrize) {
        JsonResult result = new JsonResult();
        if (userFuWuPrizeService.updateByPrimaryKeySelective(userFuWuPrize)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }

    /**
     * 修改从业人员离职信息
     * @param userFuWuQuit
     * @return
     */
    @RequestMapping("quitUpdate")
    @ResponseBody
    @SystemControllerLog(description = "修改从业人员离职信息")
    public JsonResult prizeUpdate(UserFuWuQuit userFuWuQuit) {
        JsonResult result = new JsonResult();
        if (userFuWuQuitService.updateByPrimaryKeySelective(userFuWuQuit)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }

    /**
     * 删除从业人员证书信息
     * @return
     */
    @RequestMapping("delCertificate")
    @ResponseBody
    @SystemControllerLog(description = "删除从业人员证书信息")
    public JsonResult delCertificate(Integer id) {
        JsonResult result = new JsonResult();
        if(userFuWuCertificateService.deleteByPrimaryKey(id)){
            result.markSuccess("删除成功", null);
        }else{
            result.markError("删除失败");
        }

        return result;
    }

    /**
     * 删除从业人员培训信息
     * @return
     */
    @RequestMapping("delTrain")
    @ResponseBody
    @SystemControllerLog(description = "删除从业人员培训信息")
    public JsonResult delTrain(Integer id) {
        JsonResult result = new JsonResult();
        if(userFuWuTrainService.deleteByPrimaryKey(id)){
            result.markSuccess("删除成功", null);
        }else{
            result.markError("删除失败");
        }

        return result;
    }

    /**
     * 删除从业人员获奖信息
     * @return
     */
    @RequestMapping("delPrize")
    @ResponseBody
    @SystemControllerLog(description = "删除从业人员获奖信息")
    public JsonResult delPrize(Integer id) {
        JsonResult result = new JsonResult();
        if(userFuWuPrizeService.deleteByPrimaryKey(id)){
            result.markSuccess("删除成功", null);
        }else{
            result.markError("删除失败");
        }

        return result;
    }

    /**
     * 删除从业人员离职信息
     * @return
     */
    @RequestMapping("delQuit")
    @ResponseBody
    @SystemControllerLog(description = "删除从业人员离职信息")
    public JsonResult delQuit(Integer id) {
        JsonResult result = new JsonResult();
        if(userFuWuQuitService.deleteByPrimaryKey(id)){
            result.markSuccess("删除成功", null);
        }else{
            result.markError("删除失败");
        }

        return result;
    }

    /**
     * 批量删除从业人员证书信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("delSomeCertificate")
    @ResponseBody
    public JsonResult delSomeCertificate(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (userFuWuCertificateService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 批量删除从业人员培训信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("delSomeTrain")
    @ResponseBody
    public JsonResult delSomeTrain(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (userFuWuTrainService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 批量删除从业人员获奖信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("delSomePrize")
    @ResponseBody
    public JsonResult delSomePrize(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (userFuWuPrizeService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 批量删除从业人员离职信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("delSomeQuit")
    @ResponseBody
    public JsonResult delSomeQuit(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (userFuWuQuitService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 获取从业人员信息
     *
     * @return
     */
    @RequestMapping(value = "getEmployeeByCardNo", method = RequestMethod.POST)
    @ResponseBody
    public UserFuWu getElderByCardNo(UserFuWu userFuWu,String cardNo,Integer serviceOrgId) {
        userFuWu.setIdcardno(cardNo);
        userFuWu.setServiceOrgId(serviceOrgId);
        if (StringUtils.isEmpty(cardNo)) {
            return null;
        } else {
            userFuWu = userFuwuService.selectByIdCardNoAndServiceOrgId(userFuWu);
        }
        return userFuWu;
    }

    /**
     * 服务人员记录列表
     *
     * @param userFuWu
     * @param pageRequest
     * @return
     */
    @RequestMapping("record/listData")
    @ResponseBody
    public PageResponse<UserFuWu> getRecordList(UserFuWu userFuWu, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            userFuWu.setAreaName(currentUser().getAreaName());
        }
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            userFuWu.setServiceOrgName(currentUser().getServiceOrgName());
        }
        PageResponse<UserFuWu> dataTable = userFuwuService.selectRecordPageList(userFuWu, pageRequest);
        return dataTable;
    }

    /**
     * 服务人员反馈列表
     *
     * @param userFuWu
     * @param pageRequest
     * @return
     */
    @RequestMapping("feedback/listData")
    @ResponseBody
    public PageResponse<UserFuWu> getFeedbackList(UserFuWu userFuWu, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            userFuWu.setAreaName(currentUser().getAreaName());
        }

        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            userFuWu.setServiceOrgName(currentUser().getServiceOrgName());
        }
        PageResponse<UserFuWu> dataTable = userFuwuService.selectFeedbackPageList(userFuWu, pageRequest);
        return dataTable;
    }

    /**
     * 服务人员反馈列表所有
     *
     * @param userFuWu
     * @return
     */
    @RequestMapping("feedback/allData")
    @ResponseBody
    public List<UserFuWu> getFeedbackAllList(UserFuWu userFuWu) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            userFuWu.setServiceOrgName(currentUser().getServiceOrgName());
        }
        return userFuwuService.selectFeedbackList(userFuWu);
    }


    @RequestMapping("add")
    @ResponseBody
    @SystemControllerLog(description = "添加服务人员")
    public JsonResult addFuwu(UserFuWu userFuWu) {
        JsonResult result = new JsonResult();
        String idcardno = userFuWu.getIdcardno();
        if (!StringUtils.isEmpty(idcardno)) {
            if (userFuwuService.selectByIdCardNo(idcardno) != null) {
                result.markError("该服务人员已存在");
            } else {
                if (userFuwuService.insert(userFuWu)) {
                    result.markSuccess("添加成功", null);
                } else {
                    result.markError("添加失败");
                }
            }
        }
        return result;
    }

    @RequestMapping("update")
    @ResponseBody
    @SystemControllerLog(description = "更新服务人员")
    public JsonResult updateFuwu(UserFuWu userFuWu) {
        JsonResult result = new JsonResult();
        String idcardno = userFuWu.getIdcardno();
        if (!StringUtils.isEmpty(idcardno)) {
            if (userFuwuService.selectByIdCardNo(idcardno) != null) {
                if (idcardno.equals(userFuwuService.selectByIdCardNo(idcardno).getIdcardno())) {
                    if (userFuwuService.updateByPrimaryKeySelective(userFuWu)) {
                        if (!StringUtils.isEmpty(userFuWu.getUserId())) {
                        }
                        result.markSuccess("更新成功", null);
                    } else {
                        result.markError("更新失败");
                    }
                } else {
                    result.markError("该服务人员已存在");
                }
            } else {
                if (userFuwuService.updateByPrimaryKeySelective(userFuWu)) {
                    if (!StringUtils.isEmpty(userFuWu.getUserId())) {
                    }
                    result.markSuccess("更新成功", null);
                } else {
                    result.markError("更新失败");
                }
            }
        }
        return result;
    }

    @RequestMapping("delete")
    @ResponseBody
    @SystemControllerLog(description = "删除服务人员")
    public JsonResult deteleFuwu(Integer id) {
        JsonResult result = new JsonResult();
        UserFuWu userFuWu = userFuwuService.selectByPrimaryKey(id);
        if (userFuwuService.deleteByPrimaryKey(id)) {
            if (!StringUtils.isEmpty(userFuWu.getUserId())) {
                List<Integer> uids = new ArrayList<>();
                uids.add(userFuWu.getUserId());
                if (userService.updateUsers(2, uids)) {
                    result.markSuccess("删除成功", null);
                } else {
                    result.markError("删除失败");
                }
            }
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    @RequestMapping("deleteSomeUser")
    @ResponseBody
    @SystemControllerLog(description = "批量删除服务人员信息")
    public JsonResult deleteSomeUser(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> uids = new ArrayList<>();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                    UserFuWu userFuWu = userFuwuService.selectByPrimaryKey(Integer.parseInt(deleteIds.split(",")[i]));
                    if (!StringUtils.isEmpty(userFuWu.getUserId())) {
                        uids.add(userFuWu.getUserId());
                    }
                }
            }
            if (userFuwuService.deleteSomeUser(idList)) {
                if (ObjectUtils.isNotNull(uids)) {
                    if (userService.updateUsers(2, uids)) {
                        result.markSuccess("删除成功", null);
                    } else {
                        result.markError("删除失败");
                    }
                } else {
                    result.markSuccess("删除成功", null);
                }
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    @RequestMapping(value = "upload")
    @ResponseBody
    public UploadResult uploadFile(HttpServletRequest request, @RequestParam("idPhotos") MultipartFile idPhotos, @RequestParam("path") String path,
                                   @RequestParam(value = "createThumbnail", defaultValue = "false", required = false) boolean createThumbnail,
                                   @RequestParam(value = "thumbnailWidth", defaultValue = "200", required = false) Integer thumbnailWidth,
                                   @RequestParam(value = "thumbnailHeight", defaultValue = "300", required = false) Integer thumbnailHeight) {
        UploadResult res = new UploadResult();
        FileUtil util = new FileUtil();
        JsonResult jsonResult = util.saveFile(request, idPhotos, "/file/" + path + "/", createThumbnail, thumbnailWidth, thumbnailHeight);
        if (jsonResult.isSuccess()) {
            res.markSuccess(jsonResult.getData().toString());
        } else {
            res.markError(jsonResult.getMessage());
        }
        return res;
    }


}
