package com.fedtech.pension.controller.admin.elderly;

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
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.entity.ElderlyPoorApply;
import com.fedtech.pension.elderly.entity.ElderlyPoorVerification;
import com.fedtech.pension.elderly.quantity.PoorApplyStepQuantity;
import com.fedtech.pension.elderly.service.ElderlyPoorApplyService;
import com.fedtech.pension.elderly.service.ElderlyPoorVerificationService;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by gengqiang on 2017/8/16.
 */
@Controller
@RequestMapping("/admin/api/elderly/poor/")
public class ElderlyPoorApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyPoorApplyService elderlyPoorApplyService;

    @Reference(version = "1.0.0")
    private ElderlyPoorVerificationService elderlyPoorVerificationService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    @Value("${server.host}")
    private String HOST;

    /**
     * 城乡特困人员申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "apply/add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "城乡特困人员申请")
    public JsonResult addElderPoorApply(ElderlyPoorApply apply) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(apply.getIdcardno())) {
            result.markError("身份证号码不能为空");
            return result;
        }
        apply.setCreatorId(currentUser().getUid());
        apply.setCreateTime(new Date());
        apply.setResult(0);
        if (ObjectUtils.isNull(apply.getNumber())) {
            apply.setNumber(elderlyPoorApplyService.createApplyNewNumber(apply.getAreaId()));
        }
        if (elderlyPoorApplyService.insertPoorApply(apply, currentUser())) {
            result.markSuccess("城乡特困人员申请成功", null);
        } else {
            result.markError("城乡特困人员申请失败");
        }
        return result;
    }


    /**
     * 城乡特困人员申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "apply/update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "城乡特困人员申请")
    public JsonResult updateElderPoorApply(ElderlyPoorApply apply) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(apply.getIdcardno())) {
            result.markError("身份证号码不能为空");
            return result;
        }
        if (elderlyPoorApplyService.updateByPrimaryKeySelective(apply)) {
            result.markSuccess("城乡特困人员更新成功", null);
        } else {
            result.markError("城乡特困人员更新失败");
        }
        return result;
    }

    /**
     * 城乡特困人员申请列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "apply/list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "城乡特困人员申请列表")
    public PageResponse<ElderlyPoorApply> showElderGovBuyApplyList(ElderlyPoorApply filter, PageRequest pageRequest) {
        Subject subject = getCurrentUser();
        Area a = (Area) redisAreaUtil.getArea(currentUser().getAreaId());
        if (subject.hasRole(RoleType.StAdmin.getValue())) {
            filter.setRegion2(a.getName());
        } else if (subject.hasRole(RoleType.ReAdmin.getValue())) {
            filter.setRegion1(a.getName());
        } else if (subject.hasRole(RoleType.CoAdmin.getValue())) {
            filter.setRegion3(a.getName());
        }
        return elderlyPoorApplyService.selectPageList(filter, pageRequest);
    }

    /**
     * 城乡特困人员待办列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "apply/handle/list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "城乡特困人员待办列表")
    public PageResponse<ElderlyPoorApply> showElderGovBuyHandleList(ElderlyPoorApply filter, PageRequest pageRequest) {
        Subject subject = getCurrentUser();
        Area a = (Area) redisAreaUtil.getArea(currentUser().getAreaId());
        if (subject.hasRole(RoleType.StAdmin.getValue())) {
            String selectStatus = StringUtils.join(PoorApplyStepQuantity.JDNEEDHANDLEAPPLYSTATUS, ",");
            filter.setSelectStatus(selectStatus);
            filter.setRegion2(a.getName());
        } else if (subject.hasRole(RoleType.ReAdmin.getValue())) {
            String selectStatus = StringUtils.join(PoorApplyStepQuantity.QUNEEDHANDLEAPPLYSTATUS, ",");
            filter.setSelectStatus(selectStatus);
            filter.setRegion1(a.getName());
        } else {
          /*  return null;*/
            return elderlyPoorApplyService.selectPageList(filter, pageRequest);
        }
        return elderlyPoorApplyService.selectPageList(filter, pageRequest);
    }

    /**
     * 处理城乡特困人员申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "apply/handlePoorApply", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "处理城乡特困人员申请")
    public JsonResult handlePoorApply(ElderlyPoorApply apply) {
        JsonResult result = new JsonResult();
        if (elderlyPoorApplyService.handlePoorApply(apply, currentUser())) {
            result.markSuccess("处理城乡特困人员申请成功", null);
        } else {
            result.markError("处理城乡特困人员申请失败");
        }
        return result;
    }

    /**
     * 上传
     *
     * @param request
     * @param files
     * @param path
     * @param createThumbnail
     * @param thumbnailWidth
     * @param thumbnailHeight
     * @return
     */
    @RequestMapping(value = "upload")
    @ResponseBody
    public UploadResult uploadFile(HttpServletRequest request, @RequestParam("files") MultipartFile files, @RequestParam("path") String path,
                                   @RequestParam(value = "createThumbnail", defaultValue = "false", required = false) boolean createThumbnail,
                                   @RequestParam(value = "thumbnailWidth", defaultValue = "200", required = false) Integer thumbnailWidth,
                                   @RequestParam(value = "thumbnailHeight", defaultValue = "300", required = false) Integer thumbnailHeight) {
        UploadResult res = new UploadResult();
        FileUtil util = new FileUtil();
        JsonResult jsonResult = util.saveFile(request, files, "/file/poor/apply/" + path + "/", createThumbnail, thumbnailWidth, thumbnailHeight);
        if (jsonResult.isSuccess()) {
            res.markSuccess(jsonResult.getData().toString());
        } else {
            res.markError(jsonResult.getMessage());
        }
        return res;
    }

    /**
     * 获取数据统计
     *
     * @param type
     * @param startYear
     * @param endYear
     * @return
     */
    @RequestMapping(value = "getStatistics")
    @ResponseBody
    public Map<String, List<Long>> getStatistics(@RequestParam("type") Integer type, @RequestParam(value = "areaId", required = false, defaultValue = "0") Integer areaId,
                                                 @RequestParam("startYear") Integer startYear,
                                                 @RequestParam("endYear") Integer endYear) {
        if (areaId == 0) {
            areaId = currentUser().getAreaId();
        }
        return elderlyPoorApplyService.getStatistics(type, areaId, startYear, endYear);
    }

    /**
     * 导出头像
     *
     * @param request
     * @param response
     * @param elderlyPoorApply
     */
    @RequestMapping(value = "downloadAvatar")
    @SystemControllerLog(description = "导出头像")
    public void download(HttpServletRequest request, HttpServletResponse response, ElderlyPoorApply elderlyPoorApply) {
        elderlyPoorApply.setResult(1);
        elderlyPoorApplyService.download(request, response, elderlyPoorApply, HOST);
    }

    /**
     * 导出特困人员信息
     *
     * @param request
     * @param response
     * @param elderlyPoorApply
     * @throws Exception
     */
    @RequestMapping(value = "export")
    @SystemControllerLog(description = "导出特困人员信息列表")
    public void export(HttpServletRequest request,
                       HttpServletResponse response, ElderlyPoorApply elderlyPoorApply) throws Exception {
        elderlyPoorApply.setResult(1);
        elderlyPoorApplyService.export(request, response, elderlyPoorApply);
    }


    /**
     * 获取年审列表
     */
    @RequestMapping(value = "verification/list")
    @ResponseBody
    @SystemControllerLog(description = " 获取年审列表")
    public PageResponse<ElderlyPoorVerification> verificationList(ElderlyPoorVerification filter, PageRequest pageRequest) {
        return elderlyPoorVerificationService.selectPageList(filter, pageRequest);
    }

    /**
     * 年审
     *
     * @param verification
     * @return
     */
    @RequestMapping(value = "verification")
    @ResponseBody
    public JsonResult verificationApply(ElderlyPoorVerification verification) {
        JsonResult result = new JsonResult();
        verification.setCreatorId(currentUser().getUid());
        verification.setCreator(currentUser().getNick_name());
        verification.setCreateTime(new Date());
        if (elderlyPoorVerificationService.updateByPrimaryKeySelective(verification)) {
            result.markSuccess("年审通过", null);
        } else {
            result.markError("年审不通过");
        }
        return result;
    }

    /**
     * 审核
     *
     * @param elderlyPoorApply
     * @return
     */
    @RequestMapping(value = "verify", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "特困人员审批")
    public JsonResult deleteElderlyPoorApply(ElderlyPoorApply elderlyPoorApply) {
        JsonResult result = new JsonResult();
        if (elderlyPoorApplyService.updateByPrimaryKeySelective(elderlyPoorApply)) {
            result.markSuccess("审核成功", null);
        } else {
            result.markError("审核失败");
        }
        return result;
    }
}
