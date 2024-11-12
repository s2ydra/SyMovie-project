window.addEventListener("load", () => {
    document.querySelectorAll(".delete-btn").forEach(el => {
        el.addEventListener("click", e => {
            const { movienum, moviename } = e.target.dataset;

            if (confirm(`${moviename}를 장바구니에서 삭제하시겠습니까?`)) {

                fetch(`/cart/${movienum}`, {
                    method: "DELETE"
                }).then(resp => {
                    if (resp.ok) {

                        const button = document.querySelector(`button.delete-btn[data-movienum='${movienum}']`);
                        button.closest("tr").remove();

                    }
                });
            }
        });

    });
});