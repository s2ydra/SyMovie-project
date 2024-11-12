window.addEventListener("load", () => {

    const btnDelete = document.querySelectorAll(".delete-btn")
    
    
    btnDelete.forEach(el => {
        el.addEventListener("click", e => {
            const {custnum} = e.target.dataset;
    
            console.log(custnum);
        
    
            if(confirm(`${custnum}번 고객을 삭제하시겠습니까?`))
                fetch(`delete/${custnum}`)
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

     
});