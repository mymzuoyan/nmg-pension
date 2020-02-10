package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;

import java.util.List;
import java.util.Map;

/**
 * Created by miaoyueming on 2019/8/16.
 */

public interface StarRatingOfInstitutionsService extends BaseService<StarRatingOfInstitutions> {

    StarRatingOfInstitutions selectById(Integer id);

    Integer selectTotalScoreByServiceOrgId(Integer serviceOrgId);

    StarRatingOfInstitutions selectByTypeAndSod(Integer serviceOrgId);

    StarRatingOfInstitutions selectBySodAndType(Integer serviceOrgId);

    StarRatingOfInstitutions selectByServiceOrgId(Integer serviceOrgId);

    Integer updateListDetail(Integer serviceOrgId);

    Boolean updateStarRate(StarRatingOfInstitutions starRatingOfInstitutions);

    /**
     * 机构星级数量统计
     *
     * @return
     */
    Map<String, List<Integer>> getInstitutionStarClass();
}
