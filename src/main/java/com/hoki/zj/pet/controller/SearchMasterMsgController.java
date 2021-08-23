package com.hoki.zj.pet.controller;

import com.hoki.zj.pet.domain.SearchMasterMsg;
import com.hoki.zj.pet.query.SearchMasterMsgQuery;
import com.hoki.zj.pet.service.ISearchMasterMsgService;
import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/searchMasterMsg")
public class SearchMasterMsgController {

    /**
     * 注解注入ISearchMasterMsgService对象
     */
    @Autowired
    private ISearchMasterMsgService searchMasterMsgService;

    @PostMapping("/publish")
    public AjaxResult publish(@RequestBody SearchMasterMsg searchMasterMsg, HttpServletRequest request) {
        try {
//            System.out.println(searchMasterMsg);
            searchMasterMsgService.publish(searchMasterMsg, request);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

    @PostMapping("/queryPage")
    public QueryResult<SearchMasterMsg> queryPage(@RequestBody SearchMasterMsgQuery searchMasterMsgQuery, HttpServletRequest request) {
        return searchMasterMsgService.queryPage(searchMasterMsgQuery, request);
    }
}
