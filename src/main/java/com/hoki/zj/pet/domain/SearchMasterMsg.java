package com.hoki.zj.pet.domain;

import com.hoki.zj.basic.domain.BaseDomain;
import com.hoki.zj.org.domain.Shop;
import com.hoki.zj.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchMasterMsg extends BaseDomain {

    private String name;
    private Double price;
    private String age;
    /** 性别0母  1公 */
    private Integer gender;
    private String coat_color;
    /** 宠物的音频视频图片等资料 */
    private String resources;
    private Long pet_type;
    /** 发布人地址 */
    private String address;
    /** 审核状态0待审核  1启用  -1驳回 */
    private Integer state;

    private String title;

    /** 发布人 */
    private Long user_id;
    private User user;

    /** 最近的店铺 */
    private Long shop_id;
    private Shop shop;
}
