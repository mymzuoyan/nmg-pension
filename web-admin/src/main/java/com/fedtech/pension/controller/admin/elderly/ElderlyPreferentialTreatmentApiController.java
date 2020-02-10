package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyPreferentialTreatment;
import com.fedtech.pension.elderly.service.ElderlyPreferentialTreatmentService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author gengqiang
 * @date 2017/10/20
 */
@RestController
@RequestMapping("/admin/api/elderly/preferentialTreatment/")
public class ElderlyPreferentialTreatmentApiController extends BaseController {
    @Reference(version = "1.0.0")
    private ElderlyPreferentialTreatmentService elderlyPreferentialTreatmentService;


    /**
     * 列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    public PageResponse<ElderlyPreferentialTreatment> list(ElderlyPreferentialTreatment filter, PageRequest pageRequest) {
        return elderlyPreferentialTreatmentService.selectPageList(filter, pageRequest);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public JsonResult delete(Integer id) {
        JsonResult result = new JsonResult();
        if (elderlyPreferentialTreatmentService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 更新
     *
     * @param subsidy
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public JsonResult update(ElderlyPreferentialTreatment subsidy) {
        JsonResult result = new JsonResult();
        if (elderlyPreferentialTreatmentService.updateByPrimaryKeySelective(subsidy)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 添加
     *
     * @param treatment
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public JsonResult add(ElderlyPreferentialTreatment treatment) {
        JsonResult result = new JsonResult();
        treatment.setStatus(1);
        Integer count = elderlyPreferentialTreatmentService.count(treatment);
        if (ObjectUtils.isNull(count)) {
            treatment.setNumber(elderlyPreferentialTreatmentService.createApplyNewNumber(currentUser().getAreaId()));
            treatment.setAreaId(currentUser().getAreaId());
            treatment.setCreateTime(new Date());
            treatment.setCreatorId(currentUser().getUid());
            treatment.setStatus(0);
            if (elderlyPreferentialTreatmentService.insert(treatment)) {
                result.markSuccess("添加成功", null);
            } else {
                result.markError("添加失败");
            }
        } else {
            result.markError("老人已存在");

        }
        return result;
    }

}
