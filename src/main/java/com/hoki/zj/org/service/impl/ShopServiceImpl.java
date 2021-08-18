package com.hoki.zj.org.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.org.domain.Employee;
import com.hoki.zj.org.domain.Shop;
import com.hoki.zj.org.domain.ShopLog;
import com.hoki.zj.org.mapper.EmployeeMapper;
import com.hoki.zj.org.mapper.ShopLogMapper;
import com.hoki.zj.org.mapper.ShopMapper;
import com.hoki.zj.org.service.IShopService;
import com.hoki.zj.utils.MailSenderTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.Date;

@Service
public class ShopServiceImpl extends BaseServiceImpl<Shop> implements IShopService {

    /** 注解注入创建EmployeeMapper对象 */
    @Autowired
    private EmployeeMapper employeeMapper;

    /** 注解注入创建ShopLogMapper对象 */
    @Autowired
    private ShopLogMapper shopLogMapper;

    /** 注解注入创建JavaMailSender对象 */
    @Autowired
    private JavaMailSender javaMailSender;

    // 创建工具类对象
    MailSenderTool mailSenderTool = new MailSenderTool();

    /**
     * 1.店铺入驻
     * @param shop
     */
    @Override
    @Transactional
    public void settlement(Shop shop) {
        // 设置shop的默认状态为待审核:0
        shop.setState(0);
        // 设置注册时间为当前时间
        shop.setRegisterTime(new Date());
        // 设置employee 的默认状态待激活
        shop.getAdmin().setState(0);
        // 先保存employee对象,需要其返回的主键
        employeeMapper.save(shop.getAdmin());
        // 再保存shop,此时admin_id已经有值
        super.save(shop);
    }

    /**
     * 2.审核驳回
     * @param shopLog shop_id  note
     */
    @Override
    @Transactional
    public void reject(ShopLog shopLog) {
        // 1.根据shop_id查询shop对象
        Shop shop = super.findOne(shopLog.getShop_id());
        // 2.设置shop的状态为-1
        shop.setState(-1);
        // 3.保存shop到数据库
        super.update(shop);
        // 4.设置employee,暂时设置id为1
        Employee employee = new Employee();
        employee.setId(1L);
        shopLog.setEmployee(employee);
        // 5.设置checkTime为当前时间
        shopLog.setCheckTime(new Date());
        // 6.保存shoplog到数据库
        shopLogMapper.save(shopLog);
        // 根据shop_id查询对应的admin_id
        Long admin_id = shop.getAdmin_id();
        System.out.println(admin_id);
        // 查询employee中的Email地址
        String email = employeeMapper.findOne(admin_id).getEmail();

        // 7.发送审核失败的邮件并且提示原因,以及修改的链接
        MimeMessage mimeMessage = javaMailSender.createMimeMessage(); // 获取MimeMessage对象
        String from = "zj93830@sina.cn";
        String text = "<img src='https://iknow-pic.cdn.bcebos.com/2f738bd4b31c8701bbed72b1237f9e2f0708ff0a'/></hr>" +
                        "<h1>失败原因</h1></br><span>" + shopLog.getNote() +
                        "</span></br><span style='color: red'><a href='http://127.0.0.1:8081/#/register2/?id="
                        + shopLog.getShop_id() + "'>请修改资料</a></span>";
        File file = new File("D:\\picture\\shizuri_vollen.jpg");
        String to = email;

        try {
            mailSenderTool.sendMail(mimeMessage,true, "utf-8", from, "审核驳回通知",
                    text, true, "1.jpg", file, to);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        javaMailSender.send(mimeMessage);

    }

    /**
     * 3.审核通过功能
     * @param shopLog shop_id  note=null
     */
    @Override
    @Transactional
    public void pass(ShopLog shopLog) {
        // 1.通过shop_id查询shop对象
        Shop shop = super.findOne(shopLog.getShop_id());
        // 2.设置shop的状态为1(审核通过)
        shop.setState(1);
        // 3.保存修改到数据库
        super.update(shop);
        // 4.设置employee_id为1(目前写死)
        Employee employee = new Employee();
        employee.setId(1L);
        shopLog.setEmployee(employee);
        // 5.设置审核时间
        shopLog.setCheckTime(new Date());
        // 6.设置日志内容为审核通过
        shopLog.setNote("审核通过");
        // 7.保存到数据库
        shopLogMapper.save(shopLog);
        // 8.发送激活邮件,携带激活链接,点击修改账户状态
        Long id = employee.getId();
        // 根据shop_id查询对应的admin_id
        Long admin_id = shop.getAdmin_id();
        System.out.println(admin_id);
        // 查询employee中的Email地址
        String email = employeeMapper.findOne(admin_id).getEmail();

        MimeMessage mimeMessage = javaMailSender.createMimeMessage(); // 获取MimeMessage对象
        String from = "zj93830@sina.cn";
        String text = "<img src='https://iknow-pic.cdn.bcebos.com/2f738bd4b31c8701bbed72b1237f9e2f0708ff0a'/>" +
                        "<h1>审核通过,欢迎加入宠物之家</h1></hr>" +
                        "<span style=color: 'orange'><a href='http://127.0.0.1:8080/emp/change/"+ id +"'>点击激活</a></span>";
        File file = new File("D:\\picture\\newyear.jpg");
        String to = email;

        try {
            mailSenderTool.sendMail(mimeMessage,true, "utf-8", from, "审核通过通知",
                    text, true, "2.jpg", file, to);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        javaMailSender.send(mimeMessage);
    }

    /**
     * 4.审核驳回修改后再提交
     * @param shop
     */
    @Override
    public void reSettlement(Shop shop) {
        // 设置店铺状态为待审核
        shop.setState(0);
        // 修改到数据库
        super.update(shop);
    }
}
