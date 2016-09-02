package cn.sqliu.util;

public class PageUtil {
	private static final int PAGE_SIZE = 10;

    public static int getPageSize() {
        return PAGE_SIZE;
    }

    public static Integer getCurrentPage(Integer currentPage) {
        return currentPage == null? 1 : currentPage;
    }

    public static Integer getPageSize(Integer pageSize) {
        return pageSize == null? PAGE_SIZE : pageSize;
    }
}
