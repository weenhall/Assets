package com.wwh.ssh.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.wwh.ssh.entity.Assets;
import com.wwh.ssh.service.AssetService;
import com.wwh.ssh.util.Constant;
import com.wwh.ssh.util.Pager;
import com.wwh.ssh.util.StringUtil;

@Controller
@Scope("prototype")
public class AssetAction extends SuperAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1743023029538051390L;
	@Autowired
	private AssetService assetService;
	@Autowired
	private Assets assets;

	//多条数据分页
	public String show() {
		// 接收request里的参数
		String aName = request.getParameter("aname"); // 资产名称
		// 校验pageNum参数输入合法性
		String pageNumStr = request.getParameter("pageNum");
		if (pageNumStr != null && !StringUtil.isNum(pageNumStr)) {
			request.setAttribute("errorMsg", "参数传输错误");
			return "query_fail";
		}
		int pageNum = Constant.DEFAULT_PAGE_NUM; // 显示第几页数据
		if (pageNumStr != null && !"".equals(pageNumStr.trim())) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		int pageSize = Constant.DEFAULT_PAGE_SIZE; // 每页显示多少条记录
		String pageSizeStr = request.getParameter("pageSize");
		if (pageSizeStr != null && !"".equals(pageSizeStr.trim())) {
			pageSize = Integer.parseInt(pageSizeStr);
		}

		assets.setAname(aName);
		Pager<Assets> result = assetService.queryAllAssets(assets, pageNum, pageSize);
		session.setAttribute("result", result);
		return "success";
	}

	//添加
	public String add() {
		assets.setAid(request.getParameter("aid").toString());
		assets.setAname(request.getParameter("aname"));
		assets.setAnum(request.getParameter("anum"));
		assets.setAkeeper(request.getParameter("akeeper"));
		assets.setAunit(request.getParameter("aunit"));
		assets.setAtype(request.getParameter("atype"));
		assets.setAdepart(request.getParameter("adepart"));
		assets.setAdescripe(request.getParameter("adescripe"));
		if (!"".equals(assets.getAid().trim()) && assetService.addAssets(assets)) {
			session.setAttribute("Assets", assets);
			return "add_success";
		} else {
			return "add_fail";
		}
	}

	//获取一条信息
	public String input() {
		// 获得传递过来的学生编号
		String aid = request.getParameter("aid");
		assets = assetService.input(aid);
		session.setAttribute("assets", assets);
		return "modify_success";
	}

	// 保存修改后信息
	public String save() {
		assets.setAid(request.getParameter("aid"));
		assets.setAname(request.getParameter("aname"));
		assets.setAnum(request.getParameter("anum"));
		assets.setAkeeper(request.getParameter("akeeper"));
		assets.setAunit(request.getParameter("aunit"));
		assets.setAtype(request.getParameter("atype"));
		assets.setAdepart(request.getParameter("adepart"));
		assets.setAdescripe(request.getParameter("adescripe"));
		assetService.updateAssets(assets);
		return "save_success";
	}

	// 删除
	public String delete() {
		String aid = request.getParameter("aid");
		assetService.deleteAssets(aid);
		return "delete_success";
	}

}
