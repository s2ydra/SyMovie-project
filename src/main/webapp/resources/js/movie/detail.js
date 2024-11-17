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

const order = () => {
    const form = document.getElementById("order-form");

    form.submit();
};


window.postLogin = type =>{
    const movieAmount = document.querySelector("input[name='movieAmount']").value;
    const movieNum = document.querySelector(`.action[data-type='${type}']`).dataset.movienum;

    

    fetch("/nav").then(resp => resp.text())
    .then(result => {
        document.getElementById("nav").innerHTML = result;

        if(type === "cart") {
            cart(movieNum, movieAmount);
        }else if(type === "order"){
            order();
        }
    });
    
};

window.addEventListener("load", () => {
    
    document.querySelector("input[name='movieAmount']").addEventListener("change", e=>{
        let chageAmount = e.target.value;
        const moviePrice = document.getElementById("moviePrice").textContent;

        console.log(chageAmount);

        document.getElementById("sum-price").textContent = (chageAmount * moviePrice);


    });

    document.querySelectorAll(".action").forEach(el => {
        el.addEventListener("click", e => {

            e.preventDefault();

            const amount = document.querySelector("input[name = 'movieAmount']").value;
            const { movienum, login, type } = e.target.dataset;

            alert("로그인이 필요한 서비스입니다.");

            if(login === "true"){ 
                if(type === "cart"){
                    cart(movienum, amount);
                }
                else if(type === "order"){
                    order();
                }
            }
            else{
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


});