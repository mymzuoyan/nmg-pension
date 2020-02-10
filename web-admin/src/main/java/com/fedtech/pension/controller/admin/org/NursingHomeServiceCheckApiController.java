package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.NursingHomeServiceCheck;
import com.fedtech.pension.org.service.NursingHomeServiceCheckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author zhangcz
 */
@Controller
@RequestMapping("/admin/api/")
public class NursingHomeServiceCheckApiController  extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(NursingHomeServiceCheckApiController.class);

    public String SAVEURL_serviceOrg_check = "/file/img/serviceOrg/check/";

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private NursingHomeServiceCheckService checkService;

    /**
     * 添加检查项目信息
     * @param record
     * @return
     */
    @RequestMapping("serviceCheck/add")
    @ResponseBody
    public JsonResult addServiceCheck(NursingHomeServiceCheck record) throws ParseException {
        JsonResult result = new JsonResult();
        if(checkService.insert(record)){
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    @RequestMapping("serviceCheck/importFileUrl")
    @ResponseBody
    public JsonResult importLogoUrl(HttpServletRequest request, MultipartFile file) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult fileResult = new JsonResult();
        fileResult = util.saveFile(request, file, SAVEURL_serviceOrg_check, false);
        if (fileResult.isSuccess()) {
            result.markSuccess("上传成功！", fileResult.getData().toString());
        } else {
            result.markError("上传失败！");
        }
        return result;
    }

    /**
     * 更新检查项目信息
     *
     * @param record
     * @return
     */
    @RequestMapping("serviceCheck/edit")
    @ResponseBody
    @SystemControllerLog(description = "更新检查项目信息")
    public JsonResult doUpdateServiceCheck(NursingHomeServiceCheck record) throws ParseException {
        JsonResult result = new JsonResult();
        if (checkService.updateByPrimaryKeySelective(record)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 获得检查项目详情
     * @param filter
     * @return
     */
    @RequestMapping("serviceCheck/detail")
    @ResponseBody
    public NursingHomeServiceCheck getServiceCheck(NursingHomeServiceCheck filter){
        return checkService.getRecodeDetail(filter);
    }
}
