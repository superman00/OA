<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
		document.getElementById("fom").action = "PurchaseOrderRegisiterAction!deletePurchaseOrderRegisiter";
		document.getElementById("fom").submit();
	}
</SCRIPT>

<!-- PAGE TITLE & BREADCRUMB-->
<div class="row-fluid">
	<h3 class="page-title">产品信息查看</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a class="ajaxify" href="index.jsp">主页</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">产品信息查看</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">销售合同登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">合同产品登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">收款计划</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">采购订单登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">订单产品登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">付款计划</a></li>
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
		<table>
			<div class="row-fluid">
					<span class="newfont07">选择：<a href="#" class="right-font08" onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a>
					</span> 
					<a href="PurchaseOrderRegisiterAction!deletePurchaseOrderRegisiter" class="btn ajaxify">删除所选采购信息</a>
					<a href="JSP/addPurchaseOrderRegisiter.jsp" class="btn ajaxify">添加采购信息</a>
			</div>
			<div class="row-fluid">
				<div class="row-fluid" style="text-align: center;font-size:20px;background-color:#EEEEEE">
						采购订单详细列表 
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th >选择</th>
							<th >采购编号</th>
							<th >订单名称</th>
							<th >订单编码</th>
							<th >订单类别</th>
							<th >供应商</th>
							<th >创建人</th>
							<th >创建时间</th>
							<th >当前状态</th>
							<th >合同总价</th>
							<th >已付费用</th>
							<th >尚付费用</th>
							<th >是否交付</th>
							<th >操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator var="PurchaseOrderRegisiter" value="#request.purchaseOrderRegisiterList">
							<tr>
								<td ><input type="checkbox" name="delid" value="${PurchaseOrderRegisiter.id }" /></td>
								<td ><a class="ajaxify" href="PurchaseOrderRegisiterAction!edit?purchaseOrderRegisiter.id=${PurchaseOrderRegisiter.id }">${PurchaseOrderRegisiter.id}</a></td>
								<td ><a class="ajaxify" href="PurchaseOrderRegisiterAction!edit?purchaseOrderRegisiter.id=${PurchaseOrderRegisiter.id}">${PurchaseOrderRegisiter.orderName}</a></td>
								<td >${PurchaseOrderRegisiter.orderCode }</td>
								<td >${PurchaseOrderRegisiter.orderType }</td>
								<td >${PurchaseOrderRegisiter.provider }</td>
								<td >${PurchaseOrderRegisiter.enterPerson }</td>
								<td >${PurchaseOrderRegisiter.enterDate }</td>
								<td >${PurchaseOrderRegisiter.currentState }</td>
								<td >${PurchaseOrderRegisiter.tatalPrice }</td>
								<td >${PurchaseOrderRegisiter.paidPrice }</td>
								<td >${PurchaseOrderRegisiter.loanPrice }</td>
								<td >${PurchaseOrderRegisiter.isPaid }</td>
								<td ><a class="ajaxify" href="PurchaseOrderRegisiterAction!edit?purchaseOrderRegisiter.id=${PurchaseOrderRegisiter.id}">编辑(修改)</a><a href="PurchaseOrderRegisiterAction!deletePurchaseOrderRegisiter?delid=${PurchaseOrderRegisiter.id }">删除</a></td>
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
						<li class="active"><a class="ajaxify" href="PurchaseOrderRegisiterAction!PurchaseOrderRegisiterList?index=1">首页</a></li>
						<s:if test='(#request.currentIndex) > 1'> 
							<li class="active"><a class="ajaxify" href="PurchaseOrderRegisiterAction!PurchaseOrderRegisiterList?index=${requestScope.currentIndex-1}">上页</a></li>
						</s:if>
						<s:else>
						<li class="disabled"><a href="javascript:;">上页</a></li>
						</s:else>
						
						<s:if test='(#request.currentIndex) < #pageCount'> 
							<li class="active"><a class="ajaxify" href="PurchaseOrderRegisiterAction!PurchaseOrderRegisiterList?index=${requestScope.currentIndex+1}">下页</a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:;">下页</a></li>
						</s:else>
					 	<li class="active"><a class="ajaxify" href="PurchaseOrderRegisiterAction!PurchaseOrderRegisiterList?index=${pageCount }">末页</a></li>
					  </ul>
				</div>
			</div>
		</table>
	</form>
</div>

<script src="js/myAjaxify.js" type="text/javascript"></script>