package com.hoki.zj.pet.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.pet.domain.SearchMasterMsg;
import com.hoki.zj.pet.query.SearchMasterMsgQuery;
import com.hoki.zj.utils.QueryResult;

import javax.servlet.http.HttpServletRequest;

public interface ISearchMasterMsgService extends IBaseService<SearchMasterMsg> {

    /** 发布认主信息 */
    void publish(SearchMasterMsg searchMasterMsg, HttpServletRequest request);

    QueryResult<SearchMasterMsg> queryPage(SearchMasterMsgQuery query, HttpServletRequest request);
}
