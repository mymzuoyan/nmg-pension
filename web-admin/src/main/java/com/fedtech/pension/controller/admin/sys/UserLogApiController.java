package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.service.UserLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author CoderQiang
 * @date 2017/1/17
 */
@Controller
@RequestMapping("/admin/api/sys")
public class UserLogApiController extends BaseController {
    protected Logger logger = LoggerFactory.getLogger(UserLogApiController.class);

    @Reference(version = "1.0.0")
    private UserLogService userLogService;

    /**
     * 列表
     *
     * @param userLog
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<UserLog> list(UserLog userLog, PageRequest pageRequest) {
        PageResponse<UserLog> dataTable = userLogService.selectPageList(userLog, pageRequest);
        return dataTable;
    }


}
