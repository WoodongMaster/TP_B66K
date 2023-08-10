<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/home.css">
<jsp:include page="./layout/header.jsp"></jsp:include>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>

	<div id="wrap">


		<!-- @@@@ 메인 비디오 @@@@  -->
		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<img src="/resources/img/나의히어로아카데미아_logo.png">
			</div>
			<video id="mainVideo" autoplay loop muted>
				<source src="/resources/img/나의히어로아카데미아.mp4" id="mainMovie">
			</video>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<img src="/resources/img/최애의아이_logo.png">
			</div>
			<video id="mainVideo" autoplay loop muted>
				<source src="/resources/img/최애의아이.mp4" id="mainMovie">
			</video>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<img src="/resources/img/주술회전_logo.png">
			</div>
			<video id="mainVideo" autoplay loop muted>
				<source src="/resources/img/주술회전.mp4" id="mainMovie">
			</video>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<img src="/resources/img/헌터헌터_logo.png">
			</div>
			<video id="mainVideo" autoplay loop muted>
				<source src="/resources/img/헌터헌터.mp4" id="mainMovie">
			</video>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<img src="/resources/img/나루토_logo.png">
			</div>
			<video id="mainVideo" autoplay loop muted>
				<source src="/resources/img/나루토.mp4" id="mainMovie">
			</video>
		</div>
		<a class="slideButton prevButton" onclick="prevSlide()"><i
			class="fa-solid fa-chevron-left" style="color: #cccccc;"></i></a> <a
			class="slideButton nextButton" onclick="nextSlide()"><i
			class="fa-solid fa-chevron-right" style="color: #cccccc;"></i></a> <br>
		<br>


		<!-- @@@@ 신작 슬라이드 @@@@ -->
	
		
		<div class="homeContent">
			<div class="newBook">
				<div class="newBookText">
					<span>2023년 7월 신작</span>
				</div>
				<div class="slideNewBook">
					<i class="fa-solid fa-chevron-left slidePrevBtn"
						onclick="prevNewSlide()"></i>
					<c:forEach items="${monthlylist}" var="bdto">
						<div class="slideBox">
							<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
								class="titlePic" alt="표지가 없어요"
								src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
							<p>${bdto.bvo.title }</p>
						</div>

					</c:forEach>
					<i class="fa-solid fa-chevron-right slideNextBtn"
						onclick="nextNewSlide()"></i>
				</div>
			</div>
			<br> <br> <br>

			<div class="rankArea">
				<div class="rankCover">
					<div class="rankSide">
						<p>RANKING</p>
						<div class="rankCategory">
							<div class="saleAmountRankName">
								<span id="saleAmountRank" onclick="showSalesRank()">판매순</span>
							</div>
							<div class="ratinAvgRankName">
								<span id="ratingAvgRank" onclick="showRatingRank()">평점순</span>
							</div>
							<div class="reviewRankName">
								<span id="reviewRank" onclick="showReviewRank()">리뷰순</span>
							</div>
						</div>
					</div>
					<div class="saleAmountRank">
						<div class="saleAmountContent">
							<c:forEach items="${salelist}" var="bdto">
								<div class="saleAmountBox">
									<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
										class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
									<p>${bdto.bvo.title }</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="ratingAvgRank">
						<div class="ratingAvgContent">
							<c:forEach items="${ratinglist}" var="bdto">
								<div class="ratingAvgBox">
									<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
										class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
									<p>${bdto.bvo.title }</p>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="reviewRank">
						<div class="reviewContent">
							<c:forEach items="${reviewlist}" var="bdto">
								<div class="reviewBox">
									<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
										class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
									<p>${bdto.bvo.title }</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>


		<!-- 	<div class="rankContent">
			<div class="rankName">
				<span onclick="showSalesRank()">판매순</span> | <span
					onclick="showRatingRank()">평점순</span>
			</div> -->
		<!-- 판매순 -->
		<%-- 		<div class="saleAmountRank">
			<div class="saleAmountContent">
				<c:forEach items="${salelist}" var="bdto">
					<div class="saleamountBox">
						<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
							class="titlePic" alt="표지가 없어요"
							src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
						<p>${bdto.bvo.title }</p>
					</div>

				</c:forEach>
			</div>
		</div> --%>
		<br>
		<!-- 평점순  -->
		<%-- <div class="ratingAvgRank">
				<div class="ratingAvgContent" style="width: 800px;">
					<c:forEach items="${ratinglist}" var="bdto">
						<div class="ratingAvgBox">
							<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
								class="titlePic" alt="표지가 없어요"
								src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
							<p>${bdto.bvo.title }</p>
						</div>

					</c:forEach>
				</div>
			</div> --%>
		<br>

		<div class="mainEventPic">
			<img alt="" src="resources/img/메인_이벤트.png"> <img alt=""
				src="resources/img/메인_이벤트.png">
		</div>
	</div>

	<jsp:include page="./layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/home.js"></script>
</body>
</html>