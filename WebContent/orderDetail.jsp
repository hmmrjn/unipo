<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="models.Order,models.Textbook,models.CourseDAO,models.Course,java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.util.Locale,java.util.List"%>
<%
boolean changeDeadlineOver = (boolean) request.getAttribute("changeDeadlineOver"); //変更可能ならtrue
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注文詳細</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<!-- Normalize.css -->
<link rel="stylesheet" href="normalize.css">
<link rel="stylesheet" type="text/css" href="css/orderDetail.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<%
		int orderID = (int) request.getAttribute("orderID");
		boolean canceled = (boolean) request.getAttribute("canceled");
		String[][] textbooks = (String[][]) request.getAttribute("textbooks");
		String[] dateArray = (String[]) request.getAttribute("date");
	%>
	<a class="back" href="OrderHistory">戻る</a>
	<div class="message__top">注文詳細</div>
	<div class="top">
		<div class="order__card">
			<%
				if (canceled) {
			%>
			<font color="red">キャンセルされました。</font>
			<%
				}
			%>
			<span class="order__date">注文日時&nbsp;&nbsp;<span
				class="order__datetime__value"><%=dateArray[0]%></span>
			</span> <span class="order__sum">合計&nbsp;&nbsp;<span class="order__sum__value">¥&nbsp;<%=String.format("%,3d", Integer.parseInt(dateArray[1]))%></span>
			</span>
		</div>
	</div>

	<div class="message__bottom">
		<span class="message__textbook">購入教科書</span> <span
			class="message__datetime">受取日時</span>
	</div>
	<div class="order">
		<div class="order__textbook">
			<%
				for (int i = 0; i < textbooks.length; i++) {
			%>
			<div class="textbook">
				<span class="DOW DOW-<%=textbooks[i][0]%>"><%=textbooks[i][1]%></span>
				<span class="course__name"><%=textbooks[i][2]%></span> <span
					class="textbook__name"><%=textbooks[i][3]%></span>¥<%=String.format("%,3d", Integer.parseInt(textbooks[i][4]))%>
			</div>
			<%
				}
			%>
		</div>

		<div class="order__datetime">
			<div class="date__top L"><%=dateArray[2]%></div>
			<div class="date__middle"><%=dateArray[3]%></div>
			<div class="date__bottom"><%=dateArray[4]%></div>
		</div>
	</div>
	<%
		if (!canceled && !changeDeadlineOver) {
	%>
	<div class="Button">
		<a class="btn order__edit" href="ChangeOrder?id=<%=orderID%>">注文内容変更</a>
		<a class="btn datetime__edit" href="ChangeDatetime?id=<%=orderID%>">受取日時変更</a>
		<a class="btn cancel" value="注文キャンセル確認ダイアログ"
			onClick="cancelAlert()">注文キャンセル</a>
	</div>
	<%
		}
	%>
<script type="text/javascript">
	function cancelAlert(){
		if(window.confirm('本当に注文をキャンセルしますか')){
		location.href="CancelOrder?id=<%=orderID%>";
		}
	}
	</script>
</body>
</html>