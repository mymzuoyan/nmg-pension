package com.fedtech.pension.controller.admin.dictionary;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 数据字典管理
 *
 * @author gengqiang
 * @date 2017/9/8
 */
@Controller
@RequestMapping("/admin/dictionary/")
public class DictionaryController extends BaseController {

    /**
     * 服务类型管理
     *
     * @return
     */
    @RequestMapping("serviceType/list")
    public String showServiceType() {
        return ADMIN_DICTIONARY_PREFIX + "service_type_list";
    }

    /**
     * 服务项目审批
     *
     * @return
     */
    @RequestMapping("serviceProject/approval")
    public String showServiceApproval() {
        return ADMIN_DICTIONARY_PREFIX + "service_approval_list";
    }

    /**
     * 服务项目管理
     *
     * @return
     */
    @RequestMapping("serviceProject/list")
    public String showServiceProject() {
        return ADMIN_DICTIONARY_PREFIX + "service_project_list";
    }

    /**
     * 服务项目审核
     *
     * @return
     */
    @RequestMapping("serviceProject/audit/list")
    public String showServiceProjectAuditList() {
        return ADMIN_DICTIONARY_PREFIX + "service_project_audit_list";
    }


    /**
     * 考核项目管理
     *
     * @return
     */
    @RequestMapping("assessProject/list")
    public String showAssessProject() {
        return ADMIN_DICTIONARY_PREFIX + "assess_project_statistic_list";
    }
}
