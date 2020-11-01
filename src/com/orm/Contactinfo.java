package com.orm;
public class Contactinfo
{
 
	public Contactinfo(){
  
	}
	 
	private Long id;
        
         
	private String name;
        
         
	private String mailname;
        
         
	private String telphone;
        
         
	private String remark;
        
         
	private Integer uid;
        
        
         
	public Long getId(){
		return this.id;
	}
 
	public void setId(Long id){
		this.id = id;
	}
		
         
	public String getName(){
		return this.name;
	}
 
	public void setName(String name){
		this.name = name;
	}
		
         
	public String getMailname(){
		return this.mailname;
	}
 
	public void setMailname(String mailname){
		this.mailname = mailname;
	}
		
         
	public String getTelphone(){
		return this.telphone;
	}
 
	public void setTelphone(String telphone){
		this.telphone = telphone;
	}
		
         
	public String getRemark(){
		return this.remark;
	}
 
	public void setRemark(String remark){
		this.remark = remark;
	}
		
         
	public Integer getUid(){
		return this.uid;
	}
 
	public void setUid(Integer uid){
		this.uid = uid;
	}
		
            
}
