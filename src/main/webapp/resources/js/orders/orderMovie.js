const checkNum = JSON.parse(sessionStorage.getItem("checkedItem"));
let isChanged = false;
let isChangeSelect = false;
let allSumPrice = document.getElementById("all-sumPrice");

const calcPrice = (moviePrice, movieAmount, foodPriceAll) => {
    let foodPriceTd = document.querySelectorAll(".food-price");
    let foodPrice = 0;


    if (isChanged && !isChangeSelect) {
        movieAmount = document.querySelector("input[name='movieAmount']").value;
    }

    if (isChanged && isChangeSelect) {
        movieAmount = document.querySelector("input[name='movieAmount']").value;

        foodPriceTd.forEach(item => {
            foodPriceAll += parseInt(item.textContent);
        });
    }
    document.getElementById("finalPrice").textContent = (moviePrice * movieAmount) + foodPriceAll;
    //allSumPrice.value = (moviePrice * movieAmount) + foodPriceAll;
}

const calcDefaultPrice = (moviePrice, movieAmount) => {
    document.getElementById("finalPrice").textContent = (moviePrice * movieAmount);
    //allSumPrice.value = (moviePrice * movieAmount);
}


window.addEventListener("load", () => {
    let moviePrice = parseInt(document.querySelector(".movie-price").textContent);
    let movieAmount = document.querySelector("input[name='movieAmount']").value;
    const hasFood = document.getElementById("food-table-box").classList;
    let changedAmount = 0;
    let foodExPrice = 0;

    console.log(hasFood.contains("hide"));

    if (hasFood.contains("hide")) {
        calcDefaultPrice(moviePrice, movieAmount);

        //document.getElementById("finalPrice").textContent = moviePrice * movieAmount;
        //allSumPrice.value = moviePrice * movieAmount;
    }

    let foodNums = document.querySelectorAll(".food-number");
    let foodRow = document.querySelectorAll(".food-row");
    let rowPrice = 0;
    let changedSelect = 0;
    let isChangeSelect = false;
    let foodAllPrice = 0;
    let foodSumPrice = document.getElementById("foodFinalPrice");


    foodRow.forEach(tr => {
        if (!isChangeSelect) {
            rowPrice = tr.querySelector("td:nth-child(3)").textContent * tr.querySelector("td:nth-child(4)").querySelector("input[type='number']").value;
        } else {
            rowPrice = tr.querySelector("td:nth-child(3)").textContent * changedSelect;
        }
        tr.querySelector("td:nth-child(5)").textContent = rowPrice.toString();

        let eachPrice = tr.querySelectorAll("td:nth-child(5)");

        if (hasFood.contains("hide")) {
            document.getElementById("food-price-box").classList.add("hide");
        } else {
            eachPrice.forEach(price => {
                document.getElementById("food-price-box").classList.remove("hide");

                foodSumPrice.textContent += parseInt(price.textContent);


            });
        }
    });


    document.querySelector("input[name='movieAmount']").addEventListener("change", e => {
        isChanged = true;

        changedAmount = e.target.value;
        if (hasFood.contains("hide")) {
            document.getElementById("finalPrice").textContent = (moviePrice * changedAmount);
            allSumPrice.value = (moviePrice * changedAmount);
        } else {
            let foodPriceTd = document.querySelectorAll(".food-price");
            let foodPriceAll = 0;

            if (!isChangeSelect) {
                foodPriceTd.forEach(item => {
                    foodPriceAll += parseInt(item.textContent);
                });
            } else {
                foodPriceAll = foodExPrice;
            }

            calcPrice(moviePrice, changedAmount, foodPriceAll);

            console.log(foodPriceAll);


        }
    });

    let foodAmount = document.querySelectorAll(".food-amount");

    foodAmount.forEach(selectAmount => {
        selectAmount.addEventListener("change", e => {
            isChangeSelect = true;
            changedSelect = e.target.value;

            foodRow.forEach(tr => {
                if (tr.querySelector("td:nth-child(1)").textContent === e.target.closest("tr").querySelector("td:nth-child(1)").textContent) {
                    rowPrice = tr.querySelector("td:nth-child(3)").textContent * changedSelect;

                    tr.querySelector("td:nth-child(5)").textContent = rowPrice.toString();

                }

            });
            let changePrices = document.querySelectorAll(".amount-sumPrice");
            let changeSumPrice = 0;

            changePrices.forEach(price => {
                changeSumPrice += parseInt(price.textContent);

                calcPrice(moviePrice, movieAmount, changeSumPrice);

                foodExPrice = changeSumPrice;
                // document.getElementById("finalPrice").textContent = (moviePrice * movieAmount) + changeSumPrice;
                // allSumPrice.value = (moviePrice * changedAmount) + changeSumPrice;
            });
        });
    });


    document.getElementById("add-btn").addEventListener("click", e => {
        const foods = document.querySelector(".hide");

        const width = 1200;
        const height = 1000;
        const left = window.screenX + ((window.screen.width - width) / 2);
        const top = window.screenY + ((window.screen.height - height) / 2);

        console.log(window.screen.width);
        console.log(window.screen.height);

        const child = window.open(`/food/list-popup`, "food/list-popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);


        child.onbeforeunload = function () {
            console.log(localStorage.length);
            let sumPrice = 0;

            if (localStorage.length > 0) {
                let nums = JSON.parse(localStorage.getItem("checkedItem"));


                nums.forEach(item => {
                    foodNums.forEach(numbers => {


                        if (numbers.textContent === item) {
                            let foodNum = parseInt(numbers.textContent)


                            fetch(`/orders/getPrice/${foodNum}`)
                                .then(resp => resp.json())
                                .then(result => {


                                    console.log(result);

                                    sumPrice += result;

                                    console.log(sumPrice);

                                    if (!isChanged) {
                                        document.getElementById("finalPrice").textContent = (moviePrice * movieAmount) + sumPrice;
                                    } else {
                                        document.getElementById("finalPrice").textContent = (moviePrice * changedAmount) + sumPrice;
                                    }
                                });
                        }
                    });
                });
            }
        }

        document.getElementById("go-btn").addEventListener("click", event => {
            event.preventDefault();

            let finalPrice = document.getElementById("finalPrice").textContent;

            const width = 1200;
            const height = 1000;
            const left = window.screenX + ((window.screen.width - width) / 2);
            const top = window.screenY + ((window.screen.height - height) / 2);

            window.open(`/orders/order-popup`, "orders/order-popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);
        });

    });
});