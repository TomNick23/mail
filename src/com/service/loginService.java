package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.DB;
import com.orm.Userinfo;

public class loginService
{
	public String login(String userName,String userPw)
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		String result="no";
		String sql="select * from userinfo where uname=? and upwd=?";
		Object[] params={userName,userPw};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		try 
		{
			ResultSet rs=mydb.getRs();
			boolean mark=(rs==null||!rs.next()?false:true);
			if(mark==false)
			{
				 result="no";
			}
			else
			{
				 result="yes";
				 Userinfo userinfo=new Userinfo();
				 userinfo.setId(rs.getLong("id"));
				 userinfo.setUname(rs.getString("uname"));
				 userinfo.setUpwd(rs.getString("upwd"));
				 userinfo.setNickname(rs.getString("nickname"));
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
	             session.setAttribute("currentuser", userinfo);
			}
			rs.close();
		} 
		catch (SQLException e)
		{
			System.out.println("µÇÂ¼Ê§°Ü£¡");
			e.printStackTrace();
		}
		finally
		{
			mydb.closed();
		}
		 
 
		return result;
	}

   
    
    
    
    
    public String register(String uname,String upwd,String nickname)
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		String result="no";
		uname = uname + "@cc.com";
		int co = checkuname(uname);
		if(co>0){
			result = "yes"; //ÒÑ×¢²á
		}else{
			String sql="insert into userinfo(uname,upwd,nickname) values(?,?,?)";
			Object[] params={uname,upwd,nickname};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			
			initFile(uname,"ÊÕ¼þÏä");
			initFile(uname,"·¢¼þÏä");
			initFile(uname,"²Ý¸åÏä");
			initFile(uname,"ÒÑÉ¾³ý");
		}
		return result;
	}
 
    public static int checkuname(String uname)
	{
    	int flag = 0;
		String sql="select count(0) co from userinfo where uname=?";
		Object[] params={uname};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				flag = rs.getInt("co");				 
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return flag;
	}
    
    public void initFile(String uname,String filename)
	{
		String sql="insert into wenjianjia(uid,name) values(?,?)";
		Object[] params={uname,filename};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
    
}
