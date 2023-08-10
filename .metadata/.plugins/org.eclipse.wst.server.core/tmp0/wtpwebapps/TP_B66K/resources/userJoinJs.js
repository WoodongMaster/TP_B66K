let idflag = false;
let pwflag = false;
let pwcflag = false;
let emailflag = false;
let emailcflag = false;
let nicknameflag = false;
//let birthflag = false;

let signBtn = document.getElementById('signBtn');

function checkValidity(){
    if(idflag && pwflag && pwcflag && emailflag && emailcflag && nicknameflag){
        signBtn.disabled = false;
        signBtn.style.color = 'red';
        
    }else{
        signBtn.disabled = true;
        signBtn.style.color = '';
    
    }
}

//아이디 중복, 정규식 확인

const id = document.querySelector('#id');
const idMsg = document.querySelector('#idMsg');

id.addEventListener('keyup', function(){
    
    const pattern = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{5,15}$/;
    // 영어 숫자 조합 5~15자리 영문자 최소 한개 포함되어야함

    $.ajax({
        url : "/member/idCheck",
        type : "POST",
        dataType : "JSON",
        data : {"id" : $("#id").val()},
        success : function(data) {

            if(id.value === ''){
                idMsg.innerHTML = `입력한 내용이 없습니다.`;
                idMsg.style.color = 'rgb(86, 83, 83)';
                idflag = false;
            }else {
                if(data == 1){
                    idMsg.innerHTML = `이미 존재하는 아이디입니다.`;
                    idMsg.style.color = 'red';
                    idflag = false;
       
                }else if(!pattern.test(id.value)){
                idMsg.innerHTML = `아이디는 영어, 숫자로 조합된 5~15자리여야 합니다ㅋㅋ.`;
                idMsg.style.color = 'red';
                idflag = false;

            }else if(data == 0 && pattern.test(id.value)){
                idMsg.innerHTML = `올바른 형식입니다.`;
                idflag = true;
                console.log("id flag : "+idflag);
            } 
        }
        }
    })
    checkValidity();
}) 


//비밀번호 정규식

const pw = document.querySelector('#pw');
const pwMsg = document.querySelector('#pwMsg');
const pwCheck = document.querySelector('#pwCheck');
const pwCheckMsg = document.querySelector('#pwCheckMsg');

pw.addEventListener('keyup', function(){

        const pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
        //영문,숫자,특수문자 8-20자리 조합

        if(pw.value === ''){
            pwMsg.innerHTML = `입력한 내용이 없습니다.`;
            pwMsg.style.color = 'red';
            pwflag = false;
        }else{

            if(!pattern.test(pw.value)){
                pwMsg.innerHTML = `영문, 숫자, 특수문자로 조합된 8~20자리여야 합니다.`;
                pwMsg.style.color = 'red';
                pwflag = false;
            }else{
                pwMsg.innerHTML = '올바른형식';
                pwflag = true;
                console.log("pw flag : "+pwflag);
            }
        }checkValidity();

})

pwCheck.addEventListener('keyup', function(){

    if(pwCheck.value === ''){
        pwCheckMsg.innerHTML = `입력한 내용이 없습니다.`;
        pwCheckMsg.style.color = `red`;
        pwcflag = false;
    }else{
        if(pw.value !== pwCheck.value){
            pwCheckMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
            pwCheckMsg.style.color = 'red';
            pwcflag = false;
        }else if(pw.value === pwCheck.value){
            pwCheckMsg.innerHTML = '일치합니다';
            pwcflag = true;
            console.log("pw check flag : "+pwcflag);
        }
    }checkValidity();
})

//닉네임 중복 /정규식

const nickname = document.querySelector('#nickname');
const nicknameMsg = document.querySelector('#nicknameMsg');

