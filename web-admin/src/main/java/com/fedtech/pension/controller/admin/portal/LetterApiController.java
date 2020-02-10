package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Letter;
import com.fedtech.pension.portal.service.LetterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author gengqiang
 */
@Controller
@RequestMapping("/admin/api/letter/")
public class LetterApiController extends BaseController {

    @Reference(version = "1.0.0",cache = "lru")
    private LetterService letterService;

    @RequestMapping("list")
    @ResponseBody
    @SystemControllerLog(description = "查看信件列表")
    public PageResponse<Letter> getLetterList(PageRequest pageRequest, Letter letter) {
        PageResponse<Letter> dataTable = letterService.selectPageList(letter, pageRequest);
        return dataTable;
    }

    @RequestMapping("delete")
    @ResponseBody
    @SystemControllerLog(description = "删除信件")
    public AppResult deleteLetter(Integer id) {
        AppResult result = new AppResult();
        if (letterService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }
}
