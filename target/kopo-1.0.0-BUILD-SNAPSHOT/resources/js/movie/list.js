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

    document.getElementById("agerange-sort").addEventListener("click", e =>{

        sort = true;

        

    }) ;

    let pushedBtn = document.querySelector(".genre-btn.pushed");
    
    if(pushedBtn != null){
    pushedBtn.addEventListener("click", e => {
              
        e.target.classList.remove("pushed");

        location.href = "/movie/list";
    })};

    
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








    });





