//1
class Rect {
    topLeft: number;
    bottomRight: number;
    height: number;
    width: number;

    constructor();
    constructor(topLeft: number, bottomRight: number, width: number, height: number)
    constructor(topLeft?: number, bottomRight?: number, width?: number, height?: number) {
        this.topLeft = topLeft || 0;
        this.bottomRight = bottomRight || 0;
        this.width = width || 0
        this.height = height || 0
    }
}