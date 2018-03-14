package com.wwh.ssh.util;

import org.apache.commons.lang3.StringUtils;

public class SQLUtil {
	public static String getPagingSQL(String type, String sql, PagingInfo info, String reportCondition) {
		int end = info.getStart() + info.getLimit();
		if ("oracle".equals(type)) {
			return "select * from (select rownum as iamtherownumber_,report_t_0.* from (" + sql
					+ ") report_t_0 where rownum<=" + end + getCondition("and", reportCondition) + getOrderBy(info)
					+ ") report_0_0 where report_0_0.iamtherownumber_>" + info.getStart();
		} else if ("mysql".equals(type)) {
			return "select * from (" + sql + ") report_util_t " + getCondition("where", reportCondition)
					+ getOrderBy(info) + " limit " + info.getStart() + "," + info.getLimit();
		} else if ("sqlserver".equals(type)) {
			String str = "SET NOCOUNT ON " + " select identity(int,1,1) as row_no,result.*  into #resultA from (" + sql
					+ ") result " + getCondition("where", reportCondition) + getOrderBy(info)
					+ " select * from #resultA  where row_no >= " + info.getStart() + " and row_no <=" + end;
			return str;
		} else {
			return sql;
		}
	}

	private static String getCondition(String prefix, String reportCondition) {
		if (StringUtils.isEmpty(reportCondition)) {
			return "";
		} else {
			return " " + prefix + " " + reportCondition;
		}
	}

	private static String getOrderBy(PagingInfo info) {
		return info.getSort() == null ? "" : " order by " + info.getSort() + " " + info.getOrder();
	}

}
