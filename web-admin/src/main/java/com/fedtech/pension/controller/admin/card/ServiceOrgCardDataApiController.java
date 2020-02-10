package com.fedtech.pension.controller.admin.card;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgCardData;
import com.fedtech.pension.org.service.ServiceOrgCardDataService;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author gengqiang
 * @date 2018/4/25
 */
@Controller
@RequestMapping("/admin/api/org/card")
@EnableScheduling
public class ServiceOrgCardDataApiController extends BaseController {

    @Reference(version = "1.0.0", timeout = 60000, retries = 0)
    private ServiceOrgCardDataService serviceOrgCardDataService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    /**
     * 列表数据
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<ServiceOrgCardData> list(ServiceOrgCardData filter, PageRequest pageRequest) {
        //限制区域
        return serviceOrgCardDataService.selectPageList(filter, pageRequest);
    }
}
