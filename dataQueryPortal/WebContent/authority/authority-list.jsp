<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="../lib/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript"
	src="../lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/H-ui.js"></script>
<script type="text/javascript" src="../js/H-ui.admin.js"></script>
<%@ include file="../util/easyui.jsp"%>
<script type="text/javascript">
	function formatOper(value,row,index){  
	    return "<a style='text-decoration:none' class='ml-5' onClick='editUser("+index+")' title='编辑' href='javascript:;'><i class='Hui-iconfont'>&#xe6df;</i></a>";  
	}
	/* 编辑权限 */
    function editUser(index){
        $('#table').datagrid('selectRow',index);// 关键在这里  
        var row = $('#table').datagrid('getSelected'); //拿到该行数据
        if (row){ 
	         var role=encodeURI(row.角色);//中文转成ASCII编码
        	layer_show('修改权限','<%=basePath%>account/account_findauthority.action?role='+role,'800','510');
        }  
    }  
    window.onload=find;
	function find() {
		if (true) {
			$('#table').datagrid({
				url : "<%=basePath%>account/account_findAuthorities.action",
				method : "post",//请求方式
				title : "权限管理",//标题
				collapsible : true,//是否可以折叠
				fitColumns : false,//自动适应列宽
				striped : true,//隔行变色
				loadMsg : "客官，店小二正在为您加载中...",//加载时的提示信息
				pagination : true,//分页
				rownumbers : true,//显示序号
				singleSelect : true,//单选，只能选择一行
				columns : [ [{
					field : '角色',
					title : '角色'
				} , {
					field : '角色描述',
					title : '角色描述'
				} , {
					field : '权限',
					title : '权限'
				} , {
					field : 'id',
					title : '操作',
					formatter : formatOper
				} ] ]
			});
			//设置分页控件 
			var pager = $('#table').datagrid('getPager');
			$(pager).pagination({
				pageList : [ 10, 15, 20, 30 ],//可以设置每页记录条数的列表 
				beforePageText : '第',//页数文本框前显示的汉字 
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		}else{
			alert("请完善查询日期");
		}
	
	}
</script>
<title>权限管理</title>
</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>系统管理 <span class="c-gray en">&gt;</span>
	权限管理 <a class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i>刷新</a> </nav>
	<div class="easyui-layout" data-options="fit:true"
		data-options="fit:true,region:'center',border:true">
		<div
			style="width: 1000px; margin-left: auto; margin-right: auto; overflow: hidden;">
			<br><br><br>
			<table id="table" style="height: 550px;">
			</table>
		</div>
	</div>
</body>
</html>