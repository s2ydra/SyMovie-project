window.addEventListener("load", () => {

    document.querySelector(".coupon-btn").addEventListener("click", e =>{
        
        const couponNum = e.target.dataset.coupon;

        console.log(couponNum);

        fetch(`/coupon/addCoupon/${couponNum}`)
        .then(resp => resp.text())
        .then(result => {
            if(result === "ok")
            alert(`${couponNum}번 쿠폰 받기 성공!`);
            else
                alert("쿠폰 받기 실패");
        });

    })
});