nickname.addEventListener('keyup', function(){

    const pattern = /^[가-힣a-zA-Z0-9]{2,20}$/;
    //2-20글자 한글,영어,숫자 

    $.ajax({
        url : "/member/nicknameCheck",
        type : "POST",
        dataType : "JSON",
        data : {"nickname" : $("#nickname").val()},
        success : function(data){
            if(nickname.value === ''){
                nicknameMsg.innerHTML = `입력한 내용이 없습니다.`;
                nicknameMsg.style.color='red';
                nicknameflag = false;
            }else {
                if(data == 1){
                    nicknameMsg.innerHTML = `이미 존재하는 닉네임입니다.`;
                    nicknameMsg.style.color = 'red';
                    nicknameflag = false;

                }else if(!pattern.test(nickname.value)){
                    nicknameMsg.innerHTML = `닉네임은 한글,영문,숫자를 이용한 2~20글자만 사용 가능합니다`;
                    nicknameMsg.style.color = 'red';
                    nicknameflag = false;
                }else if(data == 0 && pattern.test(nickname.value)){
                    nicknameMsg.innerHTML = `올바른 형식입니다.`;
                    nicknameflag = true;
                    console.log("nickname flag : "+nicknameflag);
                }


            }
        }
    })//비동기 끝,,
    checkValidity();

})//nickname keyup function 끝..

//이메일 정규식 , 중복..

const emailInput = document.querySelector('#email');
const emailMsg = document.querySelector('#emailMsg');

emailInput.addEventListener('keyup', function(){
    
    const pattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;

    $.ajax({
        url : "/member/emailCheck",
        type : "POST",
        dataType : "JSON",
        data : {"emailInput" : $("#id").val()},
        success : function(data) {
            
            if(emailInput.value ===''){
                emailMsg.innerHTML = `입력한 내용이 없습니다.`;
                emailMsg.style.color = 'red';
                emailflag = false;
            }else{

                if(data == 1){
                    emailMsg.innerHTML = `이미 존재하는 이메일입니다.`;
                    emailMsg.style.color = 'red';
                    emailflag = false;
                }else if(!pattern.test(emailInput.value)){
                    emailMsg.innerHTML = '이메일 형식이 올바르지 않습니다.';
                    emailMsg.style.color = 'red';
                    emailflag = false;
                }else if(data == 0 && pattern.test(emailInput.value)){
                    emailMsg.innerHTML = "";
                    emailflag = true;
                    console.log("email flag : "+emailflag);
                }
        }checkValidity();
    }
    })
})


//이메일 인증
const emailCheck = document.querySelector('#emailCheckBtn');

emailCheck.addEventListener("click", ()=>{

	console.log("인증번호버튼 눌림");

    const email = emailInput.value;

    const userEmail = {
       email : emailInput.value
    }

    const url = "/member/mailAuthentication";
    fetch(url,{
        method : "POST",
        body : JSON.stringify(userEmail),
        headers : {
            "Content-Type" : "application/json"
        }

    })

    .then((response)=>response.json())
    .then((json) => {

        if(json !== null){
            alert("인증메일이 전송되었습니다.");
            authNum = json;
            console.log("인증번호>>>"+authNum);
            document.querySelector('#AuthNumInput').removeAttribute('disabled');
            
        }else{
            alert("인증메일 전송에 실패했습니다.");
        }
    });

});

function checkAuthNum(){

    const AuthNumInput = document.querySelector('#AuthNumInput').value;
    const emailCheckMsg = document.querySelector('#emailCheckMsg');

    if(AuthNumInput != authNum ){
        emailCheckMsg.innerHTML = `인증번호가 다릅니다.`;
        emailCheckMsg.style.color = 'red';
        emailcflag = false;
        return;
    }else{
        emailCheckMsg.innerHTML = `인증번호가 올바릅니다.`;
        emailCheckMsg.style.color = 'green';
        emailcflag = true;
        console.log(emailcflag);
        return;
       
    }checkValidity();
}

//생년월일 부분

//list for문 돌려서 ...
// const listbox = document.getElementById("listbox");

// for(let year = 1950; year<=2010; year++){
//     let li = document.createElement("li");
//     let button = document.createElement("button");
//     button.type = "button";
//     button.className = "list";
//     button.innerHTML = year;

//     li.appendChild(button);
//     listbox.appendChild(li);
// }

