window.addEventListener("load", () => {

    const btnDelete = document.querySelectorAll(".delete-btn")
    
    
    btnDelete.forEach(el => {
        el.addEventListener("click", e => {
            e.preventDefault();

            const {foodnum} = e.target.dataset;
    
            console.log(foodnum);
        
    
            if(confirm(`${foodnum}번 먹거리를 삭제하시겠습니까?`))
                fetch(`delete/${foodnum}`)
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


    let pushedBtn = document.querySelector(".type-btn.pushed");
    
    if(pushedBtn != null){
    pushedBtn.addEventListener("click", e => {
              
        e.target.classList.remove("pushed");

        location.href = "/food/list";
    })};

     
});