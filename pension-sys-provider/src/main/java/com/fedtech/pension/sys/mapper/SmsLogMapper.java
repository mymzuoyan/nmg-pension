package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.SmsLog;
import com.fedtech.pension.sys.vo.SmsLogVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * @author CoderQiang
 * @date 2017/3/23
 */
public interface SmsLogMapper extends BaseMapper<SmsLog> {

    /**
     * 统计筛选后的数据
     *
     * @param filter
     * @return
     */
    int countByDay(@Param("filter") SmsLog filter);

    /**
     * 获取电话号码最新的记录
     * @param phone
     * @return
     */
    SmsLog selectLastLog(@Param("phone") String phone);


    /**
     * 批量添加
     * @param smsLogs
     * @return
     */
    int insertSomeRecode(@Param("smsLogs") List<SmsLog> smsLogs);


    List<SmsLogVo> selectElderLySmsPageList(@Param("filter") SmsLogVo t, @Param("page") PageRequest pageRequest);


    /**
     * 统计筛选后的数据
     *
     * @param filter
     * @return
     */
    int countElderLySms(SmsLogVo filter);
}
