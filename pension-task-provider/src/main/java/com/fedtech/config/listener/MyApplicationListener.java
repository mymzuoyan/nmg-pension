package com.fedtech.config.listener;

import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.redis.RedisTemplateUtil;
import com.fedtech.pension.task.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


/**
 * @author CodingQiang
 * @date 2016/12/30
 */
@Service
public class MyApplicationListener implements InitializingBean, ApplicationListener<ApplicationEvent> {

    static Logger logger = LoggerFactory.getLogger(MyApplicationListener.class);

    @Autowired
    private TaskService taskService;

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    @Autowired
    private RedisTemplate redisTemplate;


    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (event instanceof ContextRefreshedEvent) {
        } else if (event instanceof ContextClosedEvent) {
        }
    }


    @Override
    public void afterPropertiesSet() throws Exception {
        loadUnDoTask();
        loadDispatcherCount();
    }


    private void loadUnDoTask() {
        Task task = new Task();
        /**
         * 需求
         */
        task.setType(1);
        /**
         * 待响应
         */
        task.setStatus(1);
        List<Task> tasks = taskService.getAllRecode(task);
        HashMap<Integer, Task> hashMap = new HashMap<>();
        if (ObjectUtils.isNotNull(tasks)) {
            for (Task t : tasks) {
                hashMap.put(t.getId(), t);
            }
        }
        redisTemplateUtil.delete(RedisUtils.CACHE_DEMAND_INFO);
        redisTemplateUtil.setHash(RedisUtils.CACHE_DEMAND_INFO, hashMap);
    }


    /**
     * 初始化调度系统中的数据统计
     */
    public void loadDispatcherCount() {
        try {
            // 从输入流中读取属性列表（键和元素对）
            String[] keys = {"app", "web", "tel", "beeper", "today_app", "today_web", "today_beeper", "today_tel"};
            for (String key : keys) {
                if (!redisTemplate.hasKey(key)) {
                    redisTemplateUtil.set(key, 0L);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
