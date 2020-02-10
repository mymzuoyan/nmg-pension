package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;

import java.util.List;
import java.util.Map;

/**
 *
 * @author miaoyueming
 * @date 2019/8/16
 */

public interface StarRatingOfInstitutionsMapper extends BaseMapper<StarRatingOfInstitutions> {

    StarRatingOfInstitutions selectById(Integer id);

    Integer selectTotalScoreByServiceOrgId(Integer serviceOrgId);

    StarRatingOfInstitutions selectByTypeAndSod(Integer serviceOrgId);

    StarRatingOfInstitutions selectBySodAndType(Integer serviceOrgId);

    Integer updateListDetail(Integer serviceOrgId);

    Boolean updateStarRate(StarRatingOfInstitutions starRatingOfInstitutions);

    StarRatingOfInstitutions selectByServiceOrgId(Integer serviceOrgId);

    /**
     * 机构星级数量统计
     *
     * @return
     */
    Map<String, List<Integer>> getInstitutionStarClass();

    Integer InstitutionCount();
}
