package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.EntrySubsidy;
import com.fedtech.pension.org.service.EntrySubsidyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DMJ
 * @date 2019/4/1
 */
@Controller
@RequestMapping("/admin/entrySubsidy/")
public class EntrySubsidyController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    @Reference(version = "1.0.0")
    private EntrySubsidyService entrySubsidyService;
    /**
     * 跳转申请页面
     * @return
     */
    @RequestMapping("apply")
    public String showApply(){
        return ADMIN_PREFIX+"entry_subsidy";
    }
    /**
     * 跳转入职申请列表
     * @return
     */
    @RequestMapping("list")
    public String showList(Model model){
        if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue())) {
            model.addAttribute("flag",0);
        }
        return ADMIN_PREFIX+"entry_subsidy_list";
    }
    /**
     * 跳转审核页面
     * @return
     */
    @RequestMapping("verity/{id}")
    public String applyVerity(@PathVariable("id") Integer id, Model model){
        EntrySubsidy entrySubsidy = entrySubsidyService.selectByPrimaryKey(id);
        imageList(entrySubsidy.getCnsAttach(),model,"cnsAttach");
        imageList(entrySubsidy.getGwzmAttach(),model,"gwzmAttach");
        imageList(entrySubsidy.getLdhtAttach(),model,"ldhtAttach");
        imageList(entrySubsidy.getSbAttach(),model,"sbAttach");
        imageList(entrySubsidy.getSqbAttach(),model,"sqbAttach");
        imageList(entrySubsidy.getXlAttach(),model,"xlAttach");
        imageList(entrySubsidy.getZgzsAttach(),model,"zgzsAttach");
        model.addAttribute("entrySubsidy",entrySubsidy);
        return ADMIN_PREFIX+"entry_subsidy_verity";
    }

    /**
     * 上传组织信息原图与缩略图遍历
     *
     * @param imageUrls
     * @param model
     * @param imageName
     */
    public void imageList(String imageUrls, Model model, String imageName) {
        List<String> imageList = new ArrayList<String>();
        List<String> thumbnailsList = new ArrayList<String>();
        String[] imageUrl = imageUrls.split(",");
        if (!StringUtils.isEmpty(imageUrls)) {
            for (int i = 0; i < imageUrl.length; i++) {
                if (imageUrl[i] != null && imageUrl[i] != "") {
                    imageList.add(imageUrl[i]);
                    //生成缩略图
                    String str = imageUrl[i].substring(0,imageUrl[i].lastIndexOf(".")) + "_80_80" + imageUrl[i].substring(imageUrl[i].lastIndexOf("."));
                    thumbnailsList.add(str);
                }
            }
        }
        model.addAttribute(imageName + "s", imageList);
        model.addAttribute(imageName + "thumbnails", thumbnailsList);

    }
}
