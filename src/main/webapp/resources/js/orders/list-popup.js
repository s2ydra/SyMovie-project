window.addEventListener("load", () => {
    let tr = document.querySelectorAll("tr");

    tr.forEach(row => {
        row.addEventListener("click", e=>{
            const checkbox = row.querySelector("input[name='orderFoods']");


            if (checkbox) {
                if(!checkbox.hasAttribute("checked")){
                checkbox.setAttribute("checked", true);
                }
            }

            if (checkbox.hasAttribute("checked")){
                row.style.background = "#f05650";
            }
            if(checkbox.hasAttribute("checked")){
                row.addEventListener("click", e => {
                    checkbox.removeAttribute("checked");

                    row.style.background = "none";
                });
            }
        })
    })

    document.getElementById("close-btn").addEventListener("click", e => {
        self.close();
    })
});