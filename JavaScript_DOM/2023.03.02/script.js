const square = document.querySelector(".square")
const popup = document.querySelector(".popup")

const changeBg = function () {
    this.style.backgroundColor = getColor()
}

let n = 0
const span = document.createElement("span")
square.append(span)
// square.onclick = function(){
//     span.innerText = `Clicked ${++n} times`
// }

//Регистрация события
square.addEventListener("click", changeBg)
square.addEventListener("click", function () {
    span.innerText = `Clicked ${++n} times`
    if (n == 3) {
        this.removeEventListener("click", changeBg)
    }
})


//e / ev / event
square.addEventListener("click", (e) =>{
    console.log(e)
    console.log(e.type) // тип события
    console.log(e.target) // конкретный тег, который спровоцировал события
    console.log(e.currentTarget) // элемент, который является автором (инициатором) события
    console.log(e.shiftKey, e.ctrlKey, e.altKey, e.metaKey)
    if (e.shiftKey) {
        e.target.style.backgroundColor = getColor()
    }
})
//meta - windows / command

square.addEventListener("mousemove", e =>{
    popup.style.top = e.y + "px"
    popup.style.left = e.x + "px"
    popup.innerText = `x: ${e.offsetX}, y: ${e.offsetY}`
})
square.addEventListener("mouseout", e => {
    popup.style = null
})

/*
onclick
onmousedown - зажать лкм
onmouseup - отжать лкм
onmousemove - движение мыши
onmouseover/ onmouseenter - навести указатель мыши
onmouseout / onmouseleave - убрать наведение
ondblclick - двойной щелчёк лкм
oncontextmenu - пкм
*/