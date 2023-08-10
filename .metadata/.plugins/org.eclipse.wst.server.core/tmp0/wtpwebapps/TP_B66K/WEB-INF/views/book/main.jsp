<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../resources/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="productBig">
		<div class="productL">
			<img class="productPic" alt="사진없음" src="/resources/img/XL.jpg">
		</div>
		<div>
			<div class="productR">
				<div>
					<span>${bvo.title }</span><br>
					<span>${bvo.author }</span><br>
					<span>서울미디어코믹스(서울문화사) | ${bvo.releaseDate }</span><br>
					<span>평점 ㅡㅡ;</span><br>
					<span>판매가 : </span><span>${bvo.price }</span>
				</div>
				<div>
				<a href=#><button>하트아이콘</button></a>
				<a href="#"><button>장 바 구 ㄴ니</button></a>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
//	const idVal = '<c:out value="${ses.id}" />';
	const idVal = '<c:out value="1234" />';
	
//	const bnoVal = '<c:out value="${bvo.bno}" />';
	const bnoVal = '<c:out value="1" />';
</script>
</body>
</html>