package com.ttms.common;

public class Page {
	private static int PAGE_SIZE = 5;
	public static int currentPage=1;
	public static int allCountPage;
	
	public static int getAllCountPage() {
		return allCountPage;
	}
	public static void setAllCountPage(int allCountPage) {
		Page.allCountPage = allCountPage;
	}
	private static int currentData;
	public static int getCurrentPage() {
		return currentPage;
	}
	public static void setCurrentPage(int currentPage) {
		Page.currentPage = currentPage;
	}
	public static int getCurrentData() {
		return currentData;
	}
	public static void setCurrentData(int currentData) {
		Page.currentData = currentData;
	}
	public static int getPAGE_SIZE() {
		return PAGE_SIZE;
	}
}
