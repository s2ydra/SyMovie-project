let indexMovieNum;
let movieAmount = 1;

window.postLogin = type =>{
    window.location.href= `/orders/orderMovie/${indexMovieNum}`;
};

const order = (indexMovieNum) => {
    window.location.href= `/orders/orderMovie/${indexMovieNum}`;
}


window.addEventListener("load", () => {
        let orderBtn = document.querySelectorAll(".reserve-btn");

            orderBtn.forEach(btn => {
                btn.addEventListener("click", e => {
                    e.preventDefault();

                    const { movienum, login } = e.target.dataset;

                    indexMovieNum = movienum;

                    if(login === "true"){
                        order(indexMovieNum);
                    }
                    else{
                        alert("로그인이 필요한 서비스입니다.");

                        const width = 600;
                        const height = 700;
                        const left = window.screenX + ((window.screen.width - width) /2);
                        const top = window.screenY + ((window.screen.height - height) /2);

                        console.log(window.screen.width);
                        console.log(window.screen.height);

                        window.open(`/login/order/popup`, "login_popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);


                    }
            });

   });
            document.getElementById("movie-search-btn").addEventListener("click", e=>{
                e.preventDefault();

                let movieSelect = document.querySelector(".movie-select-box");
                const movieKeyword = document.querySelector(".movie-input-box")
                const form = document.getElementById("movie-search-form");

                console.log(isNaN(parseInt(movieKeyword.value)));
                console.log(movieSelect.value)

                if(movieSelect.value === "1" && isNaN(parseInt(movieKeyword.value))){
                    alert("영화번호 검색은 숫자 입력만 가능합니다.");
                }else{
                    form.submit();
                }

            })

});