package com.orm;
public class Messageinfo
{
 
	public Messageinfo(){
  
	}
	 
	private Long id;
        
         
	private String fromu;
        
         
	private String touser;
        
         
	private String fssj;
        
         
	private String title;
        
         
	private String content;
        
         
	private String zt;
        
         
	private String dshi;
        
        
         
	public Long getId(){
		return this.id;
	}
 
	public void setId(Long id){
		this.id = id;
	}
		
         
	public String getFromu(){
		return this.fromu;
	}
 
	public void setFromu(String fromu){
		this.fromu = fromu;
	}
		
         
	public String getTouser(){
		if(touser==null || touser.equals("")){
			return "Î´ÌîÐ´";
		}
		return this.touser;
	}
 
	public void setTouser(String touser){
		this.touser = touser;
	}
		
         
	public String getFssj(){
		return this.fssj;
	}
 
	public void setFssj(String fssj){
		this.fssj = fssj;
	}
		
         
	public String getTitle(){
		if(title==null || title.equals("")){
			return "ÎÞÖ÷Ìâ";
		}
		return this.title;
	}
 
	public void setTitle(String title){
		this.title = title;
	}
		
         
	public String getContent(){
		return this.content;
	}
 
	public void setContent(String content){
		this.content = content;
	}
		
         
	public String getZt(){
		return this.zt;
	}
 
	public void setZt(String zt){
		this.zt = zt;
	}
		
         
	public String getDshi(){
		return this.dshi;
	}
 
	public void setDshi(String dshi){
		this.dshi = dshi;
	}
		
            
}
