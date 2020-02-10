package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.exception.CustomerException;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.pension.call.entity.MonitorGroup;
import com.fedtech.pension.call.mapper.MonitorGroupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Administrator
 * @date 2016/9/26
 */
@Service(interfaceClass = MonitorGroupService.class, version = "1.0.0")
public class MonitorGroupServiceImpl extends BaseServiceImpl<MonitorGroup> implements MonitorGroupService {

    @Autowired
    private MonitorGroupMapper mapper;

    @Override
    public BaseMapper<MonitorGroup> getMapper() {
        return mapper;
    }

    @Override
    public MonitorGroup selectMonitorGroupByName(String name) {
        return mapper.selectMonitorGroupByName(name);
    }

    @Override
    @Transactional
    public boolean insert(MonitorGroup record) {
        boolean b = false;
        if (super.insert(record)) {
            //添加坐席组
            String param = "type=add&groupname=" + record.getName();
            String sr = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method.php", param);
            switch (sr) {
                case "1":
                    b = true;
                    break;
                case "-1":
                    b = false;
                    throw new CustomerException("添加失败返回");
                default:
                    throw new CustomerException("添加失败返回");
            }
        }
        return b;
    }

    @Override
    @Transactional
    public boolean updateByPrimaryKeySelective(MonitorGroup record) {
        String oldName = super.selectByPrimaryKey(record.getId()).getName();
        boolean b = false;
        if (super.updateByPrimaryKeySelective(record)) {
            //更新坐席组
            String param = "type=update&groupname=" + oldName + "&newname=" + record.getName();
            String sr = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method.php", param);
            switch (sr) {
                case "1":
                    b = true;
                    break;
                case "-1":
                    b = false;
                    throw new CustomerException("不存在需要修改的分组");
                default:
                    throw new CustomerException("更新座席分组名失败");
            }
        }
        return b;
    }

    @Override
    @Transactional
    public boolean deleteByPrimaryKey(Integer id) {
        String oldName = super.selectByPrimaryKey(id).getName();
        boolean b = false;
        if (super.deleteByPrimaryKey(id)) {
            //删除坐席组
            String param = "type=del&groupname=" + oldName;
            String sr = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method.php", param);
            switch (sr) {
                case "1":
                    b = true;
                    break;
                case "-1":
                    b = false;
                    throw new CustomerException("不存在需要删除的分组");
                default:
                    throw new CustomerException("删除座席分组名失败");
            }
        }
        return b;
    }


}
