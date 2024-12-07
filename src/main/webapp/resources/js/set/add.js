window.addEventListener("load", () => {
    document.getElementById("movie-select").addEventListener("click", e=> {
        const width = 1400;
        const height = 800;
        const left = window.screenX + ((window.screen.width - width) / 2);
        const top = window.screenY + ((window.screen.height - height) / 2);

        console.log(window.screen.width);
        console.log(window.screen.height);

        const movieChild = window.open(`/movie/list-popup`, "movie/list-popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);

        movieChild.onbeforeunload = function (){
            const movieNum = localStorage.getItem("movieNum");

            fetch(`/movie/addToSet/${movieNum}`)
                .then(resp => resp.json())
                .then(result => {
                    console.log(result);

                    if(!document.getElementById("selected-movie-table").classList.contains("hide")){
                        const tds = document.querySelectorAll(".tds");

                        tds.forEach(td => {
                            td.remove();
                        })
                    }

                    const tr = document.getElementById("selected-movie-row");

                    const imageTd = document.createElement("td");
                    const img = document.createElement("img");
                    img.src = `${result.movieImage.movieImageFilename}`;
                    img.setAttribute("style", "max-width:100px; max-height:130px");
                    imageTd.append(img);

                    const titleTd = document.createElement("td");
                    titleTd.textContent = result.movieName;
                    titleTd.style.fontSize="20px";
                    titleTd.style.fontWeight="600";

                    const amountTd = document.createElement("td");
                    const spanTag = document.createElement("span");
                    const label = document.createElement("label");
                    const inputTag = document.createElement("input");

                    inputTag.setAttribute("type", "number");
                    inputTag.setAttribute("name", "movieAmount");
                    inputTag.setAttribute("value", "1");
                    inputTag.style.maxWidth = "70px";
                    inputTag.style.textAlign = "center";

                    spanTag.textContent = "티켓 매수 :";
                    spanTag.style.marginRight = "15px"

                    label.append(spanTag);
                    label.append(inputTag);
                    amountTd.append(label);

                    imageTd.setAttribute("class", "tds");
                    titleTd.setAttribute("class", "tds");
                    amountTd.setAttribute("class", "tds");


                    tr.append(imageTd);
                    tr.append(titleTd);
                    tr.append(amountTd);

                    document.getElementById("selected-movie-table").classList.remove("hide");

                    document.getElementById("selected-movie").value = result.movieNum;
                })
        }
    });

    document.getElementById("food-select").addEventListener("click", e => {
        const width = 1400;
        const height = 800;
        const left = window.screenX + ((window.screen.width - width) / 2);
        const top = window.screenY + ((window.screen.height - height) / 2);

        const foodChild = window.open(`/food/list-popup-set`, "food/list-popup-set", `left=${left},top = ${top}, width = ${width}, height = ${height}`);

        foodChild.onbeforeunload = function (){
            const foodNum = localStorage.getItem("foodNum");

            fetch(`/food/addToSet/${foodNum}`)
                .then(resp => resp.json())
                .then(result => {
                    console.log(result);

                    const tr = document.getElementById("selected-food-row");

                    const foodImageTd = document.createElement("td");
                    const foodImg = document.createElement("img");

                    foodImg.src = `/upload/${result.foodImage[0].foodImageFilename}_${result.foodImage[0].foodImageUuid}`;
                    foodImg.setAttribute("style", "max-width:100px; max-height:130px");
                    foodImageTd.append(foodImg);

                    const foodNameTd = document.createElement("td");
                    foodNameTd.textContent = result.foodName;
                    foodNameTd.style.fontSize="20px";
                    foodNameTd.style.fontWeight="600";


                    const foodAmountTd = document.createElement("td");
                    const spanTag = document.createElement("span");
                    const labelTag = document.createElement("label");
                    const inputTag = document.createElement("input");

                    inputTag.setAttribute("type", "number");
                    inputTag.setAttribute("name", "foodAmount");
                    inputTag.setAttribute("value", "1");

                    inputTag.style.maxWidth = "70px";
                    inputTag.style.textAlign = "center";

                    spanTag.textContent="개수 설정 :";
                    spanTag.style.marginRight = "15px"

                    foodAmountTd.append(spanTag);
                    foodAmountTd.append(labelTag);
                    foodAmountTd.append(inputTag);


                    tr.append(foodImageTd);
                    tr.append(foodNameTd);
                    tr.append(foodAmountTd);

                    document.getElementById("selected-food-table").classList.remove("hide");
                    document.getElementById("selected-food").value = result.foodNum;
                });

        }

    })
})