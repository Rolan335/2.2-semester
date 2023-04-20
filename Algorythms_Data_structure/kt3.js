class Node {
    constructor(data, next = null) {
        this.data = data
        this.next = next
    }
}

class List {
    constructor() {
        this.head = null
        this.tail = null
    }
    insert(data) {
        const newNode = new Node(data, this.head)
        this.head = newNode
        if (!this.tail) {
            this.tail = newNode
        }
        return this
    }
    append(data) {
        const newNode = new Node(data)
        if (!this.head || !this.tail) {
            this.head = newNode
            this.tail = newNode
            return this
        }
        this.tail.next = newNode
        this.tail = newNode
        return this
    }
    remove() {
        if (!this.head) {
            return null;
        }

        const deletedHead = this.head;
        if (this.head.next) {
            this.head = this.head.next;
        } else {
            this.head = null;
            this.tail = null;
        }

        return deletedHead;
    }
    delete() {
        if (!this.tail) {
            return null;
        }
        const deletedTail = this.tail;
        if (this.head === this.tail) {
            this.head = null;
            this.tail = null;

            return deletedTail;
        }
        let currentNode = this.head;
        while (currentNode.next) {
            if (!currentNode.next.next) {
                currentNode.next = null;
            } else {
                currentNode = currentNode.next;
            }
        }
        this.tail = currentNode;

        return deletedTail;
    }
    iterate() {
        let currentNode = this.head
        while (currentNode) {
            console.log(currentNode.data)
            currentNode = currentNode.next;
            console.log(currentNode)
        }
    }
    size() {
        let count = 0
        let current = this.head
        while (current) {
            count++
            current = current.next
        }
        console.log(count)
    }
}

const list = new List()

list.append('first')
list.append('second')
list.insert('head')
list.append('tail')
list.iterate()
list.size()
list.delete()
list.remove()
list.size()
list.iterate()
list.delete()
list.remove()
list.size()


// представим стек в виде массива
// let m = []
// m.push('x')
// m.push('y')
// m.pop()
// m.push('z')
// console.log(m[m.length - 1])
// A - ответ z

let m = []
m.push('x')
m.push('y')
m.push('z')
while (m.length != 0) {
    m.pop()
    m.pop()
}
//последний m.pop() в любом случае отработает - выведется undefined,
// а также, стек будет очищен

//3
class Queue {
    queue = []
    enqueue(item) {
        this.queue.push(item)
    }
    dequeue() {
        this.queue.shift()
    }
    get arr() {
        return this.queue
    }
}

let q = new Queue()
q.enqueue('hello')
q.enqueue('dog')
q.enqueue(3)
q.dequeue()
console.log(q.arr)
// 1й в очереди - dog 2й в очереди - 3. Hello вышел из очереди

function schitalochka(num, guys) {
    let circle = new Queue()
    guys.forEach((i) => {
        circle.enqueue(i)
    });
    circle = circle.arr.reverse()
    let fullArr = []
    let count = 0
    for (num; num >= 0; num--) {
        fullArr.push(circle[count])
        count++
        if (count == guys.length) {
            count = 0
        }
    }
    console.log(fullArr)
    return fullArr[fullArr.length - 1]
}

console.log(schitalochka(16, ['Petya', 'Lena', 'Gena', 'Vitya', 'Sasha']))