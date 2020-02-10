package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Letter;
import com.fedtech.pension.portal.service.LetterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author gengqiang
 */
@Controller
@RequestMapping("/letter/api/")
public class AddLetterApiController extends BaseController {

    @Reference(version = "1.0.0")
    private LetterService letterService;

    @RequestMapping("add")
    @ResponseBody
    public AppResult addLetter(Letter letter) {
        AppResult result = new AppResult();
        letter.setCreateTime(new Date());
        if (letterService.insert(letter)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

}
