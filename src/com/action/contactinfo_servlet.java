package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.DB;
import com.orm.Contactinfo;
import com.orm.Userinfo;

public class contactinfo_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String type = req.getParameter("type");

		if (type.endsWith("contactinfoAdd")) {
			contactinfoAdd(req, res);
		}
		if (type.endsWith("contactinfoMana")) {
			contactinfoMana(req, res);
		}
		if (type.endsWith("contactinfoDel")) {
			contactinfoDel(req, res);
		}
		if (type.endsWith("contactinfoDetailHou")) {
			contactinfoDetail(req, res);
		}

		if (type.endsWith("contactinfoUpdate")) {
			contactinfoUpdate(req, res);
		}

	}

	public void contactinfoAdd(HttpServletRequest req, HttpServletResponse res) {
		Userinfo userinfo = (Userinfo)req.getSession().getAttribute("currentuser");
		int id = req.getParameter("id") == null ? 0 : Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String mailname = req.getParameter("mailname");
		String telphone = req.getParameter("telphone");
		String remark = req.getParameter("remark");
		int uid = userinfo.getId().intValue();
		String sql = "insert into  contactinfo(name,mailname,telphone,remark,uid) values(?,?,?,?,?)";
		Object[] params = { name, mailname, telphone, remark, uid };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "contactinfo?type=contactinfoMana");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void contactinfoUpdate(HttpServletRequest req,
			HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String mailname = req.getParameter("mailname");
		String telphone = req.getParameter("telphone");
		String remark = req.getParameter("remark");
		int uid = Integer.parseInt(req.getParameter("uid"));
		String sql = "update contactinfo set name=?,mailname=?,telphone=?,remark=?,uid=? where id=?";
		Object[] params = { name, mailname, telphone, remark, uid, id };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "contactinfo?type=contactinfoMana");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void contactinfoDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		String sql = "delete from contactinfo  where id=" + id;
		Object[] params = {};
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "contactinfo?type=contactinfoMana");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void contactinfoMana(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Userinfo userinfo = (Userinfo)req.getSession().getAttribute("currentuser");
		List contactinfoList = new ArrayList();
		String sql = "select * from contactinfo where uid = ? ";
		Object[] params = {userinfo.getId()};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Contactinfo contactinfo = new Contactinfo();
				contactinfo.setName(rs.getString("name"));
				contactinfo.setMailname(rs.getString("mailname"));
				contactinfo.setTelphone(rs.getString("telphone"));
				contactinfo.setRemark(rs.getString("remark"));
				contactinfo.setUid(rs.getInt("uid"));
				contactinfo.setId(rs.getLong("id"));
				contactinfoList.add(contactinfo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("contactinfoList", contactinfoList);
		req.getRequestDispatcher("admin/contactinfo/contactinfoMana.jsp")
				.forward(req, res);
	}

	public void contactinfoDetail(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Contactinfo contactinfo = new Contactinfo();
		String sql = "select * from contactinfo where id=?";
		Object[] params = { id };
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			contactinfo.setName(rs.getString("name"));
			contactinfo.setMailname(rs.getString("mailname"));
			contactinfo.setTelphone(rs.getString("telphone"));
			contactinfo.setRemark(rs.getString("remark"));
			contactinfo.setUid(rs.getInt("uid"));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("contactinfo", contactinfo);
		req.getRequestDispatcher("admin/contactinfo/contactinfoDetail.jsp")
				.forward(req, res);
	}

	public void dispatch(String targetURI, HttpServletRequest request,
			HttpServletResponse response) {
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(
				targetURI);
		try {
			dispatch.forward(request, response);
			return;
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

}
