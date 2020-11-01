package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.DB;
import com.orm.Messageinfo;
import com.orm.Userinfo;
import com.orm.Wenjianjia;
import com.service.fileService;

public class messageinfo_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String type = req.getParameter("type");

		if (type.endsWith("messageinfoAdd")) {
			messageinfoAdd(req, res);
		}
		if (type.endsWith("getAllFiles")) {
			getAllFiles(req, res);
		}
		if (type.endsWith("messageinfoDel")) {
			messageinfoDel(req, res);
		}
		if (type.endsWith("messageinfoDetailHou")) {
			messageinfoDetail(req, res);
		}

		if (type.endsWith("messageinfoUpdate")) {
			messageinfoUpdate(req, res);
		}

		if (type.endsWith("messageinfoSave")) {
			messageinfoSave(req, res);
		}

		if (type.endsWith("messageinfoList")) {
			messageinfoList(req, res);
		}
		if (type.endsWith("messageinfoMove")) {
			messageinfoMove(req, res);
		}
		if (type.endsWith("messageinfoByWenjian")) {
			messageinfoByWenjian(req, res);
		}
		

	}

	public void messageinfoList(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Userinfo userinfo = (Userinfo) req.getSession().getAttribute(
				"currentuser");
		int menu = Integer.parseInt(req.getParameter("menu"));
		List messageinfoList = new ArrayList();
		String sql = "select c.* from wjxinfo a  left join wenjianjia b on a.wjjid = b.id  left join messageinfo c on a.mid = c.id where 1=1 ";
		sql = sql + " and b.uid = '" + userinfo.getUname() + "' ";

		if (menu == 1) { // �ݸ���
			sql = sql + " and b.name='�ݸ���'";
			req.setAttribute("tt", "�ݸ���");
		}
		if (menu == 2) { // ������
			sql = sql + " and b.name='������'";
			req.setAttribute("tt", "������");
		}
		if (menu == 3) { // �ռ���
			sql = sql + " and b.name='�ռ���'";
			req.setAttribute("tt", "�ռ���");
		}
		if (menu == 4) { // ��ɾ��
			sql = sql + " and b.name='��ɾ��'";
			req.setAttribute("tt", "��ɾ��");
		}
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Messageinfo messageinfo = new Messageinfo();
				messageinfo.setFromu(rs.getString("fromu"));
				messageinfo.setId(rs.getLong("id"));
				messageinfo.setTouser(rs.getString("touser"));
				messageinfo.setFssj(rs.getString("fssj"));
				messageinfo.setTitle(rs.getString("title"));
				messageinfo.setContent(rs.getString("content"));
				messageinfo.setZt(rs.getString("zt"));
				messageinfo.setDshi(rs.getString("dshi"));
				messageinfoList.add(messageinfo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("messageinfoList", messageinfoList);

		req.setAttribute("menu", menu);
		req.getRequestDispatcher("admin/messageinfo/messageinfoList.jsp")
				.forward(req, res);

	}

	public void messageinfoByWenjian(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		Userinfo userinfo = (Userinfo) req.getSession().getAttribute(
				"currentuser");
		//int menu = Integer.parseInt(req.getParameter("menu"));
		int id = Integer.parseInt(req.getParameter("id"));
		List messageinfoList = new ArrayList();
		String sql = "select c.* from wjxinfo a  left join wenjianjia b on a.wjjid = b.id  left join messageinfo c on a.mid = c.id where 1=1 ";
		sql = sql + " and b.uid = '" + userinfo.getUname() + "'  and wjjid = ? ";

		req.setAttribute("tt", fileService.getWjjName(id));
		Object[] params = {id};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Messageinfo messageinfo = new Messageinfo();
				messageinfo.setFromu(rs.getString("fromu"));
				messageinfo.setId(rs.getLong("id"));
				messageinfo.setTouser(rs.getString("touser"));
				messageinfo.setFssj(rs.getString("fssj"));
				messageinfo.setTitle(rs.getString("title"));
				messageinfo.setContent(rs.getString("content"));
				messageinfo.setZt(rs.getString("zt"));
				messageinfo.setDshi(rs.getString("dshi"));
				messageinfoList.add(messageinfo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("messageinfoList", messageinfoList);
		req.setAttribute("wjjid", id);
//		req.setAttribute("menu", 1000);
		req.getRequestDispatcher("admin/messageinfo/messageinfoList.jsp")
				.forward(req, res);

	}

	public void messageinfoSave(HttpServletRequest req, HttpServletResponse res) {
		SimpleDateFormat format = new SimpleDateFormat("MM��dd��");
		String fromu = req.getParameter("fromu");
		String touser = req.getParameter("touser");
		String fssj = format.format(new Date());
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String zt = "�ݸ�";
		String dshi = req.getParameter("dshi");
		String sql = "insert into  messageinfo(fromu,touser,fssj,title,content,zt,dshi) values(?,?,?,?,?,?,?)";
		Object[] params = { fromu, touser, fssj, title, content, zt, dshi };
		DB mydb = new DB();
		int id = mydb.doPstm1(sql, params);
		fileService.saveMessageinfo(fromu, "�ݸ���", id);
		mydb.closed();
		req.setAttribute("message", "�����ɹ�");
		req.setAttribute("path", "messageinfo?type=messageinfoList&menu=1");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void messageinfoAdd(HttpServletRequest req, HttpServletResponse res) {
		SimpleDateFormat format = new SimpleDateFormat("MM��dd��");
		int menu = Integer.parseInt(req.getParameter("menu"));
		String fromu = req.getParameter("fromu");
		String touser = req.getParameter("touser");
		String fssj = format.format(new Date());
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String zt = "";
		if (menu == 2) {
			zt = "�ѷ���";
		}

		String dshi = req.getParameter("dshi");
		String sql = "insert into  messageinfo(fromu,touser,fssj,title,content,zt,dshi) values(?,?,?,?,?,?,?)";
		Object[] params = { fromu, touser, fssj, title, content, zt, dshi };
		DB mydb = new DB();
		int mid = mydb.doPstm1(sql, params);
		mydb.closed();

		fileService.saveMessageinfo(fromu, "������", mid);
		fileService.saveMessageinfo(touser, "�ռ���", mid);

		req.setAttribute("message", "�����ɹ�");
		req.setAttribute("path", "messageinfo?type=messageinfoList&menu="
				+ menu);
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void messageinfoUpdate(HttpServletRequest req,
			HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		int cz = Integer.parseInt(req.getParameter("cz"));
		SimpleDateFormat format = new SimpleDateFormat("MM��dd��");
		String fromu = req.getParameter("fromu");
		String touser = req.getParameter("touser");
		String fssj = format.format(new Date());
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String zt = req.getParameter("zt");
		String dshi = req.getParameter("dshi");
		String sql = "update messageinfo set fromu=?,touser=?,fssj=?,title=?,content=?,zt=?,dshi=? where id=?";
		Object[] params = { fromu, touser, fssj, title, content, zt, dshi, id };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "�����ɹ�");
		req.setAttribute("path", "messageinfo?type=messageinfoMana");
		if (cz == 1) { // �޸Ĳݸ�
			req.setAttribute("path", "messageinfo?type=messageinfoList&menu=1");
		}
		if (cz == 2) {
			fileService.deleteMessageinfo(fromu, "�ݸ���", id);
			fileService.saveMessageinfo(fromu, "������", id);
			fileService.saveMessageinfo(touser, "�ռ���", id);
			req.setAttribute("path", "messageinfo?type=messageinfoList&menu=2");
		}
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void messageinfoDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Messageinfo info = fileService.getMessageinfo(id);
		if(req.getParameter("menu")==null || "".equals(req.getParameter("menu"))){
			int wjjid = Integer.parseInt(req.getParameter("wjjid"));
			fileService.deleteMessageinfo1(wjjid, id);
			fileService.saveMessageinfo(info.getFromu(), "��ɾ��", id);
			req.setAttribute("message", "�����ɹ�");
			req.setAttribute("path", "messageinfo?type=messageinfoByWenjian&id="+ wjjid);
		}else{
			int menu = Integer.parseInt(req.getParameter("menu"));
			
			if (menu == 1) { // �ݸ���
				fileService.deleteMessageinfo(info.getFromu(), "�ݸ���", id);
				fileService.saveMessageinfo(info.getFromu(), "��ɾ��", id);
			}
			if (menu == 2) { // ������
				fileService.deleteMessageinfo(info.getFromu(), "������", id);
				fileService.saveMessageinfo(info.getFromu(), "��ɾ��", id);
			}
			if (menu == 3) { // �ռ���
				fileService.deleteMessageinfo(info.getTouser(), "�ռ���", id);
				fileService.saveMessageinfo(info.getTouser(), "��ɾ��", id);
			}
			req.setAttribute("message", "�����ɹ�");
			req.setAttribute("path", "messageinfo?type=messageinfoList&menu="+ menu);
		}
		
		

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void messageinfoDel1(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		int cz = Integer.parseInt(req.getParameter("cz"));
		String sql = "delete from messageinfo  where id=" + id;
		Object[] params = {};
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "�����ɹ�");
		req.setAttribute("path", "messageinfo?type=messageinfoMana");
		if (cz == 1) { // �޸Ĳݸ�
			req.setAttribute("path", "messageinfo?type=messageinfoCaogao");
		}
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void getAllFiles(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Userinfo userinfo = (Userinfo) req.getSession().getAttribute(
				"currentuser");
		int id = Integer.parseInt(req.getParameter("id"));
		
		if(req.getParameter("menu")==null || req.getParameter("menu").equals("")){
			int wjjid = Integer.parseInt(req.getParameter("wjjid"));
			List wjjList = new ArrayList();
			String sql = "select * from wenjianjia where uid=? ";
			Object[] params = { userinfo.getUname() };
			DB mydb = new DB();
			try {
				mydb.doPstm(sql, params);
				ResultSet rs = mydb.getRs();
				while (rs.next()) {
					Wenjianjia messageinfo = new Wenjianjia();
					messageinfo.setName(rs.getString("name"));
					messageinfo.setId(rs.getLong("id"));
					messageinfo.setUid(rs.getString("uid"));
					wjjList.add(messageinfo);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			mydb.closed();
			req.setAttribute("wjjList", wjjList);
			req.setAttribute("mid", id);
			req.setAttribute("wjjid", wjjid);
			req.getRequestDispatcher("admin/messageinfo/messageinfoMove.jsp")
					.forward(req, res);
		}else{
			int menu = Integer.parseInt(req.getParameter("menu"));
			List wjjList = new ArrayList();
			String sql = "select * from wenjianjia where uid=? ";
			Object[] params = { userinfo.getUname() };
			DB mydb = new DB();
			try {
				mydb.doPstm(sql, params);
				ResultSet rs = mydb.getRs();
				while (rs.next()) {
					Wenjianjia messageinfo = new Wenjianjia();
					messageinfo.setName(rs.getString("name"));
					messageinfo.setId(rs.getLong("id"));
					messageinfo.setUid(rs.getString("uid"));
					wjjList.add(messageinfo);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			mydb.closed();
			req.setAttribute("wjjList", wjjList);
			req.setAttribute("mid", id);
			req.setAttribute("menu", menu);
			req.getRequestDispatcher("admin/messageinfo/messageinfoMove.jsp")
					.forward(req, res);
		}
		
		
	}

	public void messageinfoMove(HttpServletRequest req, HttpServletResponse res) {
		int mid = Integer.parseInt(req.getParameter("mid"));
		
		int wjjid = Integer.parseInt(req.getParameter("wjjid"));
		Userinfo userinfo = (Userinfo) req.getSession().getAttribute(
		"currentuser");
		
		
		
		
		int oldwjjid = fileService.findOldwjjid(mid, userinfo.getUname());
		fileService.deleteMessageinfo1(oldwjjid, mid);
		fileService.saveMessageinfo1(wjjid, mid);
		req.setAttribute("message", "�����ɹ�");
		
        if(req.getParameter("menu")==null || "".equals(req.getParameter("menu"))){
        	req.setAttribute("path", "messageinfo?type=messageinfoByWenjian&id="+ oldwjjid);
        	
		}else{
			int menu = Integer.parseInt(req.getParameter("menu"));
			req.setAttribute("path", "messageinfo?type=messageinfoList&menu="
					+ menu);
		}

		
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void messageinfoDetail(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Messageinfo messageinfo = new Messageinfo();
		String sql = "select * from messageinfo where id=?";
		Object[] params = { id };
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			messageinfo.setFromu(rs.getString("fromu"));
			messageinfo.setTouser(rs.getString("touser"));
			messageinfo.setFssj(rs.getString("fssj"));
			messageinfo.setTitle(rs.getString("title"));
			messageinfo.setContent(rs.getString("content"));
			messageinfo.setZt(rs.getString("zt"));
			messageinfo.setDshi(rs.getString("dshi"));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("messageinfo", messageinfo);
		req.getRequestDispatcher("admin/messageinfo/messageinfoDetail.jsp")
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
