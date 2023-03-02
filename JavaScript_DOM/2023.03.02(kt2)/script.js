const wrapper = document.querySelector(".wrapper")
function renderCards(arr) {
    for (let i = 0; i < arr.length; i++) {
        let card =
            `
            <div class="card">
        <h3 class="name">${arr[i].name}</h3>
        <img src="${arr[i].img_link}" alt="">
        <div class="age">${getAge(arr[i].age)}</div>
        <div class="rate">${getStars(arr[i].rate)}</div>
        ${(arr[i].favourite) ? "<div class='favourite'>Любимый</div>" : ""}
        <div class="description">${arr[i].description}</div>
    </div>
        `
        wrapper.innerHTML += card
    }
}
function getStars(rate){
    let stars = ""
    for (let i = 0; i < rate; i++){
        stars +="<img src='grade_FILL0_wght400_GRAD0_opsz48.svg'>"
    }
    return stars
}
function getAge(age){
    if(age % 10 == 1){
        return `${age} год`
    }
    else if (age % 10 >= 2 && age % 10 <= 4){
        return `${age} года`
    }
    else{
        return `${age} лет`
    }
}



renderCards(cats)