let box = document.body.firstElementChild;
box = document.getElementsByClassName("box")[0];
/* *
* query - запрос
* selector - указатель на что-то (css-селектор)
* .querySelector("") - получить html-тег по css-селектору
*   получает первый попавшийся элемент
* */
box = document.querySelector(".box");
// console.log(box);

box.style = "border: violet solid 5px; border-radius: 20px;";
// box.style += "border-style: dotted;";

/* *
*   style = {}
*   color               color
*   font-size           fontSize
*   list-style-type     listStyleType
* */

// box.style.background = "coral";
// box.style["border-style"] = "double";
box.style.borderStyle = "double";
box.style.borderWidth = "15px";

let squares = box.childNodes;
squares = box.children;
squares = document.getElementsByClassName("sq");
// console.log(squares);
/* *
* querySelectorAll("") - найти все подходящие элементы (список)
* */
// squares = document.querySelectorAll(".sq");
/* *
*   HTMLCollection      vs      NodeList
*   не массив                   не массив
*   .length                     .length
*   не работает с методами      не рабоает с методами, кроме forEach
*   живая html-коллекция        список узлов
* */
// console.log(squares);

function updSq() {
    for (let i = 0; i < squares.length; i++) {
        squares[i].style.color = box.style.borderColor;
        squares[i].style.borderRadius = box.style.borderRadius;
        // squares[i].style.borderRadius = parseInt(box.style.borderRadius) / 2 + "px " + parseInt(box.style.borderRadius) * 8 + "px";
    }
}
function addSq(arr) {
    let html = "<div class='sq'>";
    arr = arr.slice(0, 4);
    for (let w of arr) {
        html += `<span>${w}</span>`;
    }
    html += "</div>";
    box.innerHTML += html;
}

addSq(["Вышел", "Ёжик", "Из", "Тумана"]);
addSq(["Наша", "Таня", "Громко ", "Уронила", "Мячик", "Плак"]);

updSq();
