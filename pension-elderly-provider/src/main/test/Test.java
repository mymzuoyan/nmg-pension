import com.fedtech.ElderlyApplication;
import com.fedtech.commons.utils.CardNoUtils;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.Ag03001;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.AG03001Service;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/11/12
 */
@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = ElderlyApplication.class)
public class Test {

    @Autowired
    private ElderlyMsgService elderlyMsgService;

    @Autowired
    private AG03001Service ag03001Service;

    @org.junit.Test
    public void ag03001(){
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat df1 = new SimpleDateFormat("yyyyMM");
        int count = 2684309; //总量
        int length = 10000;
        int num = count/length;
        List<String> list  = new ArrayList<>();
        for (int i = 234 ; i <= num; i++) {
            System.out.println("---------------------"+(i+1)+"页-----------");
            List<Ag03001> ag03001s = ag03001Service.selectAll(i * length, length);
            List<ElderlyMsg> msgList = new ArrayList<>();
            for (Ag03001 ag03001 : ag03001s) {
                ElderlyMsg elderlyMsg = new ElderlyMsg();
                //姓名
                elderlyMsg.setElderName(ag03001.getCagp9009());
                //居住地址
                elderlyMsg.setRealAddress(ag03001.getCagp9024());
                //身份证号
                elderlyMsg.setIdcardno(ag03001.getCagp9008());
                //民族
                String cagp9013 = ag03001.getCagp9013();
                if(cagp9013!=null && cagp9013!=""){
                    elderlyMsg.setNationDictId(Integer.parseInt(cagp9013));
                }

                //移动电话
                String cagp9080 = ag03001.getCagp9080();
                if(cagp9080!=null && cagp9080!=""){
                    elderlyMsg.setMobile(cagp9080);
                }

                //死亡日期
                String cagp9067 = ag03001.getCagp9067();
                Integer isDeath = 0;
                Date parse = null;
                if(!StringUtils.isEmpty(cagp9067)){
                    int length1 = cagp9067.length();
                    if(length1==8){
                        try {
                            parse = df.parse(cagp9067);
                        } catch (ParseException e) {
                            System.out.println("------------- deathTime8: " + cagp9067);
                        }
                    } else if(length1==6){
                        try {
                            parse = df1.parse(cagp9067);
                        } catch (ParseException e) {
                            System.out.println("------------- deathTime --- error: " + cagp9067);
                        }
                    }else{
                        System.out.println("------------- deathTime6: " + cagp9067);
                    }
                } else{
                    isDeath = 1;
                }
                elderlyMsg.setDeathTime(parse);
                elderlyMsg.setIsDeath(isDeath);

                boolean legal = CardNoUtils.isLegal(ag03001.getCagp9008());
                if (legal = true) {
                    //年龄
                    elderlyMsg.setAge(CardNoUtils.getAgeByIdCard(ag03001.getCagp9008()));
                    //性别
                    elderlyMsg.setSexDictId(CardNoUtils.getGenderByIdCard(ag03001.getCagp9008()));
                    //出生日期
                    elderlyMsg.setBirthday(CardNoUtils.getBirthByIdCard(ag03001.getCagp9008()));
                }

                //根据区域编码查询区域信息

                Area area = ag03001Service.selectbyDistrictId(ag03001.getCagp9007());
                if (area != null) {
                    String areaName = ag03001Service.getAreaName(area.getId());
                    elderlyMsg.setAreaId(area.getId());
                    elderlyMsg.setAreaName(areaName);
                } else {
                    area = ag03001Service.selectbyDistrictId(ag03001.getCagp9006());
                    if (area != null) {
                        String areaName = ag03001Service.getAreaName(area.getId());
                        elderlyMsg.setAreaId(area.getId());
                        elderlyMsg.setAreaName(areaName);
                    } else {
                        area = ag03001Service.selectbyDistrictId(ag03001.getCagp9005());
                        if (area != null) {
                            String areaName = ag03001Service.getAreaName(area.getId());
                            elderlyMsg.setAreaId(area.getId());
                            elderlyMsg.setAreaName(areaName);
                        }
                    }
                }
                try {

                    msgList.add(elderlyMsg);
                    if(i==268){
                        if(msgList.size()>=4309){
                            System.out.println("---------------------插入4309--------");
                            elderlyMsgService.insertBatch(msgList);
                            msgList.removeAll(msgList);
                        }
                    }
                    if (msgList.size() >= 10000) {
                        System.out.println("---------------------插入10000--------");
                        elderlyMsgService.insertBatch(msgList);
                        msgList.removeAll(msgList);
                    }
                }catch (Exception e){
                    e.printStackTrace();
                  list.add(ag03001.getCagp9008());
                }
            }
        }
        int number = 0 ;
        for (String str : list) {
            System.out.println("```````````````````````错误数据第" + (++number) + "条：" + str);
        }
        System.out.println("``````````` 循环结束 ````````````");
    }
}
