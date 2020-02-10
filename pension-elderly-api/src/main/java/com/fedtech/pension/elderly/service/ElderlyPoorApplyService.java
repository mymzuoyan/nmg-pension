package com.fedtech.pension.elderly.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyPoorApply;
import com.fedtech.pension.sys.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by gengqiang on 2017/8/16.
 */
public interface ElderlyPoorApplyService extends BaseService<ElderlyPoorApply> {


    /**
     * 登记城乡特困人员审批
     *
     * @param apply
     * @return
     */
    boolean insertPoorApply(ElderlyPoorApply apply, User handleUser);


    /**
     * 获取特定的区域的最新的编码
     *
     * @param number
     * @return
     */
    String findByLastNumber(String number);


    /**
     * 生成申请编码的前置部分
     *
     * @param areaId
     * @return
     */
    String createApplyPreNumber(Integer areaId);


    /**
     * 处理城乡特困人员审批
     *
     * @param apply
     * @return
     */
    boolean handlePoorApply(ElderlyPoorApply apply, User handleUser);


    /**
     * @param areaId
     * @return
     */
    String createApplyNewNumber(Integer areaId);

    /**
     * 数据统计
     *
     * @param type
     * @return
     */
    Map<String, List<Long>> getStatistics(Integer type, Integer areaId, Integer startYear, Integer endYear);


    /**
     * 下载头像
     *
     * @param request
     * @param response
     * @param elderlyPoorApply
     */
    void download(HttpServletRequest request, HttpServletResponse response, ElderlyPoorApply elderlyPoorApply, String host);

    /**
     * 导出
     *
     * @param request
     * @param response
     * @param elderlyPoorApply
     */
    void export(HttpServletRequest request, HttpServletResponse response, ElderlyPoorApply elderlyPoorApply) throws Exception;


    /**
     * 获取需要年审的id
     *
     * @return
     */
    List<Integer> getNeedVerification();

}
