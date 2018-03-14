package com.wwh.ssh.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
				ActionContext context=ActionContext.getContext();
				Map<String, Object> session=context.getSession();
				if(session.get("loginUserName")!=null){
					session.remove("loginUserName");
					String result=invocation.invoke();
					return result;
				}else{
					return "login";
				}
				
			}

}
