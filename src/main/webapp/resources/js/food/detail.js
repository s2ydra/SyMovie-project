window.addEventListener("load", () => {
    document.getElementById("food-add-btn").addEventListener("click", e => {
        const { foodnum, price } = e.target.dataset;

        console.log(foodnum);

        const foodNum = parseInt(foodnum);
        const priceNumber = parseInt(price);


        const width = 2000;
        const height = 800;
        const left = window.screenX + ((window.screen.width - width) / 2);
        const top = window.screenY + ((window.screen.height - height) / 2);

        const addFoodPop = window.open(`/orders/list-popup`, "orders/list-popup", `left=${left},top = ${top} - 400, width = ${width}, height = ${height}`);

        addFoodPop.onbeforeunload = function (){
            const ordersDetailNum = localStorage.getItem("ordersDetailNum");
            let amount = document.getElementById("food-amount").value;

            let sumPrice = amount * priceNumber;

            fetch(`/orders/hasFood/${ordersDetailNum}`)
                .then(resp => resp.text())
                .then(result => {
                    if(result === "Yes"){
                        alert("이미 먹거리 주문이 되어있는 주문입니다.");
                    }else if (result === "No"){
                        let addFood =  {
                           foodNum: foodNum,
                            amount: amount,
                            sumPrice: sumPrice,
                        }

                        fetch(`/orders/addFood/${ordersDetailNum}`, {
                            method: "POST",
                            body : JSON.stringify(addFood),
                            headers: {'Content-Type':'application/json'}
                        }).then(resp => resp.text())
                            .then(result => {
                                if(result === "OK")
                                    alert("추가되었습니다.");
                            })
                    }
                })
        }

    });
});