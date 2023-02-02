document.body.innerHTML = ""

let names = ["Rita", "Apolynari", "Beast", "Timur", "Sergei", "Mishkan", "Kseniya", "Ilya", "Murad", "Misha", "Rolan", "Semyon", "Nikita", "Vlad", "Cat", "Artemiy"]

class Person{
    constructor(name){
        this.name = name;
        this.age = getNumber(13,20);
        this.color = getColor();
        this.bg = getColor(40);
    }
}

const data = []
let cnt = 9
while(cnt--){
    let randName = names[getNumber(names.length)]
    data.push(new Person(randName))
}

console.log(data)
function createCard(ppl){
    return `
        <div class="card" style="background-color: ${ppl.bg}">
        <h4>${ppl.name}</h4>
        <div>${ppl.age}</div>
        </div>
    `
}

let content = "<div class=\"wrapper\">"
for (let ppl of data){
    content += createCard(ppl)
}

content += "</div>"

document.body.innerHTML += content