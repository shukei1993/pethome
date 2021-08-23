package com.hoki.zj.basic.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 存放经纬度
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Point {
    //经度
    private Double lng;
    //维度
    private Double lat;
}
