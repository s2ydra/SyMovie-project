window.addEventListener("load", () => {
    let cancelBtns = document.querySelectorAll(".cancel-btn");

    cancelBtns.forEach(el => {
        el.addEventListener("click", e=> {
            const { ordersdetailnum } = e.target.dataset;

            if(confirm(`${ordersdetailnum}번 예매내용을 취소하시겠습니까?`)){
                fetch(`delete/${ordersdetailnum}`, {
                    method:"DELETE"
                }).then(resp => resp.text())
                    .then(result => {
                        if(result === "OK") {
                            alert("삭제 완료 되었습니다.");

                            window.location.reload();
                        }else {
                            alert("어떠한 이유로 삭제가 되지 않았습니다.");
                        }
                    })
            }

        });
    });

});