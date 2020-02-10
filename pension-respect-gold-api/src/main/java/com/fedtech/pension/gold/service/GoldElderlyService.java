package com.fedtech.pension.gold.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.gold.entity.GoldElderly;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 *
 * @author csn
 * @date 2018/1/4
 */
public interface GoldElderlyService extends BaseService<GoldElderly>{

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    boolean deleteSome(List<Integer> ids);

    /**
     * 导入
     * @param file
     * @return
     * @throws IOException
     */
    JsonResult importExcel(MultipartFile file) throws IOException;

    /**
     * 获取老人信息
     *
     * @param cardNo
     * @return
     */
    GoldElderly selectByCardNoForGoldSend(@Param("cardNo") String cardNo);

    /**
     * 获取所有id，把id赋值给补发的elderId
     * */
    List<GoldElderly> selectAllId();

    /**
     * 批量添加高龄补贴老人
     *
     * */
    boolean insertSomeGoldElderly(@Param("goldElderlies") List<GoldElderly> goldElderlies);

    /**
     * 批量更新
     *
     * */
    int updateByIds(@Param("ids") List<Integer> ids,@Param("applyType") Integer applyType);
}
