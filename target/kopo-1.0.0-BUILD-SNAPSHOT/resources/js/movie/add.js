window.addEventListener("load", () => {
    const form = document.getElementById("add-box");

    document.querySelector(".add-btn").addEventListener("click", e =>{
        if(!form.movieName.value){
            alert("영화제목을 입력하세요.");
            
            return;
        }
    
        if(!form.movieGenre.value){
            alert("영화장르를 입력하세요.");
    
            return;
        }
        if(!form.movieDirector.value){
            alert("감독칸을 입력하세요.");
    
            return;
        }
        if(!form.movieOpendate.value){
            alert("개봉일을 선택하세요.");
    
            return;
        }
        if(!form.movieAgerange.value){
            alert("연령대를 입력하세요.");
    
            return;
        }
        if(!form.movieCountry.value){
            alert("제작국가를 입력하세요.");
    
            return;
        }
        if(!form.moviePrice.value){
            alert("가격을 입력하세요.");
    
            return;
        }

        form.submit();
    });

});