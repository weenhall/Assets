package com.wwh.ssh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwh.ssh.dao.AssetDao;
import com.wwh.ssh.entity.Assets;
import com.wwh.ssh.util.Pager;

@Service
public class AssetService {
	@Autowired
	private AssetDao assetDao;

	public Pager<Assets> queryAllAssets(Assets searchModel, int pageNum, int pageSize) {
		return assetDao.queryAllAssets(searchModel, pageNum, pageSize);
	}
	
	public boolean addAssets(Assets assets){
		return assetDao.addAssets(assets);
	}
	public boolean updateAssets(Assets assets){
		return assetDao.updateAssets(assets);
	}
	public boolean deleteAssets(String aid){
		return assetDao.deleteAssets(aid);
	}
	public Assets input(String aid){
		return assetDao.input(aid);
	}
}
