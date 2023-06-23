function getNumber(max = 256, min = 0){
    return Math.floor(Math.random() * (max - min) + min)
}
function getColor(a){
    return `rgba(${getNumber()}, ${getNumber()}, ${getNumber()}, ${a / 100})`
}

// function getGradient(cnt = 2, type = 'linear', dir){
//     let string = ''
//     switch (type){
//         case "linear": string += `linear-gradient()`; break;
//         case "Radial": string += `Radian-gradient()`; break;
//     }
//     if (dir){
//         string += dir + ','
//     }
//     while(cnt--){
//         string += getColor(getNumber(101));
//         string += cnt ? ',': ')';
//     }
//     return string;
// }


function getGradient(cnt = 2, type = "linear", dir) {    
    let str = ""    
    switch (type) {        
    case "linear": str += `linear-gradient(`; break;       
    case "radial": str += `radian-gradient(`; break;
    }    if (dir) { 
           str += dir + ","    }    while(cnt--) 
           {        str += getColor(getNumber(101));
            str += cnt ? "," : ")";    }   
 return str;}


let block = document.getElementById("house")
console.log(block)

block.innerHTML += `<h3>Чем отличается снег от дождя?</h3>
<p>дождь мокрый</p>`

let captions = document.getElementsByTagName("h3")
console.log(captions)

for (let i = 0; i < captions.length;){
    let h3 = captions[i]
    h3.innerText = ++i + " " + h3.innerText
}

let wrapper = document.getElementsByClassName("wrapper")[0]

console.log(wrapper)

wrapper.title = "Omnomnom"
wrapper.id = "wrap"

wrapper.style = `background-image: ${getGradient(5, 'linear', 'to left')}`

block.style = `background-image: ${getGradient(3, 'radial', 'circle')}`

Array.from(captions).forEach(h3, i => {
    if (i !== captions.length - 1){
        h3.nextElementSibling.style = `
        padding-bottom: 20px;
         border-bottom: 1px solid;
          margin-bottom: 20px;`
    }
})

