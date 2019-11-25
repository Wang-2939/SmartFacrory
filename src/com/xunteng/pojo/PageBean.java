package com.xunteng.pojo;

import java.util.ArrayList;
import java.util.List;

	public class PageBean<T> {

	    // ��ǰҳ
	    private int currentPage;
	    // ��ǰҳ��ʾ������
	    private int currentCount;
	    // ������
	    private int totalCount;
	    // ��ҳ��
	    private int totalPage;
	    // ÿҳ��ʾ������
	    private List<T> list = new ArrayList<T>();

	    public int getCurrentPage() {
	        return currentPage;
	    }

	    public void setCurrentPage(int currentPage) {
	        this.currentPage = currentPage;
	    }

	    public int getCurrentCount() {
	        return currentCount;
	    }

	    public void setCurrentCount(int currentCount) {
	        this.currentCount = currentCount;
	    }

	    public int getTotalCount() {
	        return totalCount;
	    }

	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	    }

	    public int getTotalPage() {
	        return totalPage;
	    }

	    public void setTotalPage(int totalPage) {
	        this.totalPage = totalPage;
	    }

	  

	    public List<T> getList() {
			return list;
		}

		public void setList(List<T> list) {
			this.list = list;
		}

		@Override
	    public String toString() {
	        return "PageBean [currentPage=" + currentPage + ", currentCount=" + currentCount + ", totalCount=" + totalCount
	                + ", totalPage=" + totalPage + ", list=" + list + "]";
	    }

	}

