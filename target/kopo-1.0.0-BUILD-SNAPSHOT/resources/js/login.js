window.addEventListener("load", () =>{
    document.querySelector(".login-btn").addEventListener("click", e =>{
        e.preventDefault();
        const form = document.getElementById("login-form");
        
        const loginItem = {
        custId : form.custId.value,
        custPasswd : form.custPasswd.value
        };



        if(!loginItem.custId){
            alert("아이디를 입력하세요.");
            return;
        }
    
        if(!loginItem.custPasswd){
            alert("비밀번호를 입력하세요");
            return;
        }


        fetch("/login",{
            method: "POST",
            body: JSON.stringify(loginItem),
            headers: {
            "Content-Type": "application/json; charset=utf-8"
        }
        }).then(resp => resp.text())
        .then(result =>{
            if(result === "OK"){
               

               location.href="/";
            }else{
                alert("아이디 또는 비밀번호가 맞지 않습니다.");
                
                return;
            }
        });

    });
});