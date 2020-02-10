package com.fedtech.pension.controller.admin.nurse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.nurse.entity.NurseElderlyLocation;
import com.fedtech.pension.nurse.service.NurseElderlyLocationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gengqiang
 * @date 2017/8/24
 */
@Controller
@RequestMapping("/admin/api/nurse/location/")
public class NurseElderlyLocationApiController extends BaseController {

    @Reference(version = "1.0.0")
    private NurseElderlyLocationService elderlyLocationService;

    /**
     * 获取列表
     *
     * @param filter
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public List<NurseElderlyLocation> getList(NurseElderlyLocation filter) {
        List<NurseElderlyLocation> nurseElderlyLocations = elderlyLocationService.getAllRecode(new NurseElderlyLocation());
        return nurseElderlyLocations;
    }

}
