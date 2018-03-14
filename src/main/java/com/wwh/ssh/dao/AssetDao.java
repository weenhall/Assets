package com.wwh.ssh.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.wwh.ssh.entity.Assets;
import com.wwh.ssh.util.Pager;
@Repository
public class AssetDao extends SuperDao {
	/**
	 * pageSize:每页显示多少条记录 pageNum:显示第几页记录
	 */
	public Pager<Assets> queryAllAssets(Assets searchModel, int pageNum, int pageSize) {
		Pager<Assets> result = null;

		// 存放查询参数
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String aname=searchModel.getAname();
		StringBuilder hql = new StringBuilder("from Assets where 1=1");
		StringBuilder countHql = new StringBuilder(
				"select count(aid)  from Assets where 1=1 ");

		if (aname != null && !aname.equals("")) {
			hql.append(" and aname like :aname ");
			countHql.append("  and aname like :aname ");
			paramMap.put("aname", "%" + aname + "%");
		}
		// 起始索引
		int fromIndex = pageSize * (pageNum - 1);

		// 存放所有查询出的学生对象
		List<Assets> assetsList = new ArrayList<Assets>();
		Query hqlQuery = getSession().createQuery(hql.toString());
		Query countHqlQuery = getSession().createQuery(countHql.toString());
		// 设置查询参数
		setQueryParams(hqlQuery, paramMap);
		setQueryParams(countHqlQuery, paramMap);
		// 从第几条记录开始查询
		hqlQuery.setFirstResult(fromIndex);
		// 一共查询多少条记录
		hqlQuery.setMaxResults(pageSize);
		// 获取某一页查询的结果
		assetsList = hqlQuery.list();

		// 获取总记录条数
		List<?> countResult = countHqlQuery.list();
		int totalRecord = ((Number) countResult.get(0)).intValue();
		// 获取总页数
		int totalPage = totalRecord / pageSize;
		if (totalRecord % pageSize != 0 || totalPage == 0) {
			totalPage++;
		}
		// 组装pager对象
		result = new Pager<Assets>(pageSize, pageNum, totalRecord, totalPage, assetsList);
		return result;
	}
	/**
	 * 设置查询的参数
	 * 
	 * @param query
	 * @param paramMap
	 * @return
	 */
	private Query setQueryParams(Query query, Map<String, Object> paramMap) {
		if (paramMap != null && !paramMap.isEmpty()) {
			for (Map.Entry<String, Object> param : paramMap.entrySet()) {
				query.setParameter(param.getKey(), param.getValue());
			}
		}
		return query;
	}
	//添加
	public boolean addAssets(Assets assets){
		if(isExist(assets.getAid())==null){
			getSession().save(assets);
			return true;
		}else{
			return false;
		}	
	}
	//判断资产是否存在
	public  String isExist(String aid){
		String hql="select aid from Assets where aid=?";
		Query query=getSession().createQuery(hql);
		query.setParameter(0, aid);
		aid=(String) query.uniqueResult();
		return aid;
	}
	//删除
	public boolean deleteAssets(String aid){
		getSession().delete(getSession().get(Assets.class, aid));
		return true;
	}
	//更新
	public boolean updateAssets(Assets assets){
		getSession().update(assets);
		return true;	
	}
	//获得某个资产信息
	public Assets input(String aid){
		return (Assets) getSession().get(Assets.class, aid);
	}
}
