package com.hoki.zj.pet.service.impl;

import com.hoki.zj.basic.service.impl.BaseServiceImpl;
import com.hoki.zj.org.domain.Employee;
import com.hoki.zj.org.domain.Shop;
import com.hoki.zj.org.mapper.ShopMapper;
import com.hoki.zj.pet.domain.Pet;
import com.hoki.zj.pet.domain.PetDetail;
import com.hoki.zj.pet.mapper.PetDetailMapper;
import com.hoki.zj.pet.mapper.PetMapper;
import com.hoki.zj.pet.query.PetQuery;
import com.hoki.zj.pet.service.IPetService;
import com.hoki.zj.utils.GetUserOrEmpContentTools;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

@Service
public class PetServiceImpl extends BaseServiceImpl<Pet> implements IPetService {

    /** 注解注入ShopMapper对象 */
    @Autowired
    private ShopMapper shopMapper;

    /** 注解注入PetMapper */
    @Autowired
    private PetMapper petMapper;

    /** 注解注入PetDetailMapper对象 */
    @Autowired
    private PetDetailMapper petDetailMapper;

    /**
     * 当前登录用户分页查询
     * @param searchMasterMsgQuery
     * @param request
     * @return
     */
    @Override
    public QueryResult<Pet> queryPage(PetQuery petQuery, HttpServletRequest request) {
        // 1.调用工具类获取当前用户的信息
        Employee employee = (Employee) GetUserOrEmpContentTools.GetCurrentConsumer(request);
        // 2.根据employeeId查询对应的门店
        Shop shop = shopMapper.loadByAdminId(employee.getId());
        // 3.赋值给SearchMasterMsgQuery中的shop_id
        petQuery.setShop_id(shop.getId());
        // 4.调用方法查询
        return super.queryPage(petQuery);
    }

    /**
     * 添加
     * @param pet
     * @param request
     */
    @Override
    public void save(Pet pet, HttpServletRequest request) {
        // 1.调用工具类获取当前用户的信息
        Employee employee = (Employee) GetUserOrEmpContentTools.GetCurrentConsumer(request);
        // 2.根据employeeId查询对应的门店
        Shop shop = shopMapper.loadByAdminId(employee.getId());
        // 3.赋值给shop中的shop_id
        pet.setShop_id(shop.getId());
        // 4.设置状态为下架 0
        pet.setState(0);
//        System.out.println("pet===" + pet);
        // 5.调用方法保存,并返回新增的主键
        petMapper.save(pet);
        // 6.设置petDetail中的pet_id
        PetDetail petDetail = pet.getPetDetail();
        pet.getPetDetail().setPet_id(pet.getId());
        // 7.保存到数据库
        petDetailMapper.save(petDetail);
    }

    /**
     * 上架
     * @param ids
     */
    @Override
    public void onSale(Long... ids) {
        petMapper.onSale(ids);
    }

    /**
     * 下架
     * @param ids
     */
    @Override
    public void offSale(Long... ids) {
        petMapper.offSale(ids);
    }

    /**
     * 前台根据id展示详情数据
     * @param id
     */
    @Override
    public Pet loadByPetId(Long id) {
       return petMapper.loadByPetId(id);
    }

    /**
     * 修改方法
     * @param pet
     */
    @Override
    public void update(Pet pet) {
        super.update(pet);
        petDetailMapper.update(pet.getPetDetail());
    }
}
