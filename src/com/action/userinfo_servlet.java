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

public class userinfo_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("userinfoAdd"))
		{
			userinfoAdd(req, res);
		}
		if(type.endsWith("userinfoMana"))
		{
			userinfoMana(req, res);
		}
		if(type.endsWith("userinfoDel"))
		{
			userinfoDel(req, res);
		}
		if(type.endsWith("userinfoDetailHou"))
		{
			userinfoDetail(req, res);
		}
 
		if(type.endsWith("userinfoUpdate"))
		{
			userinfoUpdate(req, res);
		}
 
		
	}
	
	
	public void userinfoAdd(HttpServletRequest req,HttpServletResponse res)
	{
       int id=req.getParameter("id")==null?0:Integer.parseInt(req.getParameter("id"));


      String uname=req.getParameter("uname");


      String upwd=req.getParameter("upwd");


      String nickname=req.getParameter("nickname");




		String sql="insert into  userinfo(uname,upwd,nickname) values(?,?,?)";
		Object[] params={uname,upwd,nickname};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "userinfo?type=userinfoMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void userinfoUpdate(HttpServletRequest req,HttpServletResponse res)
	{	
       int id=Integer.parseInt(req.getParameter("id"));
      String uname=req.getParameter("uname");
      String upwd=req.getParameter("upwd");
      String nickname=req.getParameter("nickname");
		String sql="update userinfo set uname=?,upwd=?,nickname=? where id=?";
		Object[] params={uname,upwd,nickname,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "userinfo?type=userinfoMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	
	public void userinfoDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="delete from userinfo  where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "userinfo?type=userinfoMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void userinfoMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userinfoList=new ArrayList();
		String sql="select * from userinfo ";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Userinfo userinfo=new Userinfo();
        	            userinfo.setUname(rs.getString("uname"));
        	            userinfo.setUpwd(rs.getString("upwd"));
        	            userinfo.setNickname(rs.getString("nickname"));
        					userinfoList.add(userinfo);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("userinfoList", userinfoList);
		req.getRequestDispatcher("admin/userinfo/userinfoMana.jsp").forward(req, res);
	}
	
	public void userinfoDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		Userinfo userinfo=new Userinfo();
		String sql="select * from userinfo where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
        	            userinfo.setUname(rs.getString("uname"));
        	            userinfo.setUpwd(rs.getString("upwd"));
        	            userinfo.setNickname(rs.getString("nickname"));
        				rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("userinfo", userinfo);
		req.getRequestDispatcher("admin/userinfo/userinfoDetail.jsp").forward(req, res);
	}
	
	 
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}

}
