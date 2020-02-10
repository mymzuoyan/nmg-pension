package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.portal.entity.Letter;
import com.fedtech.pension.portal.mapper.LetterMapper;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * @author gengqiang
 */
@Service(interfaceClass = LetterService.class, version = "1.0.0")
public class LetterServiceImpl extends BaseServiceImpl<Letter> implements LetterService {

    @Autowired
    private LetterMapper letterMapper;

    @Override
    public BaseMapper<Letter> getMapper() {
        return letterMapper;
    }
}
