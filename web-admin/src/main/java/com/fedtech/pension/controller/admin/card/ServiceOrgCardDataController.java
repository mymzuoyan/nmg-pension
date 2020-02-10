package com.fedtech.pension.controller.admin.card;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2018/4/25
 */
@Controller
@RequestMapping("/admin/org/card/")
public class ServiceOrgCardDataController extends BaseController {

    /**
     * 显示办事数据
     *
     * @return
     */
    @RequestMapping("list")
    public String showDataList() {

        return ADMIN_CARD_PREFIX + "card_data_list";
    }

}
