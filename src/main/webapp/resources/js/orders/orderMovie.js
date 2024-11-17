const checkNum = JSON.parse(sessionStorage.getItem("checkedItem"));
let isChanged = false;

window.addEventListener("load" , () => {
    let moviePrice = parseInt(document.querySelector(".movie-price").textContent);
    let movieAmount = document.querySelector("input[name='movieAmount']").value;
    const hasFood =  document.getElementById("food-table-box").classList;
    let changedAmount = 0;
    let allSumPrice = document.getElementById("all-sumPrice");

    console.log(hasFood.contains("hide"));

    if(hasFood.contains("hide")){
        document.getElementById("finalPrice").textContent = moviePrice * movieAmount;
        allSumPrice.value = moviePrice * movieAmount;
    }

    let foodNums = document.querySelectorAll(".food-number");
    let foodRow = document.querySelectorAll(".food-row");
    let rowPrice = 0;
    let changedSelect = 0;
    let isChangeSelect = false;
    let foodAllPrice = 0;
    let foodSumPrice = document.getElementById("foodFinalPrice");


    foodRow.forEach(tr => {
        if(!isChangeSelect) {
            rowPrice = tr.querySelector("td:nth-child(3)").textContent * tr.querySelector("td:nth-child(4)").querySelector("input[type='number']").value;
        }else{
            rowPrice = tr.querySelector("td:nth-child(3)").textContent * changedSelect;
        }
        tr.querySelector("td:nth-child(5)").textContent = rowPrice.toString();

        let eachPrice = tr.querySelectorAll("td:nth-child(5)");

        if(hasFood.contains("hide")) {
            document.getElementById("food-price-box").classList.add("hide");
        }else{
            eachPrice.forEach(price => {
                document.getElementById("food-price-box").classList.remove("hide");

                foodAllPrice += parseInt(price.textContent);

                foodSumPrice.textContent = foodAllPrice;

            });
        }
    });



    document.querySelector("input[name='movieAmount']").addEventListener("change", e => {
        isChanged = true;

        changedSelect = e.target.value;
        if(hasFood.contains("hide")) {
            document.getElementById("finalPrice").textContent = (moviePrice * changedAmount);
            allSumPrice.value = (moviePrice * changedAmount);
        }else{
            let foodPriceTd = document.querySelectorAll(".food-price");
            let foodPriceAll = 0;

            foodPriceTd.forEach(item => {
                foodPriceAll += parseInt(item.textContent);
            });
            console.log(foodPriceAll);

            document.getElementById("finalPrice").textContent = (moviePrice * changedAmount) + foodPriceAll;
            allSumPrice.value = (moviePrice * changedAmount) + foodPriceAll;
        }
    });

    let foodAmount = document.querySelectorAll(".food-amount");

    foodAmount.forEach(selectAmount => {
       selectAmount.addEventListener("change", e => {
           isChangeSelect = true;
           let changedAllPrice = 0;

           changedSelect = e.target.value;

           foodRow.forEach(tr => {
               if(tr.querySelector("td:nth-child(1)").textContent === e.target.closest("tr").querySelector("td:nth-child(1)").textContent){
               rowPrice = tr.querySelector("td:nth-child(3)").textContent * changedSelect;

               tr.querySelector("td:nth-child(5)").textContent = rowPrice.toString();
               }

               let changedEachPrice = tr.querySelectorAll("td:nth-child(5)");

               if(hasFood.contains("hide")) {

               }else{
                   document.getElementById("food-price-box").classList.remove("hide");


                   changedEachPrice.forEach(changedPrice => {

                       changedAllPrice += parseInt(changedPrice.textContent);

                       console.log(foodAllPrice);

                       foodSumPrice.textContent = changedAllPrice;

                   });
               }
           });





       });
    });


    document.getElementById("add-btn").addEventListener("click", e => {
        const foods = document.querySelector(".hide");

        const width = 1200;
        const height = 1000;
        const left = window.screenX + ((window.screen.width - width) /2);
        const top = window.screenY + ((window.screen.height - height) /2);

        console.log(window.screen.width);
        console.log(window.screen.height);

        const child = window.open(`/food/list-popup`, "food/list-popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);



        child.onbeforeunload = function (){
            console.log(localStorage.length);
            let sumPrice = 0;

            if(localStorage.length > 0){
                let nums = JSON.parse(localStorage.getItem("checkedItem"));




                nums.forEach(item => {
                    foodNums.forEach(numbers => {


                       if(numbers.textContent === item){
                            let foodNum = parseInt(numbers.textContent)


                           fetch(`/orders/getPrice/${foodNum}`)
                               .then(resp => resp.json())
                               .then(result => {


                                   console.log(result);

                                   sumPrice += result;

                                   console.log(sumPrice);

                                    if(!isChanged) {
                                        document.getElementById("finalPrice").textContent = (moviePrice * movieAmount) + sumPrice;
                                        allSumPrice.value = (moviePrice * movieAmount) + sumPrice;
                                    }else{
                                        document.getElementById("finalPrice").textContent = (moviePrice * changedAmount) + sumPrice;
                                        allSumPrice.value = (moviePrice * changedAmount) + sumPrice;
                                    }
                               });
                       }
                    });
                });
            }
        }
    });
});