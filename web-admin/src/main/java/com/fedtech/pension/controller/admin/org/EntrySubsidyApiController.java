package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.EntrySubsidy;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgRecord;
import com.fedtech.pension.org.service.EntrySubsidyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @author DMJ
 * @date 2019/4/1
 */
@Controller
@RequestMapping("/admin/api/entrySubsidy/")
public class EntrySubsidyApiController extends BaseController {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private EntrySubsidyService entrySubsidyService;



    /**
     * 入职补贴申请
     * @param entrySubsidy
     * @return
     */
    @RequestMapping("apply")
    @ResponseBody
    public JsonResult applySubsidy(EntrySubsidy entrySubsidy) {
        JsonResult result = new JsonResult();
        entrySubsidy.setApplyTime(new Date());
        if(entrySubsidyService.insert(entrySubsidy)){
            result.markSuccess("申请成功", null);
        }else {
            result.markError("申请失败");
        }
        return result;
    }

    /**
     *
     *入住补贴申请查询
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<EntrySubsidy> getList(EntrySubsidy filter, PageRequest pageRequest)throws Exception {
        return entrySubsidyService.selectPageList(filter, pageRequest);
    }

    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeMsg")
    @ResponseBody
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> list = new ArrayList<>();
        if(ObjectUtils.isNotNull(deleteIds)){
            String[] arrs = deleteIds.split(",");
            for(String item : arrs){
                list.add(Integer.parseInt(item));
            }
        }
        if(entrySubsidyService.deleteSomeMsg(list)){
            result.markSuccess("删除成功", null);
        }else {
            result.markError("删除失败");
        }
        return result;
    }
    /**
     * 入职补贴申请审核
     * @param entrySubsidy
     * @return
     */
    @RequestMapping("verity")
    @ResponseBody
    public JsonResult veritySubsidy(EntrySubsidy entrySubsidy) {
        JsonResult result = new JsonResult();
        if(entrySubsidyService.updateByPrimaryKeySelective(entrySubsidy)){
            result.markSuccess("审核成功", null);
        }else {
            result.markError("审核失败");
        }
        return result;
    }

}
