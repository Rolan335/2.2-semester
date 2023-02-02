let funWidth = 500,
    funHeight = 500,
    funTop = (screen.availHeight - funHeight) / 2,
    funLeft = (screen.availWidth - funWidth) / 2;
let fun;
function getFun() {
    fun = window.open("", "", `width=${funWidth + 2},height=${funHeight + 2},left=${funLeft},top=${funTop}`);
    console.log(fun.innerWidth);
    let content = `
        <html>
            <head>
                <title>Fun page</title>
                <style>
                    body {
                        margin: 0;
                        display: flex;
                        flex-wrap: wrap;
                        align-content: flex-start;
                        min-height: ${funHeight};
                        min-width: ${funWidth};
                    }
                </style>
            </head>
            <body>
    `
    let n = 20;
    for (let i = 0, cnt = Math.floor(funWidth / n); i < cnt; i++) {
        for (let j = 0, ccnt = Math.floor(funHeight / n); j < ccnt; j++) {
            content += `<div style="
                background: ${getColor()}; 
                width: ${n}px; 
                height: ${n}px
            "></div>`
        }
    }
    content += `</body></html>`
    fun.document.write(content);
}