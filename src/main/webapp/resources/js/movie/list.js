const cart = (movienum, movieAmount) =>{
    fetch(`/cart/${movienum}/${movieAmount}`)
        .then(resp => resp.json())
        .then(result => {
            console.log(result);

            alert("장바구니에 추가되었습니다!");

            if(confirm("장바구니로 이동하시겠습니까?")){
                window.location.href="/cart";
            }
        });
}

const order = (movieNum) => {

    window.location.href=`/orders/orderMovie/${movieNum}`;
};

window.postLogin = type =>{
    const movieNum = document.querySelector(`.action[data-type='${type}']`).dataset.movienum;


    fetch("/nav").then(resp => resp.text())
        .then(result => {
            document.getElementById("nav").innerHTML = result;

            if(type === "cart") {
                cart(movieNum, 1);
            }else if(type === "order"){
                order(movieNum);
            }
        });

};

window.addEventListener("load", () => {

    const btnDelete = document.querySelectorAll(".delete-btn")
    
    
    btnDelete.forEach(el => {
        el.addEventListener("click", e => {
            const {movienum} = e.target.dataset;
        
    
    
            if(confirm(`${movienum}번의 영화를 삭제하시겠습니까?`))
                fetch(`delete/${movienum}`)
                 .then(resp => resp.text())
                 .then(result => {
                    if(result === "OK"){
                     alert("삭제되었습니다.");
                    location.reload();
                  }else
                alert("어떠한 이유로 삭제하지 못하였습니다.");
            });
    
        });
    })

    let pushedBtn = document.querySelector(".genre-btn.pushed");
    
    if(pushedBtn != null){
    pushedBtn.addEventListener("click", e => {
              
        e.target.classList.remove("pushed");

        location.href = "/movie/list";
    })}

    
    document.getElementById("search-btn").addEventListener("click", e => {
        e.preventDefault();

        const form = document.querySelector(".search-form");

        let searchSelect = document.querySelector(".search-form select").value;
        let searchInput = document.querySelector(".search-form input[name='movieKeyword']").value;

        console.log(searchSelect);
        console.log(parseInt(searchInput));


        if(searchSelect === "1"  && isNaN(parseInt(searchInput))){
            alert("영화번호 검색은 숫자만 입력 가능합니다.");

            return;
        }
        
        form.submit();

    });

    document.querySelectorAll(".action").forEach(el => {
        el.addEventListener("click", e => {

            e.preventDefault();

            const { movienum, login, type } = e.target.dataset;



            if(login === "true"){
                if(type === "cart"){
                    cart(movienum, 1);
                }
                else if(type === "order"){
                    order(movienum);
                }
            }
            else{
                alert("로그인이 필요한 서비스입니다.");

                const width = 600;
                const height = 700;
                const left = window.screenX + ((window.screen.width - width) /2);
                const top = window.screenY + ((window.screen.height - height) /2);

                console.log(window.screen.width);
                console.log(window.screen.height);

                window.open(`/login/${type}/popup`, "login_popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);


            }
        });
    });


    document.getElementById("megabox-btn").addEventListener("click",e => {
        fetch("https://www.megabox.co.kr/on/oh/oha/Movie/selectMovieList.do")
            .then(resp => resp.json())
            .then(result => {
                console.log(result);
                let imgPaths = [];
                let movieNames = [];
                let openDates = [];
                let ageRanges = [];
                let movieInfos = [];

                imgPaths.push(result.movieList.map(movie => movie.imgPathNm));
                movieNames.push(result.movieList.map(movie => movie.movieNm));
                openDates.push(result.movieList.map(movie => movie.rfilmDe));
                ageRanges.push(result.movieList.map(movie => movie.admisClassNm));
                movieInfos.push(result.movieList.map(movie => movie.movieSynopCn));


                for(let i = 0; i < imgPaths[0].length && i < movieNames[0].length && i<openDates[0].length; i++){

                    const item = {
                        movieName: movieNames[0][i],
                        movieOpendate: openDates[0][i],
                        imgFilename: "https://img.megabox.co.kr" + imgPaths[0][i],
                        movieAgerange: ageRanges[0][i],
                        movieInfo: movieInfos[0][i],
                    }

                    fetch("/movie/megabox", {
                        method: "POST",
                        headers:{
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify(item),
                    }).then(resp => resp.text())
                        .then(result => {
                            if(result === "OK") {

                            }
                        })
                }

                window.location.reload();
            })
    })


    });





