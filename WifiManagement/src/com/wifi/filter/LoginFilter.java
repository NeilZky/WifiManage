package com.wifi.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wifi.constance.LogicContance;

public class LoginFilter implements Filter {
 
 private static final String LOGON_URI = "LOGON_URI";
 private static final String LOGIN_ACTION = "LOGIN_ACTION";
 private static final String HOME_URI = "HOME_URI";
 private String logon_page;
 private String home_page;
 private String login_action;

 public void destroy() {
 }

 // TODO Auto-generated method stub
 public void doFilter(ServletRequest request, ServletResponse response,
   FilterChain chain) throws IOException, ServletException {
  // TODO Auto-generated method stub
  HttpServletRequest httpReq = (HttpServletRequest) request;
  HttpServletResponse httpResp = (HttpServletResponse) response;
  httpResp.setContentType("text/html");
  httpResp.setCharacterEncoding("utf-8");
  HttpSession session = httpReq.getSession();
  PrintWriter out = httpResp.getWriter();
  // �õ��û������URI
  String request_uri = httpReq.getRequestURI();
  // �õ�webӦ�ó����������·��
  String ctxPath = httpReq.getContextPath();
  // ȥ��������·�����õ�ʣ�ಿ�ֵ�·��
  String uri = request_uri;
  // �ж��û����ʵ��Ƿ��ǵ�¼ҳ��
  if (uri.equals(logon_page) || uri.equals(home_page)||uri.equals(login_action)) {
   chain.doFilter(request, response);
   return;
  } else {
   // ������ʵĲ��ǵ�¼ҳ�棬���ж��û��Ƿ��Ѿ���¼
   if (session.getAttribute(LogicContance.SESSION_USER) != null) {
    chain.doFilter(request, response);
    return;
   } else {
    out.println("<script language=\"javaScript\">"
      + "parent.location.href='" + ctxPath + logon_page + "'"
      + "</script>");
    // httpReq.getRequestDispatcher(logon_page).forward(httpReq,httpResp);
    return;
   }
  }
 }

 public void init(FilterConfig config) throws ServletException {
  // TODO Auto-generated method stub
  // �Ӳ����������л�ȡ��¼ҳ�����ҳ��URI
  logon_page = config.getInitParameter(LOGON_URI);
  home_page = config.getInitParameter(HOME_URI);
  login_action = config.getInitParameter(LOGIN_ACTION);
  // System.out.println(logon_page);
  if (null == logon_page || null == home_page||null == login_action) {
   throw new ServletException("û���ҵ���¼ҳ�����ҳ");
  }
 }
}