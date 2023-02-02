//1
let array = []
for (let i = 0; i < 30; i++) {
    array.push(getNumber(100, 0))
}

let table = "<table style='border-spacing: 0px; border: 1px solid black;'>"
let arrInd = 0
for (let i = 0; i < 5; i++) {
    table += "<tr>"
    for (let j = 0; j < 6; j++) {
        if (array[arrInd] >= 50) { table += `<td style='border: 1px solid black; padding: 10px; background-color: orange'>${array[arrInd]}</td>` }
        else { table += `<td style='border: 1px solid black; padding: 10px;'>${array[arrInd]}</td>` }
        arrInd++
    }
    table += "</tr>"
}
table += "</table>"
document.body.innerHTML += table


//2
document.body.innerHTML += "<button onclick='addNum()' style='margin-top: 25px; position: absolute; left: 250px; top: 0px;'>Добавить число</button>"
let elemsCount = 0
function addNum() {
    let lastElemPath = document.body.firstElementChild.nextElementSibling.lastElementChild
    if (elemsCount == 0 || elemsCount == 6) {
        lastElemPath.innerHTML += "<tr></tr>"
        if (elemsCount = 6) { elemsCount = 0 }
    }
    let getNumForElem = getNumber(100, 0)
    if (getNumForElem >= 50) {
        lastElemPath.lastElementChild.innerHTML += `<td style = 'border: 1px solid #000; padding: 10px; background-color: orange;'>${getNumForElem}</td>`
    }
    else {
        lastElemPath.lastElementChild.innerHTML += `<td style = 'border: 1px solid #000; padding: 10px;'>${getNumForElem}</td>`
    }
    elemsCount++
}
