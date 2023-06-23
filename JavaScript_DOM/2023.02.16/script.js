// let box = document.body.firstElementChild
// box = document.getElementsByClassName("box")[0]
box = document.querySelector(".box")
box.style = "border: blue solid 16px; border-radius: 20px;"
// box.style = "border-style: bouble;" не работает, так же +=
box.style.background = "gray"
box.style["border-style"] = "double";
box.style.borderWidth = "30px";

let squares = box.children
squares = document.getElementsByClassName("sq")
squares = document.querySelectorAll(".sq")

/*
        getElementByClassName         querySelectorAll
        HTMLCollection          vs    NodeList
        не массив                     не массив
        .length                       .length
        не работает с методами        не работает с методами, кроме forEach
        живая html-коллекция          список узлов
*/

function updSq() {
    for (let i = 0; i < squares.length; i++) {
        squares[i].style.color = box.style.borderColor;
        // squares[i].style.borderRadius = parseInt(box.style.borderRadius) / 2 + "px" + parseInt(box.style.borderRadius) * 8 + "px"; // NaN ?
    }
}
function addSq(arr) {
    html = "<div class='sq'>"
    arr = arr.slice(0, 4)
    for (let w of arr) {
        html += `<span>${w}</span>`
    }
    html += "</div>"
    box.innerHTML += html;
}

addSq(["Вышел", "Покурить", "На", "Паре",])
addSq(["И", "Не", "Вернулся"])
updSq()

let first = document.querySelector(".sq")
first.style.fontSize = "48px"
first.style.overflow = " hidden"

let span = first.querySelector("span")
span.innerText = span.innerText.replace(/[.!,?;:]/ig, "")
console.log(span.innerText)
let size = parseInt(first.style.fontSize);
console.log(size)
// while(span.offsetWidth > first.offsetWidth / 2 - 10){
//     span.style.fontSize = --size + "px"
//     console.log(size)
// }
// console.log(span.offsetWidth)
// span.style.fontSize = size - 10 + "px";
// span.style.width = "max-content" //firefox не работает

// // console.log(span.offsetWidth)
// function setSize(el, par) {
//     el.innerText = el.innerText.replace(/[.!,?;:]/ig, "")
//     par.style.fontSize = "48px"
//     let size = parseInt(par.style.fontSize) ||100
//     while (el.offsetWidth > par.offsetWidth / 2 - 30) {
//         el.style.fontSize = --size + "px"
//     }
// }

for (let sq of squares) {
    console.log(sq)
    for (let i = 0; i < sq.children.length; i++) {
        let span = sq.children[i]
        setSize(span, sq)
    }
}

function add(arr){
    let sq = document.createElement("div");
    arr = arr.slice(0,4)
    arr.array.forEach((w,i) => {
        let span = document.createElement("span")
        span.innerText = i + 1
        sq.append(span); // добавить внутрь тега (в конец)
    });
    box.append(sq)
    sq.className = "sq"
}

add([1,2,3,4])
