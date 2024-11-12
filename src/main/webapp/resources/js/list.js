window.addEventListener("load", () => {
    document.getElementById("delete-btn").addEventListener("click", e => {
        const movieNum = e.target.dataset.movienum;
        
        if(confirm(movieNum + "번의 영화를 삭제하시겠습니까?"))
            fetch(`delete/${movieNum}`)
             .then(resp => resp.text())
             .then(result => {
                if(result === "OK"){
                 alert("삭제되었습니다.");
                location.reload();
              }else
            alert("어떠한 이유로 삭제하지 못하였습니다.");
        });

        

    });
});