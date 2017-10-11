<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
   import="java.util.ArrayList,PO.bookPO,DB.dbBook,
   DB.dbPeople,PO.peoplePO" %>


<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>借书</title>
     <link rel="stylesheet" href="../css/1.css" type="text/css"/ >
	

  </head>
  
 <body class="body">
            <div class="a"><p class="p">图书管理系统</p></div>
		<div class="b">
			<nav>
			<ul>
						
			<li>
				<a >用户信息管理</a>
				<ul>
					<li>
						<a href="LookPeopleAction" >查看用户信息</a>
						
					</li>
					<li>
						<a href="http://127.0.0.1:8080/pzl/people/addPeople.jsp" >添加用户</a>
						
					</li>
					
				</ul>
			</li>
			
			<li>
				<a >图书信息管理</a>
				<ul>
					<li>
						<a href="LookBookAction" >查看图书信息</a>
						
					</li>
					<li>
						<a href="http://127.0.0.1:8080/pzl/book/addBook.jsp" >图书入库</a>
						
					</li>
					
				</ul>
			</li>
			
			<li>
				<a href="LookRecordAction">查看图书借阅记录</a>
				<ul>
					<!--<li>
						<a href="" >借</a>
						
					</li>					
					
				--></ul>
			</li>
					
		</ul>
		</nav>
		</div>
		<div class="c">
		  <center>		  
		  <s:form action="BorrowAction"  method="post">
		  <table  align="center"  class="button">
		      <%
				String id=request.getParameter("id");
				String str=new String(id.getBytes("ISO-8859-1"),"UTF-8");
				dbBook DB=new dbBook();
     	        List list=DB.findInfo("id",str);
				bookPO info=(bookPO)list.get(0);
				 %>
		  
		       <tr>
				   <td>
				借书卡号：<input name="id"  readonly="readonly" class="addpeople"  size="30" value="<%=info.getId()%>" />
				
				   </td>
				</tr>
				
				<tr>
				   <td>
				图片名称：<input name="picture" readonly="readonly" class="addpeople"   size="30" value=<%=info.getPicture() %> />
				   </td>
				</tr>
				
				<tr>
				   <td>
				书名：&nbsp;&nbsp;<input name="name" readonly="readonly" class="addpeople"     size="30" value=<%=info.getName() %> />
				   </td>
				</tr>
				
				<tr>
					<td>		   
				作者:&nbsp;&nbsp;<input name="author" readonly="readonly" class="addpeople"    size="30" value=<%=info.getAuthor()%> />			
				   </td>
				</tr>
				
				<tr>
					<td>		   
				库存数量:&nbsp;&nbsp;<input name="number" readonly="readonly" class="addpeople"    size="30" value=<%=info.getNumber()%> />			
				   </td>
				</tr>				
				<tr>
				<tr>
				   <td>
				位置：&nbsp;&nbsp;<input name="place" readonly="readonly" class="addpeople"   size="30" value=<%=info.getPlace() %>  />
			
				   </td>
				</tr>
				
					<tr>
				   <td>
				价钱：&nbsp;&nbsp;<input name="price" readonly="readonly"  class="addpeople"   size="30" value=<%=info.getPrice() %>  />
			
				   </td>
				</tr>
				
				
				
				
					<td >		   
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择借书卡号：			
				   </td>
				   <td>
				     <select name="pid">
				       <% 
				        dbPeople db=new dbPeople();
				        List list1=db.findAllInfo();
				        
				        if(list1.isEmpty()){
				          %>
				          <option value="null" ></option>				          
				          <% 
				        }else{
				          for(int i=0;i<list1.size();i++){
				             peoplePO pPO=(peoplePO)list1.get(i);
				             
				           %>
				           
				          <option value="<%=pPO.getId()%>"><%=pPO.getId()%></option>
				          
				          <% 
				          }
				        }				        
				       %>
				     
				     </select>
				   </td>
				</tr>
				
				<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;借书数量：<input name="num"  class="addpeople"    size="30"  />
				</td>
				</tr>
				<tr>
				   <td colspan="2" align="center">
					<center><s:submit  value="确定借书"/></center>
					</td>
				</tr>
				
				<tr>  <td>&nbsp;&nbsp;</td></tr>
				<tr>
				    <td align="center">
					&nbsp;&nbsp;<a href="LookBookAction">返回</a>
					</td>
				</tr>
				
		  </table>
		  </s:form>
		  </center>
		</div>
		</body>
</html>
