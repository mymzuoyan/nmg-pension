package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyAssessment;
import com.fedtech.pension.elderly.mapper.ElderlyAssessmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * 老人基础评估信息
 */
@org.springframework.stereotype.Service
@Service(version = "1.0.0", interfaceClass = ElderlyAssessmentService.class,timeout = 5000, retries = 0)
public class ElderlyAssessmentServiceImpl extends BaseServiceImpl<ElderlyAssessment> implements ElderlyAssessmentService {

    @Autowired
    private ElderlyAssessmentMapper elderlyAssessmentMapper;

    @Override
    public BaseMapper<ElderlyAssessment> getMapper() {
        return elderlyAssessmentMapper;
    }

    /**
     * 老人评估信息保存
     *
     * @param elderlyAssessment
     * @return
     */
    @Override
    @Transactional
    public boolean insertAss(ElderlyAssessment elderlyAssessment) {
        if (null != elderlyAssessment) {
            if (selectByPrimaryKey(elderlyAssessment.getElderId()) != null) {
                if (elderlyAssessmentMapper.updateByElderId(elderlyAssessment.getElderId()) >= 1) {
                    return 1 == getMapper().insert(elderlyAssessment);
                }
            } else {
                return 1 == getMapper().insert(elderlyAssessment);
            }
        }
        return false;
    }

    /**
     * 加载评估全部信息
     *
     * @param id
     * @return
     */
    @Override
    public ElderlyAssessment selectByPrimaryKeyAll(Integer id) {
        if (null != id) {
            return elderlyAssessmentMapper.selectByPrimaryKeyAll(id);
        }
        return null;
    }

    @Override
    public JSONObject getAssessInfoFromPGSystem(String idcardno) {
        try
        {
            //获取token
            /*String param = "username=ytapi&password=ytapi@2017pwd";*/
            String param = "username=ytapi&password=123456";
            String objectStr = HttpRequest.sendPost("http://yttaizhou.njapld.com/webapi/Oldmanability/getAbilityInfo", param);
            if (ObjectUtils.isNotNull(objectStr)) {
                JSONObject jo = JSONObject.parseObject(objectStr);
                String token = jo.getJSONObject("msg").getString("token");
                if (ObjectUtils.isNotNull(token)) {
                    //获取
                    param = "id_card=" + idcardno + "&token=" + token;
                    String result = HttpRequest.sendPost("http://yttaizhou.njapld.com/webapi/Oldmanability/getAbilityInfo", param);
                    if (ObjectUtils.isNotNull(result))
                        return JSONObject.parseObject(result);
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public JSONObject getPhotoFromPGSystem(String idcardno) {
        try
        {
            //获取token
            /*String param = "username=ytapi&password=ytapi@2017pwd";*/
            String param = "username=ytapi&password=123456";
            String objectStr = HttpRequest.sendPost("http://yttaizhou.njapld.com/webapi/Getfiles/getFilesInfo", param);
            if (ObjectUtils.isNotNull(objectStr)) {
                JSONObject jo = JSONObject.parseObject(objectStr);
                String token = jo.getJSONObject("msg").getString("token");
                if (ObjectUtils.isNotNull(token)) {
                    //获取
                    param = "id_card=" + idcardno + "&token=" + token;
                    String result = HttpRequest.sendPost("http://yttaizhou.njapld.com/webapi/Oldmanability/getAbilityInfo", param);
                    JSONObject info = JSONObject.parseObject(result);

                    String photo = info.getJSONObject("msg").getString("id");

                    //获取
                    param = "file_ids=" + photo + "&token=" + token;
                    String resultPhoto = HttpRequest.sendPost("http://yttaizhou.njapld.com/webapi/Getfiles/getFilesInfo", param);
                    if (ObjectUtils.isNotNull(resultPhoto)){
                        return JSONObject.parseObject(resultPhoto);
                    }

                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
}
