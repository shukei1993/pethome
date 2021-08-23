package com.hoki.zj.pet.service.impl;

import com.hoki.zj.basic.domain.Point;
import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.org.domain.Employee;
import com.hoki.zj.org.domain.Shop;
import com.hoki.zj.org.mapper.ShopMapper;
import com.hoki.zj.pet.domain.SearchMasterMsg;
import com.hoki.zj.pet.query.SearchMasterMsgQuery;
import com.hoki.zj.pet.service.ISearchMasterMsgService;
import com.hoki.zj.user.domain.User;
import com.hoki.zj.utils.DistanceUtil;
import com.hoki.zj.utils.GetUserOrEmpContentTools;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class SearchMasterMsgServiceImpl extends BaseServiceImpl<SearchMasterMsg> implements ISearchMasterMsgService {
    
    /** 注解注入ShopMapper对象 */
    @Autowired
    private ShopMapper shopMapper;
    
    /**
     * 1.发布认主信息
     * @param searchMasterMsg
     * @param request
     */
    @Override
    public void publish(SearchMasterMsg searchMasterMsg, HttpServletRequest request) {
        // 1.调用工具类获取当前用户的信息
        User user = (User) GetUserOrEmpContentTools.GetCurrentConsumer(request);
        // 2.将user对象绑定到searchMasterMsg中
        searchMasterMsg.setUser(user);
        // 3.关联最近的门店
        Point point = DistanceUtil.getPoint(searchMasterMsg.getAddress()); // 获取用户的地址坐标
        List<Shop> shops = shopMapper.findAll(); // 查询所有shop
        Shop nearestShop = DistanceUtil.getNearestShop(point, shops); // 获取最近的门店
        searchMasterMsg.setShop(nearestShop); // 关联到最近的门店
        // 4.设置状态为待审核
        searchMasterMsg.setState(0);
        // 5.保存到数据库
        super.save(searchMasterMsg);
    }

    @Override
    public QueryResult<SearchMasterMsg> queryPage(SearchMasterMsgQuery query, HttpServletRequest request) {
        // 1.调用工具类获取当前用户的信息
        Employee employee = (Employee)GetUserOrEmpContentTools.GetCurrentConsumer(request);
        // 2.根据employeeId查询对应的门店
        Shop shop = shopMapper.loadByAdminId(employee.getId());
        // 3.赋值给SearchMasterMsgQuery中的shop_id
        query.setShop_id(shop.getId());
        // 4.调用方法查询
        return super.queryPage(query);
    }

}
