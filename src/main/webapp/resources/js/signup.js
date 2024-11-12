window.addEventListener("load", e=>{
    document.getElementById("check_btn").addEventListener("click", e =>{

        const custId = document.querySelector("input[name='custId']").value;

        console.log(custId);

        if(!custId){
            alert("아이디를 입력하세요.");

            return;
        }


        fetch(`id_check/${custId}`, {method : "GET"})
        .then(res => res.text())
        .then(result => {
            console.log(result);
            if(result === "OK"){
                alert("사용 가능한 아이디입니다.");
                id_check = true;

            }else{
                alert("이미 사용 중인 아이디입니다.");
            }
        });
    });

    document.querySelector("input[name='custId']").addEventListener("change", e=>{
        id_check = false;
    });

    document.getElementById("signup_btn").addEventListener("click", e=>{
        e.preventDefault();

        signup();
    });


    function signup(){
        const form = document.getElementById("signup")

        if(!form.custId.value){
            alert("모든 입력칸은 필수입니다.");

            return;
        }
        if(!id_check){
            alert("아이디 중복체크를 하세요.");

            return;
        }
        if(!form.custPasswd.value){
            alert("모든 입력칸은 필수입니다.");

            return;
        }

        if(form.custPasswd.value != form.custPasswd_check.value){
            alert("비밀번호 입력칸과 확인 칸에 입력하신 내용이 다릅니다.");

            return;
        }

        if(!form.custName.value){
            alert("모든 입력칸은 필수입니다.");

            return;
        }
        if(!form.custAge.value){
            alert("모든 입력칸은 필수입니다.");
            
            return;
        }
        if(!form.custPhone.value){
            alert("모든 입력칸은 필수입니다.");

            return;
        }

        form.submit();
    }


});