<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/Orderlist.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="wrap">
		<div class="orderContent">

			<div class="profileNav">

				<div class="profileArea">
					<div class="ProfileImg">
						<img alt="없음" id="${ses.uivo.uuid }"
							src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
							class="userImg">
					</div>
					<div class="userNickName">${ses.uvo.nickname }</div>
				</div>
				<div class="profileNavArea">
					<ul>
						<li><a href="/member/info?${ses.uvo.id }"> <span
								class="material-symbols-outlined userInfo"> person </span> 정보보기
						</a></li>

						<li><a href="/member/modify?${ses.uvo.id }"> <span
								class="material-symbols-outlined userInfoEdit">
									edit_square </span> 정보수정
						</a></li>

						<li><a href="/favorite/list"> <span
								class="material-symbols-outlined userWishList">
									heart_plus </span> 찜목록
						</a></li>
						<li><a href="/bookorder/User_orderlist"> <span
								class="material-symbols-outlined userBookOrder">
									receipt_long </span> 주문목록
						</a></li>
						<li><a href="/member/delete"> <span
								class="material-symbols-outlined userWithdrawal">
									heart_broken </span> 회원탈퇴
						</a></li>
					</ul>
				</div>

			</div>



			<div class="orderListBox">
				<div class="orderListText">
					<p class="listText">주문목록</p>
					<hr class="listLine">
					<div class="userOrderList">
						<table class="table ">
							<thead>
								<tr align="center" style="vertical-align: middle">
									<th scope="col" rowspan="2">주문번호</th>
									<th scope="col" rowspan="2">주문내역</th>
									<th scope="col" rowspan="2">총금액</th>
									<th scope="col" rowspan="2">주문날짜</th>
									<th scope="col" rowspan="2">주문상태</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${ListEmpty_msg eq '0'}">
								주문 내역이 없습니다
							</c:if>
							
							
							<c:if test="${ListEmpty_msg eq '1'}">
								<c:forEach items="${list}" var="bodto">
									<fmt:parseDate var="parsedate" value="${bodto.bovo.orderDate}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="orderdate" value="${parsedate}"
										pattern="yyyy-MM-dd" />
									<tr align="center">
										<th>${bodto.bovo.ono}</th>
										<th><a class="orderListTitle"
											href="/bookorder/orderdetail?ono=${bodto.bovo.ono}"> <span>
													<c:set var="representativeTitle"
														value="${bodto.boidto[0].boivo.title}" />
													${representativeTitle} <c:if
														test="${fn:length(bodto.boidto)>1}">
                        외 ${fn:length(bodto.boidto)-1}건
                  						  </c:if>
											</span>
										</a></th>
										<td>${bodto.bovo.total }원</td>
										<td>${orderdate}</td>
										<td>${bodto.bovo.orderStatus}<input type="hidden"
											class="status" value="${bodto.bovo.orderStatus}">
										</td>
									</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>

					</div>
				</div>
			</div>


		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript">
		const ordercancle_msg = `<c:out value="${ordercancle_msg}"/>`;
		const ordermodify_msg = `<c:out value="${ordermodify_msg}"/>`;
		if (ordercancle_msg == '1') {
			alert("주문이 취소되었습니다");
		}
		if (ordermodify_msg == '1') {
			alert("배송정보가 수정되었습니다");
		}
	</script>
	<%-- <script
			src="/resources/js/OrderList.js?v=<%=System.currentTimeMillis()%>"></script> --%>
</body>
</html>