const setBg = e =>{
    e.preventDefault()//Остановить событие заданное браузером по умолчанию a/form/btn
    e.stopPropagation()
    e.currentTarget.style.backgroundColor = getColor(getNumber(101))
}

const sq = document.querySelector(".square")
const link = sq.firstElementChild

document.body.addEventListener("click", setBg)
sq.addEventListener("click", setBg)
link.addEventListener("click", setBg)

const txtEL = document.querySelector(".card_txt"), picEl = txtEL.previousElementSibling


let form = document.querySelector("#fun_form");

// form = document.forms[0];
// let form = document.forms.fun_form

form.addEventListener("submit", e=>{
    e.preventDefault()
    console.log("Submit")
    console.log(form.children)
    console.log(form.elements)
    for(let i = 0;i< form.elements.length; i++){
        let el = form.elements[i]
        if(el.name){
            console.log(el)
            switch (el.name){
                case "txt":
                    txtEL.innerHTML += `<div>${el.value}</div>`
                    break;
                case "pic":
                    picEl.style.backgroundImage = `url(${el.value})`
                    break;
            }
        }
    }
})

form.addEventListener("reset",e=>{
    e.preventDefault()
    console.log("Reset")
})