const form = document.querySelector("#form")
const card = document.querySelector(".card")
const system = document.querySelector(".card__system")
form.addEventListener("submit", e => {
    e.preventDefault()
    switch (form[0].value.toUpperCase()) {
        case "ТИНЬКОФФ":
            card.style.backgroundImage = "url('img/1.png')"
            break
        case "СБЕРБАНК":
            card.style.backgroundImage = "url('img/2.png')"
            break
    }
    switch (form[1].value.toUpperCase()) {
        case "VISA":
            system.style.backgroundImage = "url('img/3.png')"
            break
        case "MASTERCARD":
            system.style.backgroundImage = "url('img/4.png')"
            break
    }
    document.querySelector(".card__number").textContent = format(form[2].value)
    document.querySelector(".card__expire").textContent = form[4].value
    document.querySelector(".card__name").textContent = form[3].value.toUpperCase()
})

form.addEventListener("reset", e => {
    card.style.backgroundImage = ""
    system.style.backgroundImage = ""
    document.querySelector(".card__number").textContent = ""
    document.querySelector(".card__expire").textContent = ""
    document.querySelector(".card__name").textContent = ""
    addTable(form)
})

function format(s) {
    return s.toString().replace(/\d{4}(?=.)/g, '$& ');
}

function addTable(form) {
    let tr = `<tr><td>${form[0].value}</td><td>${form[1].value}</td><td>${format(form[2].value)}</td><td>${form[3].value}</td><td>${form[4].value}</td></tr>`
    document.querySelector("table").innerHTML += tr
}