package com.service;

import java.sql.ResultSet;

import com.dao.DB;
import com.orm.Messageinfo;

public class fileService
{

	public static void saveMessageinfo(String uname,String filename,int mid)
	{
    	int wjjid = findFileid(uname,filename);
		String sql="insert into wjxinfo(wjjid,mid) values(?,?)";
		Object[] params={wjjid,mid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
    public static void saveMessageinfo1(int wjjid,int mid)
	{
		String sql="insert into wjxinfo(wjjid,mid) values(?,?)";
		Object[] params={wjjid,mid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
    public static void deleteMessageinfo1(int wjjid,int mid)
	{
		String sql=" delete from wjxinfo where wjjid=? and mid=? ";
		Object[] params={wjjid,mid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
    public static void deleteMessageinfo(String uname,String filename,int mid)
	{
    	int wjjid = findFileid(uname,filename);
		String sql=" delete from wjxinfo where wjjid=? and mid=? ";
		Object[] params={wjjid,mid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
    
    
    public static int findFileid(String uname,String filename)
    {
    	int id = 0; 
		String sql="select * from wenjianjia where uid=? and name=? ";
		Object[] params={uname,filename};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				id = rs.getInt("id");
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return id;
    }
    
    public static String getWjjName(int id)
    {
    	String name = ""; 
		String sql="select * from wenjianjia where id=? ";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				name = rs.getString("name");
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return name;
    }
    
    public static int findOldwjjid(int mid,String uid)
    {
    	int id = 0; 
		String sql="select wjjid from wjxinfo a left join  wenjianjia b on a.wjjid = b.id  where mid = ? and b.uid=? ";
		Object[] params={mid,uid};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				id = rs.getInt("wjjid");
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return id;
    }
    
    
    
    public static Messageinfo getMessageinfo(int id){
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
		return messageinfo;
    }
    
}
