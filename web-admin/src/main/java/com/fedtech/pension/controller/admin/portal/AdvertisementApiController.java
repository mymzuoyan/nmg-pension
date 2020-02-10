package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Advertisement;
import com.fedtech.pension.portal.service.AdvertisementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;

/**
 * @author Administrator
 * @date 2016/12/15
 */
@Controller
@RequestMapping("/admin/api/advertisement/")
public class AdvertisementApiController extends BaseController {

    @Reference(version = "1.0.0",cache = "lru")
    private AdvertisementService advertisementService;

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


    /**
     * 广告列表
     *
     * @param advertisement
     * @param pageRequest
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    @SystemControllerLog(description = "查看广告列表")
    public PageResponse<Advertisement> moduleMesList(Advertisement advertisement, PageRequest pageRequest) {
        PageResponse<Advertisement> dataTable = advertisementService.selectPageList(advertisement, pageRequest);
        return dataTable;
    }

    /**
     * 发广告
     *
     * @param advertisement
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @SystemControllerLog(description = "发布广告")
    public JsonResult send(Advertisement advertisement, String start, String end) {
        JsonResult jsonResult = new JsonResult();
        try {
            advertisement.setStartTime(df.parse(start));
            advertisement.setEndTime(df.parse(end));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (advertisementService.insert(advertisement)) {
            jsonResult.markSuccess("发布成功", null);
        } else {
            jsonResult.markError("发布失败");
        }
        return jsonResult;
    }


    /**
     * 删除广告
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除广告")
    public JsonResult deleteModulesMes(Integer id) {
        JsonResult result = new JsonResult();
        if (advertisementService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


    /**
     * 更新广告
     *
     * @param advertisement
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    @SystemControllerLog(description = "更新广告")
    public JsonResult updateModulesMes(Advertisement advertisement) {
        JsonResult result = new JsonResult();
        if (advertisementService.updateByPrimaryKeySelective(advertisement)) {
            result.markSuccess("更新广告", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


}
