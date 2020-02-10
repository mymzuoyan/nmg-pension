package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.CheckName;
import com.fedtech.pension.org.service.CheckNameService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;


/**
 * @author Administrator
 */
@Controller
@RequestMapping("/admin/api/CheckName/")
public class CheckNameApiController extends BaseController {


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private CheckNameService checkNameService;

    @RequestMapping("list")
    @ResponseBody
    public PageResponse<CheckName> list(CheckName filter, PageRequest pageRequest) {
        return checkNameService.selectPageList(filter, pageRequest);
    }

}
