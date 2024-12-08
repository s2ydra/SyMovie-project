window.addEventListener("load", () => {
   document.getElementById("account-cancel-btn").addEventListener("click", e=> {
       if (confirm("정말로 회원을 탈퇴하시겠습니까? \n (보유하신 쿠폰 또한 함께 사라집니다.)")){
            const { custnum } = e.target.dataset;

           console.log(custnum);

           fetch(`/accountCancel/${custnum}`,{
               method:"DELETE"
           })
               .then(resp => resp.text())
               .then(result => {
                    if(result === "OK"){
                        alert("회원탈퇴가 완료되었습니다.");

                        window.location.href = "/";
                    }
               })


       }else {
           alert("취소")
       }
   }) 
});