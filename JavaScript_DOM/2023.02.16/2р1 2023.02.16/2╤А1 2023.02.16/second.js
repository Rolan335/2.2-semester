let first = squares[0];
first.style.fontSize = "48px";
first.style.overflow = "hidden";

console.log(first.style.width);
console.log(first.offsetWidth);
console.log(first.scrollWidth);
// размер слова в теге <= 1/2 его размера (не забыть gap)

function setSize (el, par) {
    el.innerText = el.innerText.replace(/[.!,?;:]/ig, "");
    par.style.fontSize = "48px";
    let size = parseInt(par.style.fontSize) || 100;
    // console.log(size);
    while(el.offsetWidth > par.offsetWidth / 2 - 30) {
        el.style.fontSize = --size + "px";
    }
}
add([1,2,3,4]);
updSq();

for (let sq of squares) {
    console.log(sq);
    for (let i = 0; i < sq.children.length; i++) {
        let span = sq.children[i];
        setSize(span, sq);
    }
}
// function addSq(arr) {
//     let html = "<div class='sq'>";
//     arr = arr.slice(0, 4);
//     for (let w of arr) {
//         html += `<span>${w}</span>`;
//     }
//     html += "</div>";
//     box.innerHTML += html;
// }
function add(arr) {
    let sq = document.createElement("div");
    arr = arr.slice(0, 4);
    arr.forEach((w, i) => {
        let span = document.createElement("span");
        span.innerText = i + 1;
        sq.append(span); // добавить внутрь тега (в самый конец)
    })
    console.log(sq);
    box.append(sq);
    sq.className = "sq";
}

