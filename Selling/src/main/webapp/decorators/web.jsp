<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1" style="width: 100%">
		<tr>
			<td colspan="2"><%@ include file="/common/web/header.jsp"%>
			</td>
		</tr>

		<tr>
			<td>
				<div>
					<decorator:head></decorator:head>
					<decorator:body></decorator:body>
				</div>
			</td>
		<tr>
			<td colspan="2"><%@ include file="/common/web/footer.jsp"%>
			</td>
		</tr>
	</table>

</body>
</html>