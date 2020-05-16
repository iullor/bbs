package com.gyl.commons.page;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;

import java.util.List;


/**
 *
 */

public class PageResult {
    /**
     * 查询第一条sql语句返回的结果集
     */
    private List listData;
    /**
     * 总数
     */
    private Integer count;
    /**
     * 用户传入的当前页,先设置一个默认值
     */
    private Integer currentPage;
    /**
     * 每一页显示的条数
     */
    private Integer pageSize;
    /**
     * 首页
     */
    private Integer beginPage = 1;
    /**
     * 上页
     */
    private Integer prevPage;
    /**
     * 下页
     */
    private Integer nextPage;
    /**
     * 共多少页/末页
     */
    private Integer totalPage;

    private List<Integer> pageSizeItems = Arrays.asList(3, 5, 10);
    private Integer beginIndex;
    private Integer endIndex;

    private List newPage = new ArrayList();

    /**
     * @param listData
     * @param count
     * @param currentPage
     * @param pageSize
     */
    public PageResult(List listData, Integer count, Integer currentPage, Integer pageSize) {
        //给传入进来的几个参数设置值
        this.listData = listData;
        this.count = count;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        //计算beginPage，prevPage，nextPage，totalPage的值
        //也就是相当于末页
        this.totalPage = count % pageSize == 0 ? (count / pageSize) : ((count / pageSize) + 1);
        this.prevPage = currentPage - 1 >= 1 ? (currentPage - 1) : (currentPage);
        this.nextPage = currentPage + 1 <= totalPage ? (currentPage + 1) : (totalPage);
        //高级分页
        PageIndex pageIndex = PageIndex.getPageIndex(3, currentPage, totalPage);
        this.beginIndex = pageIndex.getBeginIndex();
        this.endIndex = pageIndex.getEndIndex();
    }


    public List getListData() {
        return listData;
    }

    public void setListData(List listData) {
        this.listData = listData;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(Integer beginPage) {
        this.beginPage = beginPage;
    }

    public Integer getPrevPage() {
        return prevPage;
    }

    public void setPrevPage(Integer prevPage) {
        this.prevPage = prevPage;
    }

    public Integer getNextPage() {
        return nextPage;
    }

    public void setNextPage(Integer nextPage) {
        this.nextPage = nextPage;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<Integer> getPageSizeItems() {
        return pageSizeItems;
    }

    public void setPageSizeItems(List<Integer> pageSizeItems) {
        this.pageSizeItems = pageSizeItems;
    }

    public Integer getBeginIndex() {
        return beginIndex;
    }

    public void setBeginIndex(Integer beginIndex) {
        this.beginIndex = beginIndex;
    }

    public Integer getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(Integer endIndex) {
        this.endIndex = endIndex;
    }

    public List getNewPage() {
        return newPage;
    }

    public void setNewPage(List newPage) {
        this.newPage = newPage;
    }
}
