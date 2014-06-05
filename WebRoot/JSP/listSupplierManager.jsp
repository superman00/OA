<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
out.println(basePath);
%>

<!-- <link href="css/Mystyle.css" rel="stylesheet" type="text/css" > -->
<SCRIPT language=JavaScript>
	
	function selectAll() {
		var obj = document.fom.elements;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				obj[i].checked = true;
			}
		}
	}

	function unselectAll() {
		var obj = document.fom.elements;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}

	function link() {
		document.getElementById("fom").action = "JSP/yuangong.jsp";
		document.getElementById("fom").submit();
	}

	function deleteChose() {
		document.getElementById("fom").action = "SupplierManagerAction!deletesupplierManager";
		document.getElementById("fom").submit();
	}
</SCRIPT>

<!-- PAGE TITLE & BREADCRUMB-->
<div class="row-fluid">
	<h3 class="page-title">供应商管理</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a class="ajaxify" href="index.jsp">主页</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">供应商管理</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">供应商联系人</a></li>
	</ul>
</div>



<div class='row-fluid'> 
	<select name="select2">
		<option>
			按录入时间
		</option>
		<option>
			按注销时间
		</option>
	</select>

	<input name="textfield" type="text" readonly="readonly" />
	<span>至</span>
	<input name="textfield" type="text" readonly="readonly" />
	<input class="btn" name="Submit" type="button" value="查 询" style='margin-bottom: 10px;'/>
	<input name="Submit" class="btn" type="button" value="高级搜索" style='margin-bottom: 10px;'/>
</div>

<div class="row-fluid">
	<form>
		<table class="table table-striped">
			<div class="row-fluid">
					<span class="newfont07">选择：<a href="#"  onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a>
				</span> 
				<input name="Submit" class="btn" type="button"  value="删除所选信息" onclick="deleteChose();" /> 
				<a class="btn ajaxify" href="JSP/addSupplierManager.jsp" >添加供应商信息</a> 
			</div>
			
			<div class="row-fluid">
				<div class="row-fluid" style="text-align: center;font-size:20px;background-color:#EEEEEE">
							供应商详细列表 
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th >选择</th>
							<th >编号</th>
							<th >供应商名称</th>
							<th>供应商编码</th>
							<th >简称</th>
							<th >电话</th>
							<th>手机号码</th>
							<th >地区</th>
							<th >操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator var="supplierManager" value="#request.SupplierManagerList">
						<tr>
							<td ><input type="checkbox" name="delid" value="${supplierManager.id }" /></td>
							<td ><a class="ajaxify" href="SupplierManagerAction!edit?supplierManager.id=${supplierManager.id }">${supplierManager.id}</a></td>
							<td><a class="ajaxify" href="SupplierManagerAction!edit?supplierManager.id=${supplierManager.id}">${supplierManager.supplierName}</a></td>
							<td>${supplierManager.supplierCode }</td>
							<td>${supplierManager.shortName }</td>
							<td>${supplierManager.telephone }</td>
							<td >${supplierManager.phone }</td>
							<td >${supplierManager.address }</td>
							<td ><a class="ajaxify" href="SupplierManagerAction!edit?supplierManager.id=${supplierManager.id}">编辑(修改)</a><a href="SupplierManagerAction!deletesupplierManager?delid=${supplierManager.id }">删除</a></td>
						</tr>
					</s:iterator>
					</tbody>
				</table>	
			</div>
			<div class="row-fluid">
					<s:set var="pageCount" value="(#request.totalSize-1)/10+1" />
					<div class="span4" style="margin: 20px 0px 20px 0px;">
						共
						<span >${requestScope.pageCount}</span>
						页 | 第
						<span >${requestScope.currentIndex}</span> 页
					</div>
					<div class="pagination pull-right">
						  <ul>
							<li class="active"><a class="ajaxify" href="SupplierManagerAction!SupplierManagerList?index=1">首页</a></li>
							<s:if test='(#request.currentIndex) > 1'> 
								<li class="active"><a class="ajaxify" href="SupplierManagerAction!SupplierManagerList?index=${requestScope.currentIndex-1}">上页</a></li>
							</s:if>
							<s:else>
							<li class="disabled"><a href="javascript:;">上页</a></li>
							</s:else>
							
							<s:if test='(#request.currentIndex) < #pageCount'> 
								<li class="active"><a class="ajaxify" href="SupplierManagerAction!SupplierManagerList?index=${requestScope.currentIndex+1}">下页</a></li>
							</s:if>
							<s:else>
								<li class="disabled"><a href="javascript:;">下页</a></li>
							</s:else>
						 	<li class="active"><a class="ajaxify" href="SupplierManagerAction!SupplierManagerList?index=${pageCount }">末页</a></li>
						  </ul>
					</div>
				</div>
			</table>
	</form>
</div>

 <script src="js/myAjaxify.js" type="text/javascript"></script>