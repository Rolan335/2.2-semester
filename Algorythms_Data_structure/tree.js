class BinaryTree {
    constructor(rootObj) {
        this.key = rootObj
        this.leftChild = null
        this.rightChild = null
    }
    insertLeft(newNode) {
        if (this.leftChild === null) {
            this.leftChild = new BinaryTree(newNode)
        }
        else {
            let t = new BinaryTree(newNode)
            this.leftChild = t
            t.leftChild = this.leftChild
        }
    }
    insertRight(newNode) {
        if (this.rightChild === null) {
            this.rightChild = new BinaryTree(newNode)
        }
        else {
            let t = new BinaryTree(newNode)
            this.rightChild = t
            t.rightChild = this.rightChild
        }
    }
    getRootVal() {
        return this.key
    }
    getLeftChild() {
        return this.leftChild
    }
    getRightChild() {
        return this.rightChild
    }
    setRootVal(val) {
        this.key = val
    }
}

// let root = new BinaryTree('a')
// root.insertLeft(new BinaryTree('b'))
// root.insertRight(new BinaryTree('c'))
// root.rightChild.insertLeft(new BinaryTree('d'))

function printAll(tree) {
    if (tree) {
        console.log(tree.getRootVal())
        printAll(console.log(tree.getLeftChild()))
        printAll(console.log(tree.getRightChild()))
    }
}
// printAll(root)

const bookR = new BinaryTree('Моя книга')
bookR.insertLeft('глава 1')
bookR.insertRight('глава 2')
bookR.getLeftChild().insertLeft('раздел 1.1')
bookR.getLeftChild().insertRight('раздел 1.2')
bookR.getLeftChild().getRightChild().insertRight('Подраздел 1.2.1')
bookR.getRightChild().insertLeft('раздел 2.2')
bookR.getRightChild().getLeftChild().insertLeft('Подраздел 2.2.1')
bookR.getRightChild().getLeftChild().insertRight('Подраздел 2.2.1')

function countAll(tree){
    if(!tree){
        return 0
    }
    return 1 + countAll(tree.getLeftChild()) + countAll(tree.getRightChild())
}

printAll(bookR)

console.log(countAll(bookR))

