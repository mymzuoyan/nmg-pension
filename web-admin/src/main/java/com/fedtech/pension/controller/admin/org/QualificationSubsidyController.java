package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.QualificationSubsidy;
import com.fedtech.pension.org.service.QualificationSubsidyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DMJ
 * @date 2019/4/2
 */
@Controller
@RequestMapping("/admin/qualSubsidy/")
public class QualificationSubsidyController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    @Reference(version = "1.0.0")
    private QualificationSubsidyService qualificationSubsidyService;
    /**
     * 跳转申请页面
     * @return
     */
    @RequestMapping("apply")
    public String showApply(){
        return ADMIN_PREFIX+"qual_subsidy";
    }
    /**
     * 跳转资格补贴申请列表
     * @return
     */
    @RequestMapping("list")
    public String showList(Model model){
        if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue())) {
            model.addAttribute("flag",0);
        }
        return ADMIN_PREFIX+"qual_subsidy_list";
    }

    /**
     * 跳转审核页面
     * @return
     */
    @RequestMapping("verity/{id}")
    public String applyVerity(@PathVariable("id") Integer id, Model model){
        QualificationSubsidy qualificationSubsidy = qualificationSubsidyService.selectByPrimaryKey(id);
        imageList(qualificationSubsidy.getQualificationAttach(),model,"qualificationAttach");
        imageList(qualificationSubsidy.getHealthAttach(),model,"healthAttach");
        imageList(qualificationSubsidy.getIdcardAttach(),model,"idcardAttach");
        imageList(qualificationSubsidy.getApplyAttach(),model,"applyAttach");
        imageList(qualificationSubsidy.getLiveAttach(),model,"liveAttach");
        imageList(qualificationSubsidy.getSbAttach(),model,"sbAttach");
        model.addAttribute("qualificationSubsidy",qualificationSubsidy);
        return ADMIN_PREFIX+"qual_subsidy_verity";
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
    /**
     * 跳转统计页面
     * @return
     */
    @RequestMapping("statistics")
    public String showStatistics(){
        return ADMIN_PREFIX+"qual_subsidy_statistics";
    }

    /**
     * 跳转统计页面1
     * @return
     */
    @RequestMapping("showData/{areaId}")
    public String showData(@PathVariable("areaId") Integer areaId,Model model ){
        model.addAttribute("value",areaId);
        return ADMIN_PREFIX+"qual_subsidy_statistics";
    }
}
