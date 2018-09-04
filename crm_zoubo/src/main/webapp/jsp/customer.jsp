<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>客户列表-BootCRM</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var curPage = ${page.currPage};
		$("#pageDiv ul li:eq(" + curPage + ")").addClass("active");
		//对上一页和下一次做一个特别处理
		if(curPage==1){
			$("#pageDiv ul li").first().addClass("disabled");
		}
		if(curPage==${page.totalPage } ){
			$("#pageDiv ul li").last().addClass("disabled");
		}
	})
</script>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">BOOT客户管理系统 v2.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links --> <!-- /.navbar-static-side --> </nav>

		<div style="padding: 12px;">
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline"
						action="${pageContext.request.contextPath }/customer/list"
						method="get">
						<div class="form-group">
							<label for="customerName">客户名称</label> <input type="text"
								class="form-control" id="customerName"
								value="${queryVo.custName }" name="custName">
						</div>
						<div class="form-group">
							<label for="customerFrom">客户来源</label> <select
								class="form-control" id="customerFrom" placeholder="客户来源"
								name="custSource">
								<option value="">--请选择--</option>
								<c:forEach items="${sourceType}" var="item">
									<c:choose>
										<c:when test="${queryVo.custSource== item.dict_id}">
											<option value="${item.dict_id}" selected="selected">${item.dict_item_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${item.dict_id}">${item.dict_item_name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custIndustry">所属行业</label> <select
								class="form-control" id="custIndustry" name="custIndustry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<c:choose>
										<c:when test="${queryVo.custIndustry== item.dict_id}">
											<option value="${item.dict_id}" selected="selected">${item.dict_item_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${item.dict_id}">${item.dict_item_name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custLevel">客户级别</label> <select class="form-control"
								id="custLevel" name="custLevel">
								<option value="">--请选择--</option>
								<c:forEach items="${level}" var="item">
									<c:choose>
										<c:when test="${queryVo.custLevel== item.dict_id}">
											<option value="${item.dict_id}" selected="selected">${item.dict_item_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${item.dict_id}">${item.dict_item_name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">客户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>客户名称</th>
									<th>客户来源</th>
									<th>客户所属行业</th>
									<th>客户级别</th>
									<th>固定电话</th>
									<th>手机</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.list}" var="l">
									<tr>
										<td>${l.cust_id}</td>
										<td>${l.cust_name}</td>
										<td>${l.cust_source_info}</td>
										<td>${l.cust_industry_info}</td>
										<td>${l.cust_level_info}</td>
										<td>${l.cust_phone}</td>
										<td>${l.cust_mobile}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#customerEditDialog"
											onclick="editCustomer(${l.cust_id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteCustomer(${l.cust_id})">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-center" id="pageDiv">
							<nav>
							<ul class="pagination">
								<li><c:if test="${page.currPage!=1 }">
										<a
											href="${pageContext.request.contextPath }/customer/list?currPage=${page.currPage-1}">上一页</a>
									</c:if> <c:if test="${page.currPage==1 }">
										<a>上一页</a>
									</c:if></li>
								<c:forEach begin="1" end="${page.totalPage }" var="i">
									<li><a
										href="${pageContext.request.contextPath }/customer/list?currPage=${i}">${i}</a>
									</li>
								</c:forEach>
								<li><c:if test="${page.currPage!=page.totalPage }">
										<a
											href="${pageContext.request.contextPath }/customer/list?currPage=${page.currPage+1}">下一页</a>
									</c:if> <c:if test="${page.currPage==page.totalPage }">
										<a>下一页</a>
									</c:if></li>
							</ul>
							</nav>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id" />
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName"
									placeholder="客户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom"
								style="float: left; padding: 7px 15px 0 27px;">客户来源</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_customerFrom"
									placeholder="客户来源" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${sourceType}" var="item">
										<option value="${item.dict_id}">${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry"
								style="float: left; padding: 7px 15px 0 27px;">所属行业</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_custIndustry"
									name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.dict_id}">${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel"
								style="float: left; padding: 7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_custLevel"
									name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${level}" var="item">
										<option value="${item.dict_id}">${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan"
									placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone"
									placeholder="固定电话" name="cust_phone">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_mobile"
									placeholder="移动电话" name="cust_mobile">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_zipcode"
									placeholder="邮政编码" name="cust_zipcode">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address"
									placeholder="联系地址" name="cust_address">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<script type="text/javascript">
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/edit",
				data:{"id":id},
				dataType:"json",
				success:function(data) {
					$("#edit_cust_id").val(data.cust_id);
					$("#edit_customerName").val(data.cust_name);
					$("#edit_customerFrom").val(data.cust_source)
					$("#edit_custIndustry").val(data.cust_industry)
					$("#edit_custLevel").val(data.cust_level)
					$("#edit_linkMan").val(data.cust_linkman);
					$("#edit_phone").val(data.cust_phone);
					$("#edit_mobile").val(data.cust_mobile);
					$("#edit_zipcode").val(data.cust_zipcode);
					$("#edit_address").val(data.cust_address);
				}
			});
		}
		function updateCustomer() {
			$.ajax({
				type:"post",
				url:"<%=basePath%>customer/update",
				data:$("#edit_customer_form").serialize(),
				success:function(data) {
					alert(data);
					window.location.reload();
				}
			});
		}
		
		function deleteCustomer(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("<%=basePath%>customer/delete",{"id":id},function(data){
					alert(data);
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
