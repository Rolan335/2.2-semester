

// document.childNodes - все элементы потомки (массив)

// const html = document.childNodes[1];
// const head = html.childNodes[0];
// console.log(head);

// let caption = document.body.firstElementChild

// console.log(caption.firstChild.nodeValue)

// caption.textContent = "Wow!"

let span = document.body.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild
span.textContent = "Finally, we changed span"

console.log(document.body.parentElement)