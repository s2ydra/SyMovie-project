let indexMovieNum;
let movieAmount = 1;

window.postLogin = type =>{
    window.location.href= `/orders/orderMovie/${indexMovieNum}`;
};

const order = () => {
    window.location.href= `/orders/orderMovie/${indexMovieNum}`;
}


window.addEventListener("load", () => {
   document.querySelector(".reserve-btn").addEventListener("click", e => {
       e.preventDefault();

       const { movienum, login } = e.target.dataset;

        indexMovieNum = movienum;

       if(login === "true"){
               order();
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
   })

});