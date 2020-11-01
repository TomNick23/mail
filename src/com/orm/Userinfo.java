package com.orm;
public class Userinfo
{
 
	public Userinfo(){
  
	}
	 
	private Long id;
        
         
	private String uname;
        
         
	private String upwd;
        
         
	private String nickname;
        
        
         
	public Long getId(){
		return this.id;
	}
 
	public void setId(Long id){
		this.id = id;
	}
		
         
	public String getUname(){
		return this.uname;
	}
 
	public void setUname(String uname){
		this.uname = uname;
	}
		
         
	public String getUpwd(){
		return this.upwd;
	}
 
	public void setUpwd(String upwd){
		this.upwd = upwd;
	}
		
         
	public String getNickname(){
		return this.nickname;
	}
 
	public void setNickname(String nickname){
		this.nickname = nickname;
	}
		
            
}
