window.addEventListener("load", () => {

    document.querySelector(".coupon-btn").addEventListener("click", e =>{
        
        const couponNum = e.target.dataset.coupon;

        console.log(couponNum);

        fetch(`/coupon/addCoupon/${couponNum}`)
        .then(resp => resp.text())
        .then(result => {
            if(result === "ok"){
                alert(`${couponNum}번 쿠폰 받기 성공!`);
            }
            else if(result === "error") {
                alert("이미 보유하신 쿠폰입니다.");
            }
            else{
                alert("쿠폰 받기 실패");
            }
        });

    })
});