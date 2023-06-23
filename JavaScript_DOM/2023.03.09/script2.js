const container = document.querySelector(".words"), form = document.forms.words, searchEl = form.nextElementSibling.search, cntEl = form.nextElementSibling.cnt

let wordsLength = []

words.forEach(w => {
    if (!wordsLength.includes(w.length)) {
        wordsLength.push(w.length)
    }
})

wordsLength.sort((a, b) => a - b)
console.log(wordsLength)
for (let cnt of wordsLength) {
    const opt = new Option(cnt)
    cntEl.append(opt)

}