window.addEventListener("load", () => {

    fetch("https://www.megabox.co.kr/on/oh/oha/Movie/selectMovieList.do")
        .then(resp => resp.json())
        .then(result => {
            console.log(result);
            let imgPaths = [];
            let movieNames = [];
            let openDates = [];

            imgPaths.push(result.movieList.map(movie => movie.imgPathNm));
            movieNames.push(result.movieList.map(movie => movie.movieNm));
            openDates.push(result.movieList.map(movie => movie.rfilmDe));


            for(let i =0; i < movieNames[0].length && i < imgPaths[0].length && i < openDates[0].length; i++){
                const tbody = document.querySelector("tbody");

                const tr = document.createElement("tr");
                const nameTd = document.createElement("td");
                const imgTd = document.createElement("td");
                const img = document.createElement("img");
                const basePath = "https://img.megabox.co.kr";
                const dateTd = document.createElement("td");
                const numTd = document.createElement("td");

                img.src = basePath + imgPaths[0][i]
                img.classList.add("movie-img");
                imgTd.append(img);

                nameTd.textContent = movieNames[0][i];
                dateTd.textContent = openDates[0][i];
                numTd.textContent = i + 1;

                tbody.append(tr);
                tbody.append(numTd);
                tbody.append(imgTd);
                tbody.append(nameTd);
                tbody.append(dateTd);
            }

            });
        });