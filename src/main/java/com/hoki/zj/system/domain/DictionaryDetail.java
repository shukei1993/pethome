package com.hoki.zj.system.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DictionaryDetail {

    private Long id;
    private String name;
    private Long types_id;
    // 字典类型
    private DictionaryType dictionaryType;
}
