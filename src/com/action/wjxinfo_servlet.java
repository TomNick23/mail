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
import com.orm.Wjxinfo;

public class wjxinfo_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("wjxinfoAdd"))
		{
			wjxinfoAdd(req, res);
		}
		if(type.endsWith("wjxinfoMana"))
		{
			wjxinfoMana(req, res);
		}
		if(type.endsWith("wjxinfoDel"))
		{
			wjxinfoDel(req, res);
		}
		if(type.endsWith("wjxinfoDetailHou"))
		{
			wjxinfoDetail(req, res);
		}
 
		if(type.endsWith("wjxinfoUpdate"))
		{
			wjxinfoUpdate(req, res);
		}
 
		
	}
	
	
	public void wjxinfoAdd(HttpServletRequest req,HttpServletResponse res)
	{
       int id=req.getParameter("id")==null?0:Integer.parseInt(req.getParameter("id"));


      int wjjid=req.getParameter("wjjid")==null?0:Integer.parseInt(req.getParameter("wjjid"));


      int mid=req.getParameter("mid")==null?0:Integer.parseInt(req.getParameter("mid"));




		String sql="insert into  wjxinfo(wjjid,mid) values(?,?)";
		Object[] params={wjjid,mid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "wjxinfo?type=wjxinfoMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void wjxinfoUpdate(HttpServletRequest req,HttpServletResponse res)
	{	
       int id=Integer.parseInt(req.getParameter("id"));
      int wjjid=Integer.parseInt(req.getParameter("wjjid"));
      int mid=Integer.parseInt(req.getParameter("mid"));
		String sql="update wjxinfo set wjjid=?,mid=? where id=?";
		Object[] params={wjjid,mid,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "wjxinfo?type=wjxinfoMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	
	public void wjxinfoDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="delete from wjxinfo  where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "wjxinfo?type=wjxinfoMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void wjxinfoMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List wjxinfoList=new ArrayList();
		String sql="select * from wjxinfo ";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Wjxinfo wjxinfo=new Wjxinfo();
        	                wjxinfo.setWjjid(rs.getInt("wjjid"));
    	                wjxinfo.setMid(rs.getInt("mid"));
    					wjxinfoList.add(wjxinfo);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("wjxinfoList", wjxinfoList);
		req.getRequestDispatcher("admin/wjxinfo/wjxinfoMana.jsp").forward(req, res);
	}
	
	public void wjxinfoDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		Wjxinfo wjxinfo=new Wjxinfo();
		String sql="select * from wjxinfo where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
        	                wjxinfo.setWjjid(rs.getInt("wjjid"));
    	                wjxinfo.setMid(rs.getInt("mid"));
    				rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("wjxinfo", wjxinfo);
		req.getRequestDispatcher("admin/wjxinfo/wjxinfoDetail.jsp").forward(req, res);
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
