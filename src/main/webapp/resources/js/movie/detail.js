const cart = (movienum, movieAmount) =>{
    fetch(`/cart/${movienum}/${movieAmount}`)
    .then(resp => resp.json())
    .then(result => {console.log(result);});
}

const buy = (movienum, movieAmount) => {
    fetch(`/orders/${movienum}/${movieAmount}`)
        .then(resp => resp.text())
        .then(result => {console.log(result);});
};


window.postLogin = type =>{
    const movieAmount = document.querySelector("input[name='movieAmount']").value;
    const movieNum = document.querySelector(`.action[data-type='${type}']`).dataset.movienum;

    

    fetch("/nav").then(resp => resp.text())
    .then(result => {
        document.getElementById("nav").innerHTML = result;

        cart(movieNum, movieAmount);
    });

    alert("로그인 완료");

    
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

            const amount = document.querySelector("input[name = 'movieAmount']").value;
            const { movienum, login, type } = e.target.dataset;

            alert(` ${amount} + ${movienum} + ${login} + ${type}`);

            if(login === "true"){ 
                if(type === "cart"){
                    cart(movienum, amount);
                }else if(type === "buy"){
                    buy(movienum, amount);
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