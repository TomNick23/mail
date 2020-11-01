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
import com.orm.Fujian;

public class fujian_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("fujianAdd"))
		{
			fujianAdd(req, res);
		}
		if(type.endsWith("fujianMana"))
		{
			fujianMana(req, res);
		}
		if(type.endsWith("fujianDel"))
		{
			fujianDel(req, res);
		}
		if(type.endsWith("fujianDetailHou"))
		{
			fujianDetail(req, res);
		}
 
		if(type.endsWith("fujianUpdate"))
		{
			fujianUpdate(req, res);
		}
 
		
	}
	
	
	public void fujianAdd(HttpServletRequest req,HttpServletResponse res)
	{
       int id=req.getParameter("id")==null?0:Integer.parseInt(req.getParameter("id"));


      int mid=req.getParameter("mid")==null?0:Integer.parseInt(req.getParameter("mid"));


      String fjname=req.getParameter("fjname");


      String fjurl=req.getParameter("fjurl");




		String sql="insert into  fujian(mid,fjname,fjurl) values(?,?,?)";
		Object[] params={mid,fjname,fjurl};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "fujian?type=fujianMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void fujianUpdate(HttpServletRequest req,HttpServletResponse res)
	{	
       int id=Integer.parseInt(req.getParameter("id"));
      int mid=Integer.parseInt(req.getParameter("mid"));
      String fjname=req.getParameter("fjname");
      String fjurl=req.getParameter("fjurl");
		String sql="update fujian set mid=?,fjname=?,fjurl=? where id=?";
		Object[] params={mid,fjname,fjurl,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "fujian?type=fujianMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	
	public void fujianDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="delete from fujian  where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "fujian?type=fujianMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void fujianMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List fujianList=new ArrayList();
		String sql="select * from fujian ";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Fujian fujian=new Fujian();
        	                fujian.setMid(rs.getInt("mid"));
    	            fujian.setFjname(rs.getString("fjname"));
        	            fujian.setFjurl(rs.getString("fjurl"));
        					fujianList.add(fujian);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("fujianList", fujianList);
		req.getRequestDispatcher("admin/fujian/fujianMana.jsp").forward(req, res);
	}
	
	public void fujianDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		Fujian fujian=new Fujian();
		String sql="select * from fujian where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
        	                fujian.setMid(rs.getInt("mid"));
    	            fujian.setFjname(rs.getString("fjname"));
        	            fujian.setFjurl(rs.getString("fjurl"));
        				rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("fujian", fujian);
		req.getRequestDispatcher("admin/fujian/fujianDetail.jsp").forward(req, res);
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
