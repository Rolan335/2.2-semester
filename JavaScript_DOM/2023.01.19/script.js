let n = 0
function clk() {
    console.log(`Clicked ${++n} times`)
}

const getNum = function (a = 101, b = 0) {
    return Math.floor(Math.random() * (a - b) + b)
}

let isOpen;

function show() {
    // window.open("https://google.com", "blank")
        isOpen = window.open("", "", "width=300,height=300", "top=100, right=100")
}

function exit() {
    if (isOpen) {
        window.close()
    }
}

function changeSize() {
    let w = wins[wins.length - 1];
    let width = getNumber(screen.width - 200, 100);
    let height = getNumber(screen.height - 200, 100);
    if (w) {
        // w.resizeBy(100,100);
        w.resizeTo(width, height);
    }
}
function changePlace() {
    let w = wins[wins.length - 1];
    if (w) {
        let x = (screen.width - w.outerWidth) / 2;
        let y = (screen.height - w.outerHeight) / 2;
        // w.moveBy(100, 0);
        w.moveTo(x, y);
    }
}