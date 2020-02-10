package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Letter;
import com.fedtech.pension.portal.service.LetterService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 */
@Controller
@RequestMapping("/admin/letter/")
public class LetterController extends BaseController {

    @Reference(version = "1.0.0", cache = "lru")
    private LetterService letterService;

    public final String ADMIN_PREFIX = "/admin/portal/";


    @RequestMapping("show")
    public String showLetter() {
        return ADMIN_PREFIX + "letter_list";
    }

    @RequestMapping("info/{id}")
    public String letterInfo(@PathVariable("id") Integer id, Model model) {
        Letter letter = letterService.selectByPrimaryKey(id);
        model.addAttribute("letter", letter);
        return ADMIN_PREFIX + "letter_info";
    }
}
