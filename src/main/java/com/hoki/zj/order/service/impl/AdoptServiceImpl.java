package com.hoki.zj.order.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.constant.BusinessTypeConst;
import com.hoki.zj.order.domain.AdoptOrder;
import com.hoki.zj.order.domain.OrderAddress;
import com.hoki.zj.order.mapper.AdoptMapper;
import com.hoki.zj.order.mapper.OrderAddressMapper;
import com.hoki.zj.order.service.IAdoptService;
import com.hoki.zj.pay.domain.PayBill;
import com.hoki.zj.pay.mapper.PayBillMapper;
import com.hoki.zj.pay.service.IPayService;
import com.hoki.zj.pet.domain.Pet;
import com.hoki.zj.pet.mapper.PetMapper;
import com.hoki.zj.user.domain.User;
import com.hoki.zj.user.domain.UserAddress;
import com.hoki.zj.user.mapper.UserAddressMapper;
import com.hoki.zj.utils.CodeGenerateUtils;
import com.hoki.zj.utils.GetUserOrEmpContentTools;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

@Service
public class AdoptServiceImpl extends BaseServiceImpl<AdoptOrder> implements IAdoptService {

    /** 注解注入PetMapper对象 */
    @Autowired
    private PetMapper petMapper;

    /** 注解注入UserAddressMapper对象 */
    @Autowired
    private UserAddressMapper userAddressMapper;

    /** 注解注入OrderAddressMapper对象 */
    @Autowired
    private OrderAddressMapper orderAddressMapper;

    /** 注解注入PayBill对象 */
    @Autowired
    private PayBillMapper payBillMapper;

    /** 注解注入IPayService */
    @Autowired
    private IPayService payService;

    /** 注解注入AdoptMapper */
    @Autowired
    private AdoptMapper adoptMapper;

    /**
     * 1.生成领养订单
     *  下架对应宠物
     *  领养订单
     *  地址快照
     *  账单
     *  附加:发送短信通知商家
     * @param map {pet_id=2, address_id=1, payment_way=AliPay}
     */
    @Override
    @Transactional
    public String createOrder(Map<String, String> map, HttpServletRequest request) {
        // 1.调用工具类,获取当前用户(前台)的登录信息
        User user = (User) GetUserOrEmpContentTools.GetCurrentConsumer(request);
        // 2.获取map中的参数
        Long pet_id = Long.valueOf(map.get("pet_id"));
        Long address_id = Long.valueOf(map.get("address_id"));
        String payment_way = map.get("payment_way");

        // 通过pet_id查询对应的pet对象
        Pet pet = petMapper.loadByPetId(pet_id);
        // 修改pet对象的状态为下架
        petMapper.offSale(pet_id);
        // 3.生成领养的订单
        AdoptOrder adoptOrder = createAdoptOrder(user, pet);
        adoptOrder.setPet_id(pet_id); // 设置宠物id
        // 设置最终支付时间
        adoptOrder.setLastPayTime(new Date(System.currentTimeMillis() + (30 * 60 * 1000)));
        // 保存到数据库t_order_adopt,并返回生成的主键
        super.save(adoptOrder);

        // 4.生成订单地址快照
        UserAddress userAddress = userAddressMapper.findOne(address_id);// 根据address_id获取UserAddress对象
        OrderAddress orderAddress = createOrderAddress(userAddress, adoptOrder);
        // 保存到数据库
        orderAddressMapper.save(orderAddress);

        // 5.生成对应的账单
        PayBill payBill = createPayBill(adoptOrder, payment_way);
        // 6.保存到数据库
        payBillMapper.save(payBill);
        // 7.调用方法支付
        String result = payService.pay(payBill);
        // 返回调用后的结果
        return result;
    }

    // 封装生成账单的方法
    private PayBill createPayBill(AdoptOrder adoptOrder, String payment_way) {
        PayBill payBill = new PayBill();
        payBill.setDigest(adoptOrder.getDigest()); // 设置摘要
        payBill.setMoney(adoptOrder.getPrice()); // 设置支付金额
        payBill.setState(0); // 设置状态为待支付
        payBill.setLastPayTime(adoptOrder.getLastPayTime()); // 设置最终支付时间
        payBill.setPayChannel(payment_way); // 设置支付方式
        payBill.setCreateTime(new Date()); // 设置创建时间
        payBill.setUser_id(adoptOrder.getUser_id()); // 设置用户id
//        private String nickName;
//        private String unionPaySn;
//        private String businessType;
//        private Long businessKey;
        payBill.setShop_id(adoptOrder.getShop_id()); // 设置店铺
        payBill.setOrderSn(adoptOrder.getOrderSn()); // 设置订单编号
        // 设置订单的类型用于定位
        payBill.setBusinessKey(adoptOrder.getId());
        payBill.setBusinessType(BusinessTypeConst.ADOPTORDER);
        return payBill;
    }

    // 封装生成地址快照的方法
    private OrderAddress createOrderAddress(UserAddress userAddress, AdoptOrder adoptOrder) {
        OrderAddress orderAddress = new OrderAddress(); // 创建一个orderAddress对象
        BeanUtils.copyProperties(userAddress, orderAddress); // 复制userAddress中的属性到orderAddress中
        orderAddress.setCreateTime(new Date()); // 单独设置订单地址快照的时间
        orderAddress.setOrder_id(adoptOrder.getId()); // 设置订单id
        orderAddress.setOrderSn(adoptOrder.getOrderSn()); // 设置订单编号
        return orderAddress;
    }

    // 封装生成领养订单的方法
    private AdoptOrder createAdoptOrder(User user, Pet pet) {
        AdoptOrder adoptOrder = new AdoptOrder(); // 创建一个领养订单对象
        adoptOrder.setDigest("领养订单");// 摘要(写死)
        adoptOrder.setState(0); // 状态设置为待支付(0)
        // 获取pet对象中的价格
        BigDecimal saleprice = pet.getSaleprice();
        adoptOrder.setPrice(saleprice); // 设置价格
        adoptOrder.setUser_id(user.getId()); // 设置领养人
        adoptOrder.setShop_id(pet.getShop_id()); // 设置服务的商家
        // 生成订单号
        String orderSn = CodeGenerateUtils.generateOrderSn(user.getId());
        adoptOrder.setOrderSn(orderSn);
        // address_id?
        return adoptOrder;
    }

    /**
     * 根据交易订单号查询订单对象
     * @param orderSn
     * @return
     */
    @Override
    public AdoptOrder loadByOrderSn(String orderSn) {
        return adoptMapper.loadByOrderSn(orderSn);
    }
}
