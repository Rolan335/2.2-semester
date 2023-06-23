const fs = require("fs")
const zlib = require("zlib")

let writeableStream = fs.createWriteStream(__dirname + "/hello.txt.gz")

let readableStream = fs.createReadStream(__dirname + "/hello.txt", "utf8")

let gzip = zlib.createGzip()

readableStream.pipe(gzip).pipe(writeableStream)