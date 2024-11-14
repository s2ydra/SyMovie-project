window.addEventListener("load" , () => {
    document.getElementById("add-btn").addEventListener("click", e => {
        const foods = document.querySelector(".hide");

        const width = 1200;
        const height = 1000;
        const left = window.screenX + ((window.screen.width - width) /2);
        const top = window.screenY + ((window.screen.height - height) /2);

        console.log(window.screen.width);
        console.log(window.screen.height);

        window.open(`/food/list-popup`, "food/list-popup", `left=${left},top = ${top}, width = ${width}, height = ${height}`);
    });

    window.checkItem = checkValues =>{

        const table = window.opener.document.querySelector(".hide");

        console.log(table);



    }


});