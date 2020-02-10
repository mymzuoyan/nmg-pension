package com.fedtech.pension.org.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.mapper.StarRatingOfInstitutionsMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * @author miaoyueming
 * @date 2019/8/16
 */
@Service(interfaceClass = StarRatingOfInstitutionsService.class, version = "1.0.0")
public class StarRatingOfInstitutionsImpl extends BaseServiceImpl<StarRatingOfInstitutions> implements StarRatingOfInstitutionsService{

    @Autowired
    private StarRatingOfInstitutionsMapper starRatingOfInstitutionsMapper;

    @Override
    public BaseMapper<StarRatingOfInstitutions> getMapper() {
        return starRatingOfInstitutionsMapper;
    }

    @Override
    public StarRatingOfInstitutions selectById(Integer id) {
        return starRatingOfInstitutionsMapper.selectById(id);
    }

    @Override
    public Integer selectTotalScoreByServiceOrgId(Integer serviceOrgId) {
        return starRatingOfInstitutionsMapper.selectTotalScoreByServiceOrgId(serviceOrgId);
    }

    @Override
    public StarRatingOfInstitutions selectByTypeAndSod(Integer serviceOrgId) {
        return starRatingOfInstitutionsMapper.selectByTypeAndSod(serviceOrgId);
    }

    @Override
    public StarRatingOfInstitutions selectBySodAndType(Integer serviceOrgId) {
        return starRatingOfInstitutionsMapper.selectBySodAndType(serviceOrgId);
    }

    @Override
    public StarRatingOfInstitutions selectByServiceOrgId(Integer serviceOrgId) {
        return starRatingOfInstitutionsMapper.selectByServiceOrgId(serviceOrgId);
    }

    @Override
    public Integer updateListDetail(Integer serviceOrgId) {
        return starRatingOfInstitutionsMapper.updateListDetail(serviceOrgId);
    }

    @Override
    public Boolean updateStarRate(StarRatingOfInstitutions starRatingOfInstitutions) {
        return starRatingOfInstitutionsMapper.updateStarRate(starRatingOfInstitutions);
    }

    @Override
    public Map<String, List<Integer>> getInstitutionStarClass() {
        Map<String, List<Integer>> result = new LinkedHashMap<>();
        List<StarRatingOfInstitutions> allService = this.getAllRecode(null);

        /**
         * 各星级型统计情况
         */
        Integer[] count = {0, 0, 0, 0, 0, 0};
        String[] strs = {"1", "2", "3", "4", "5"};
        for (StarRatingOfInstitutions s : allService) {
            String starClass = s.getStarClass() + "";
            if (ObjectUtils.isNotNull(starClass)) {
                for (int i = 0; i < strs.length; i++) {
                    if (starClass.contains(strs[i])) {
                        count[i + 1]++;
                        break;
                    }
                }
            }
        }

        result.put("各机构星级数量统计情况", Arrays.asList(count));
        return result;
    }
}
