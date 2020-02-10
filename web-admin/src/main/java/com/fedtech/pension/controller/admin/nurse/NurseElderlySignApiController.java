package com.fedtech.pension.controller.admin.nurse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.nurse.entity.NurseElderlySign;
import com.fedtech.pension.nurse.service.NurseElderlySignService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author gengqiang
 * @date 2017/8/24
 */
@Controller
@RequestMapping("/admin/api/nurse/elderly/sign/")
public class NurseElderlySignApiController {

    @Reference(version = "1.0.0")
    private NurseElderlySignService nurseElderlySignService;

    @RequestMapping("list")
    @ResponseBody
    public PageResponse<NurseElderlySign> list(NurseElderlySign filter, PageRequest pageRequest) {
        return nurseElderlySignService.selectPageList(filter, pageRequest);
    }
}
