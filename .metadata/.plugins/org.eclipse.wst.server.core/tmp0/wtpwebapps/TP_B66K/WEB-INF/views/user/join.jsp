<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/user_join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>


<form action="/member/signup" method="post">

아이디 : <input type="text" id="id" name="id" placeholder= "아이디를 입력해주세요."> <br>
<p id="idMsg">아이디는 영문, 숫자로 조합된 5~15자리여야 합니다.</p>

비밀번호 : <input type="text" id="pw" name="pw" placeholder= "비밀번호를 입력해주세요."> <br>
<!-- 비번 사용 가능/불가능 여부  -->
<p id="pwMsg">비밀번호는 영문, 숫자, 특수문자로 조합된 8~20자리여야 합니다. </p>
<br>

비밀번호 재입력 : <input type="text" id="pwCheck" placeholder = "비밀번호를 재입력해주세요."> <br>
<!-- 비밀번호 일치 여부  -->
<p id="pwCheckMsg"></p>


이메일 : <input type="text" id="email" name="email" placeholder = "이메일을 입력해주세요."> <button type="button" id="emailCheckBtn">이메일인증</button> <br>
<p id="emailMsg"></p>
<!--이메일 인증 여부  -->

인증번호 : <input type="text" maxlength="7" onkeyup="checkAuthNum()" id="AuthNumInput" disabled="disabled" placeholder="인증번호를 입력하세요.">
<p id="emailCheckMsg"></p>

닉네임 : <input type="text" id="nickname" name="nickname" placeholder = "닉네임을 입력해주세요."> <br>
<!--사용가능한 닉네임 여부  -->
<p id="nicknameMsg"></p>

생년월일 : <input type="text" name="birth" placeholder = "생년월일을 입력해주세요.">

<!-- 생년월일 : <button class="selectbox" onclick="toggleListbox(event)">년도<span class="material-symbols-outlined">
stat_1</span></button>
		<ul class="listbox" id="listbox" size="5" >
		   <li><button type="button" class="list">1950</button></li>
		   <li><button type="button" class="list">1951</button></li>
		</ul>  -->
		


<button type="submit" id="signBtn" disabled="disabled">회원가입</button>

</form>

<script type="text/javascript" src="/resources/userJoinJs.js"></script>


</body>
</html>