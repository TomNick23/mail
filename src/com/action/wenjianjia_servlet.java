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
import com.orm.Userinfo;
import com.orm.Wenjianjia;

public class wenjianjia_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String type = req.getParameter("type");

		if (type.endsWith("wenjianjiaAdd")) {
			wenjianjiaAdd(req, res);
		}
		if (type.endsWith("wenjianjiaMana")) {
			wenjianjiaMana(req, res);
		}
		if (type.endsWith("wenjianjiaDel")) {
			wenjianjiaDel(req, res);
		}
		if (type.endsWith("wenjianjiaDetailHou")) {
			wenjianjiaDetail(req, res);
		}

		if (type.endsWith("wenjianjiaUpdate")) {
			wenjianjiaUpdate(req, res);
		}

	}

	public void wenjianjiaAdd(HttpServletRequest req, HttpServletResponse res) {
		Userinfo userinfo = (Userinfo)req.getSession().getAttribute("currentuser");
		String name = req.getParameter("name");
		String sql = "insert into  wenjianjia(uid,name) values(?,?)";
		Object[] params = { userinfo.getUname(), name };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "wenjianjia?type=wenjianjiaMana");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void wenjianjiaUpdate(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		String uid =  req.getParameter("uid");
		String name = req.getParameter("name");
		String sql = "update wenjianjia set uid=?,name=? where id=?";
		Object[] params = { uid, name, id };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "wenjianjia?type=wenjianjiaMana");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void wenjianjiaDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		String sql = "delete from wenjianjia  where id=" + id;
		Object[] params = {};
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "wenjianjia?type=wenjianjiaMana");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void wenjianjiaMana(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Userinfo userinfo = (Userinfo)req.getSession().getAttribute("currentuser");
		List wenjianjiaList = new ArrayList();
		String sql = "select * from wenjianjia where uid = ? ";
		Object[] params = {userinfo.getUname()};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Wenjianjia wenjianjia = new Wenjianjia();
				wenjianjia.setId(rs.getLong("id"));
				wenjianjia.setUid(rs.getString("uid"));
				wenjianjia.setName(rs.getString("name"));
				wenjianjiaList.add(wenjianjia);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("wenjianjiaList", wenjianjiaList);
		req.getRequestDispatcher("admin/wenjianjia/wenjianjiaMana.jsp")
				.forward(req, res);
	}

	public void wenjianjiaDetail(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Wenjianjia wenjianjia = new Wenjianjia();
		String sql = "select * from wenjianjia where id=?";
		Object[] params = { id };
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			wenjianjia.setUid(rs.getString("uid"));
			wenjianjia.setName(rs.getString("name"));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("wenjianjia", wenjianjia);
		req.getRequestDispatcher("admin/wenjianjia/wenjianjiaDetail.jsp")
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
