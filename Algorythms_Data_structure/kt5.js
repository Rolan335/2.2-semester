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

// const bookR = new BinaryTree('Дерево')
// bookR.insertLeft('Левый узел уровень 1')
// bookR.insertRight('Правый узел уровень 2')
// bookR.getLeftChild().insertLeft('Левый узел уровень 1.1')
// bookR.getLeftChild().insertRight('Правый узел уровень 1.2')
// bookR.getRightChild().insertLeft('Левый узел уровень 2.1')
// bookR.getRightChild().insertRight('Правый узел уровень 2.2')

// function printAll(tree) {
//     if (tree) {
//         console.log(tree.getRootVal())
//         printAll(console.log(tree.getLeftChild()))
//         printAll(console.log(tree.getRightChild()))
//     }
// }

// printAll(bookR)

// console.log("---------")

// function mirror(tree) {
//     if (!tree) {
//         return tree
//     }
//     mirror(tree.getLeftChild())
//     mirror(tree.getRightChild())
//     let temp = tree.getLeftChild()
//     tree.getLeftChild(tree.getRightChild())
//     tree.getRightChild(temp)
//     return tree
// }
// /*
//                 Дерево
//                /      \
//               1        2
//              / \      / \
//            1.1 1.2  2.1 2.2
// */
let lDepth;
let rDepth;
function maxDepth(tree) {
    if (tree == null) {
        return 0;
    }
    else {
        /* compute the depth of each subtree */
        if (tree.getLeftChild() != null) {
            lDepth = maxDepth(tree.getLeftChild());
        }
        if (tree.getRightChild() != null) {
            rDepth = maxDepth(tree.getRightChild());
        }
        /* use the larger one */
        if (lDepth > rDepth)
            return (lDepth + 1);
        else
            return (rDepth + 1);
    }
}

let root = new BinaryTree(0);
root.insertLeft('1')
root.getLeftChild().insertLeft('1.1')
root.getLeftChild().getLeftChild().insertRight('1.1.2')
root.insertRight('2')
root.getRightChild().insertRight('2.2')


function full(tree) {
    let curDepth = 0
    let depth = maxDepth(tree)
    if (tree.getLeftChild() === null && tree.getRightChild() === null) {
        return tree
    }
    if (tree.getLeftChild() === null || curDepth != depth) {
        tree.insertLeft(-1)
        curDepth++
        full(tree.getLeftChild())
    }
    if (tree.getRightChild() === null || curDepth != depth) {
        tree.insertRight(-1)
        curDepth++
        full(tree.getRightChild())
    }
    full(tree.getLeftChild())
    full(tree.getRightChild())
}

function printAll(tree) {
    if (tree) {
        console.log(tree.getRootVal())
        printAll(console.log(tree.getLeftChild()))
        printAll(console.log(tree.getRightChild()))
    }
}
printAll(root)
console.log('-------------------')

full(root)

printAll(root)