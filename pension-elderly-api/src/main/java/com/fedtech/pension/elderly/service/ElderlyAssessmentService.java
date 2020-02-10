package com.fedtech.pension.elderly.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyAssessment;

/**
 * Created by DELL on 2016/9/29.
 */
public interface ElderlyAssessmentService extends BaseService<ElderlyAssessment> {

    /**
     * 老人评估信息保存
     *
     * @param elderlyAssessment
     * @return
     */
    boolean insertAss(ElderlyAssessment elderlyAssessment);

    /**
     * @param id
     * @return
     */
    ElderlyAssessment selectByPrimaryKeyAll(Integer id);


    /**
     * 从评估系统获取信息
     *
     * @param idcardno
     * @return
     */

    JSONObject getAssessInfoFromPGSystem(String idcardno);

    /**
     * 从评估系统获取照片信息
     *
     * @param idcardno
     * @return
     */
    JSONObject getPhotoFromPGSystem(String idcardno);

}
