package com.szcwdhy.util.dialect;

public class Pagination {
    private String url; // 页码url
    private int pageSize = 10;  // 每页显示记录数
    private int currentPage = 1;    // 当前页码
    private int maxPage = Integer.MAX_VALUE;    // 最大页数

    // 获取offset
    public int getOffset() {
        return (currentPage - 1) * pageSize;
    }

    // 获取limit
    public int getLimit() {
        return getPageSize();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        if (currentPage < 1)
            currentPage = 1;
        if (currentPage > maxPage)
            currentPage = maxPage;
        this.currentPage = currentPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }
}