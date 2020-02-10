package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderAssessCheck;
import com.fedtech.pension.elderly.entity.ElderlyAssessment;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.entity.JiuYe;
import com.fedtech.pension.elderly.service.ElderAssessCheckService;
import com.fedtech.pension.elderly.service.ElderlyAssessmentService;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.elderly.service.JiuYeService;
import com.fedtech.pension.power.entity.ElderCapacity;
import com.fedtech.pension.power.service.ElderCapacityService;
import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static com.fedtech.web.utils.Servlets.getRequest;

/**
 * 老人基础信息
 *
 * @author gengqiang
 */
@Controller
@RequestMapping("/admin/elderly/")
public class ElderlyMsgController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;
    @Reference(version = "1.0.0")
    private ElderlyAssessmentService elderlyAssessmentService;
    @Reference(version = "1.0.0")
    private ElderAssessCheckService elderAssessCheckService;
    @Reference(version = "1.0.0")
    private JiuYeService jiuYeService;

    public final String ADMIN_PREFIX = "/admin/elderly/";

    @Reference(version = "1.0.0")
    public ElderCapacityService elderCapacityService;

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 显示老人基础信息
     *
     * @return
     */
    @RequestMapping("list")
    public String showElderInfo(@RequestParam(value = "areaName", required = false) String areaName, @RequestParam(value = "abilityAssess", required = false) String abilityAssess, Model model) {
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }
        if (ObjectUtils.isNotNull(abilityAssess)) {
            model.addAttribute("abilityAssess", abilityAssess);
        }
        return ADMIN_PREFIX + "elderlyMsg_list";
    }

    /**
     * 显示就业人员基础信息
     *
     * @return
     */
    @RequestMapping("jiuyelist")
    public String showJiuyeInfo(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }
        return ADMIN_PREFIX + "jiuye_list";
    }


    /**
     * 显示殉葬信息
     *
     * @return
     */
    @RequestMapping("deadInfo")
    public String showDeadInfo() {
        return ADMIN_PREFIX + "elderly_deadInfo";
    }

    /**
     * 显示能力评估信息
     *
     * @return
     */
    @RequestMapping("elder_assessInfo")
    public String showAssessInfo() {
        return ADMIN_PREFIX + "elderMsg_assessInfo";
    }

    /**
     * 老人的详细信息页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("update/{id}")
    public String showElder(@PathVariable("id") Integer id, Model model, @Parameter String method) {
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(id);
        Date deathTime = elderlyMsg.getDeathTime();
        if (deathTime != null) {
            model.addAttribute("deathTimeString", df.format(deathTime));
        }
        Date cremationTime = elderlyMsg.getCremationTime();
        if (cremationTime != null) {
            model.addAttribute("cremationTimeString", df.format(cremationTime));
        }
        model.addAttribute("elderlyMsg", elderlyMsg);
        model.addAttribute("method", method);
        return ADMIN_PREFIX + "elderlyMsg_details";
    }

    /**
     * 就业人员的详细信息页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("updateJiuYe/{id}")
    public String showJiuYe(@PathVariable("id") Integer id, Model model, @Parameter String method) {
        JiuYe jiuYe = jiuYeService.selectByPrimaryKey(id);
        model.addAttribute("jiuYe", jiuYe);
        model.addAttribute("method", method);
        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        return ADMIN_PREFIX + "jiuYe_details";
    }

    /**
     * 老人的新增信息页面
     *
     * @param model
     * @return
     */
    @RequestMapping("addElder")
    public String addElder(Model model, @Parameter String method) {
        model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        model.addAttribute("method", method);
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            return ADMIN_PREFIX + "elderMsg_add_zu";

        } else {
            return ADMIN_PREFIX + "elderlyMsg_add";

        }
    }

    /**
     * 就业人员的新增信息页面
     *
     * @param model
     * @return
     */
    @RequestMapping("addJiuYe")
    public String addJiuYe(Model model, @Parameter String method) {
        model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        model.addAttribute("method", method);
        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            return ADMIN_PREFIX + "elderMsg_add_zu";

        } else {
            return ADMIN_PREFIX + "jiuye_add";

        }
    }

    /**
     * 能力评估详细信息
     *
     * @param model
     * @return
     */
    @RequestMapping("assDetails/{id}")
    public String assDetails(@PathVariable("id") Integer id, Model model, @Parameter String method) throws Exception {
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(id);
        ElderlyAssessment elderlyAssessment = elderlyAssessmentService.selectByPrimaryKey(id);
        String tidCode = "TZ" + elderlyMsg.getDeptCode().substring(4) + new Random().nextInt(10000);
        model.addAttribute("tidCode", tidCode);
        model.addAttribute("elderlyMsg", elderlyMsg);
        model.addAttribute("elderlyAssessment", elderlyAssessment);
        model.addAttribute("method", method);
        return ADMIN_PREFIX + "elderMsg_assDetails";
    }

    /**
     * 老人评估列表页面
     *
     * @param id
     * @return
     */
    @RequestMapping("elder_getAssList")
    public String getAssList(@Parameter Integer id, Model model) {
        model.addAttribute("elderId", id);
        return ADMIN_PREFIX + "elderMsg_assList";
    }

    @RequestMapping("assessCheck/add")
    public String showAddAssessCheck(@Parameter Integer id, Model model) {
        model.addAttribute("elderId", id);
        return ADMIN_PREFIX + "elderMsg_assessCheck_add";
    }

    /**
     * 更新评估检查
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("assessCheck/update/{id}")
    public String showAssessCheckDetail(@PathVariable("id") Integer id, Model model) {
        ElderAssessCheck elderAssessCheck = elderAssessCheckService.selectByPrimaryKey(id);
        model.addAttribute(elderAssessCheck);
        return ADMIN_PREFIX + "elderMsg_assessCheck_detail";
    }


    /**
     * 显示数据统计的界面
     *
     * @return
     */
    @RequestMapping("elderly_statistics")
    public String showStatistics() {
        return ADMIN_PREFIX + "elderly_statistics";
    }

    /**
     * 获取新增和提档老人情况（79到80,89到90，99到100）
     *
     * @return
     */
    @RequestMapping("elderly_add_up_statistics")
    public String showAddAndUpStatistics(Model model) {
        //获取还有一个月到80岁的老人
        return ADMIN_PREFIX + "elderly_add_up_statistics";
    }


    /**
     * 获取新增和提档老人（79到80,89到90，99到100）
     *
     * @return
     */
    @RequestMapping("elderly_add_up_list")
    public String showAddAndUpElders(Model model, String areaName, Integer age) {
        model.addAttribute("areaName", areaName);
        model.addAttribute("age", age);
        //获取还有一个月到80岁的老人
        return ADMIN_PREFIX + "elderly_add_up_list";
    }


    /**
     * 审批新增和提档老人（79到80,89到90，99到100）
     *
     * @return
     */
    @RequestMapping("elderly_add_up_notify")
    public String notifyAddAndUpElders(Model model) {
        model.addAttribute("areaName", currentUser().getAreaName());
        model.addAttribute("age", 0);
        //获取还有一个月到80岁的老人
        return ADMIN_PREFIX + "elderly_add_up_notify";
    }

    /**
     * 显示老人评估信息
     *
     * @return
     */
    @RequestMapping("elder_assess_Info")
    public String showElderAssessInfo(@RequestParam(value = "idcardno", required = false) String idcardno, Model model) {
        if (ObjectUtils.isNotNull(idcardno)) {
            JSONObject jsonObject = elderlyAssessmentService.getAssessInfoFromPGSystem(idcardno);
            JSONObject jsonPhoto = elderlyAssessmentService.getPhotoFromPGSystem(idcardno);
            if (!"2001".equals(jsonObject.getString("code"))){
                model.addAttribute("assessInfo", jsonObject);
                model.addAttribute("photoInfo",jsonPhoto);
            }
            if ("2001".equals(jsonObject.getString("code"))) {
                ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
                JSONObject jo = new JSONObject();
                jo.put("code", 2001);
                jo.put("msg", elderlyMsg);
                model.addAttribute("assessInfo", jo);
            }
        }
        return ADMIN_PREFIX + "elderMsg_assess_details";
    }


    /**
     * 能力评估查看
     *
     * @return
     */
    @RequestMapping("catacityDetail")
    public String showCapacityDetail(@RequestParam(value = "idcardno", required = false) String idcardno,Model model){
        /*ElderCapacity elderCapacity =  elderCapacityService.selectByPrimaryKey(id);*/
        ElderCapacity elderCapacity =  elderCapacityService.findByIdcard(idcardno);
        if(elderCapacity!=null){
            if(elderCapacity.getPhotoFlag() == 2){
                if(elderCapacity.getOldmanPhoto() != null && !elderCapacity.getOldmanPhoto().equals("")){
                    imageList(elderCapacity.getOldmanPhoto(),model,"oldManPhoto");
                }
            }
            HttpServletRequest request = getRequest();
            String scheme = request.getScheme();
            String serverName = request.getServerName();
            String url = scheme+"://"+serverName+":"+"8088";
            model.addAttribute("url", url);
            model.addAttribute("m", elderCapacity);

        }


        return ADMIN_PREFIX + "capacityDetail";
    }


    /**
     * 老人照片缩略
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
                    //原图
                    String str = imageUrl[i].substring(0,imageUrl[i].lastIndexOf(".") - 6)+ imageUrl[i].substring(imageUrl[i].lastIndexOf("."));
                    thumbnailsList.add(str);
                }
            }
        }
        model.addAttribute(imageName + "s", imageList);
        model.addAttribute(imageName + "thumbnails", thumbnailsList);

    }


}
