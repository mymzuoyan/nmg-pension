package com.fedtech.pension.controller.admin.call;

import com.fedtech.pension.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author CoderQiang
 * @date 2017/2/9
 */
@Controller
@RequestMapping("/admin/call/visit/")
public class ReturnVisitController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(ReturnVisitController.class);

    /**
     * 回访列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showVisitLIst() {
        return ADMIN_CALL_PREFIX + "return_visit_list";
    }


}
