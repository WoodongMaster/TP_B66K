async function RegisterFavoriteList(bno){
	console.log(bno);
	try{
		const resp = await fetch('/favorite/'+bno);
		const result = await resp.json();
		return result;
	}catch(err){
		console.log(err);
	}	
}

document.addEventListener('click', (e) => {
    if(e.target.classList.contains('FavoritBtn')){
        let bno = e.target.dataset.bno;
        console.log(bno);
        RegisterFavoriteList(bno).then(result=>{
            console.log(result);
            if(result>0){
                alert("찜 등록 성공");
            }else{
                alert("이미 찜 목록에 있습니다");
            }
        })
    }
})