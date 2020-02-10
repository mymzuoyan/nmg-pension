package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.exception.CustomerException;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.MD5;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.mapper.MonitorMapper;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.service.UserRoleService;
import com.fedtech.pension.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Objects;


/**
 * @author Administrator
 * @date 2016/9/12
 */
@Service(interfaceClass = MonitorService.class, version = "1.0.0")
public class MonitorServiceImpl extends BaseServiceImpl<Monitor> implements MonitorService {
    protected Logger logger = LoggerFactory.getLogger(MonitorServiceImpl.class);

    @Autowired
    private MonitorMapper mapper;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;

    @Override
    public BaseMapper<Monitor> getMapper() {
        return mapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean addMonitor(User user, Integer groupId, String groupName, String queueName, String extension) {
        boolean b = false;
        String pwd = user.getPass_word();
        //添加用户
        user.setPass_word(MD5.MD5Encode(user.getPass_word()));
        user.setCreate_time(System.currentTimeMillis());
        user = userService.insertBackId(user);
        if (user.getUid() > 0) {
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUid());
            userRole.setRoleId(RoleType.MonitorUser.getId());
            if (userRoleService.insert(userRole)) {
                Monitor monitor = new Monitor();
                monitor.setUserId(user.getUid());
                monitor.setGroupId(groupId);
                monitor.setQueueName(queueName);
                monitor.setExtension(extension);
                if (this.insert(monitor)) {
                    try {
                        groupName = URLEncoder.encode(groupName, "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    //添加坐席
                    String param = "type=add&groupname=" + groupName + "&agentid=" + user.getLogin_name() + "&agentname=" + user.getNick_name() + "&pwd=" + pwd + "&penalty=0";
                    String sr = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method_adv.php", param);

                    switch (sr) {
                        case "1":
                            b = true;
                            break;
                        case "-1":
                            b = false;
                            throw new CustomerException("不存在添加对应座席分组");
                        case "0":
                            b = false;
                            throw new CustomerException("存在已添加的座席工号0");
                        case "-3":
                            b = false;
                            throw new CustomerException("全部都是已添加的工号");
                        case "-2":
                            b = false;
                            throw new CustomerException("不存在参数信息");
                        default:
                            throw new CustomerException("添加失败");
                    }
                }
            }
        }
        return b;
    }

    @Override
    @Transactional
    public boolean addAgent(Monitor monitor){
        mapper.insertAgent(monitor);
        return true;
    }

    @Override
    @Transactional
    public boolean updateMonitor(User user, String extension, Integer groupId, Integer oldGroupId, String groupName, boolean oldIsLeader, boolean isLeader) {
        boolean b = false;
        if (ObjectUtils.isNotNull(user.getUid())) {
            if (userService.updateByPrimaryKeySelective(user)) {
                String nick_name = "";
                try {
                    nick_name = URLEncoder.encode(user.getNick_name(), "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                //调用接口
                String param = "type=update&agentid=" + user.getLogin_name() + "&agentname=" + nick_name;
                String sr = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method_adv.php", param);
                switch (sr) {
                    case "1":
                        b = true;
                        break;
                    case "-1":
                        b = false;
                        throw new CustomerException("更新失败");
                    default:
                        throw new CustomerException("更新失败");
                }

                if (oldIsLeader != isLeader) {
                    UserRole userRole = new UserRole();
                    userRole.setUserId(user.getUid());
                    if (isLeader) {
                        userRole.setRoleId(RoleType.MonitorAdmin.getId());
                    } else {
                        userRole.setRoleId(RoleType.MonitorUser.getId());
                    }
                    userRoleService.updateUsrRole(userRole);
                }
                //更新分组
                Monitor monitor = new Monitor();
                monitor.setExtension(extension);
                monitor.setUserId(user.getUid());
                monitor.setGroupId(groupId);
                monitor.setIsLeader(isLeader);
                if (mapper.updateByUserId(monitor) != 0) {
                    if (!Objects.equals(oldGroupId, groupId)) {
                        try {
                            groupName = URLEncoder.encode(groupName, "UTF-8");
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                        //调用接口更新分组
                        String param1 = "type=update&agentid=" + user.getLogin_name() + "&newgroupname=" + groupName;
                        String sr1 = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method_adv.php", param1);
                        switch (sr1) {
                            case "1":
                                b = true;
                                break;
                            case "-1":
                                b = false;
                                throw new CustomerException("更新分组失败");
                            default:
                                throw new CustomerException("更新分组失败");
                        }
                    }
                }

            }
        }
        return b;
    }

    @Override
    @Transactional
    public boolean deleteMonitor(Integer uid) {
        boolean b = false;
        User user = userService.selectByPrimaryKey(uid);
        if (ObjectUtils.isNotNull(uid)) {
            if (userService.deleteByPrimaryKey(uid)) {
                if (mapper.deleteMonitor(uid) != 0) {
                    //调用接口
                    String param = "type=del&agentid=" + user.getLogin_name();
                    String sr = HttpRequest.sendGet(Keys.IP + "/bginterface/agentgroup_method_adv.php", param);
                    switch (sr) {
                        case "1":
                            b = true;
                            break;
                        case "-1":
                            b = false;
                            throw new CustomerException("删除失败");
                        default:
                            throw new CustomerException("删除失败");
                    }
                }
            }
        }
        return b;
    }

    @Override
    public Monitor selectByUserId(Integer userId) {
        return mapper.selectByUserId(userId);
    }

    @Override
    public boolean updateByUserId(Monitor monitor) {
        if (null != monitor) {
            Monitor oldMonitor = mapper.selectByUserId(monitor.getUserId());
            if (ObjectUtils.isNotNull(oldMonitor)) {
                //退出
                String param = "&interface=SIP/" + oldMonitor.getExtension() + "&queue=" + oldMonitor.getQueueName();
                String sr = HttpRequest.sendPost(Keys.IP + "//cti/lt_agent_logoff.php", param);
                if ("0".equals(sr)) {
                    if (1 == mapper.updateByUserId(monitor)) {
                        //重新登录
                        param = "agentid=" + oldMonitor.getAccount() + "&interface=SIP/" + monitor.getExtension() + "&queue=" + monitor.getQueueName();
                        sr = HttpRequest.sendPost(Keys.IP + "//cti/lt_agent_login.php", param);
                        if ("1".equals(sr) || "0".equals(sr)) {
                            return true;
                        }
                    }
                } else {
                    //失败了也重新登录
                    param = "agentid=" + oldMonitor.getAccount() + "&interface=SIP/" + oldMonitor.getExtension() + "&queue=" + oldMonitor.getQueueName();
                    sr = HttpRequest.sendPost(Keys.IP + "//cti/lt_agent_login.php", param);
                    if ("1".equals(sr) || "0".equals(sr)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override
    public Monitor selectByAgentNum(String agentnum) {
        return mapper.selectByAgentNum(agentnum);
    }

    @Override
    public void updateAgent(Monitor monitor) {
        mapper.updateAgent(monitor);
    }

    @Override
    public Monitor selectByMonitorId(Integer id) {
        return mapper.selectByMonitorId(id);
    }

    @Override
    public boolean updateMonitor(Integer id, Integer uid,String queueName,String pstnnumber) {
        int c = mapper.updateMonitorUser(id,uid,queueName,pstnnumber);
        return c==1?true:false;
    }

    @Override
    public List<Monitor> selectAll() {
        return mapper.selectAll();
    }

}