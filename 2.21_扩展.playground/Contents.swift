//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//扩展（Extensions）
/*
 扩展就是向一个已有的类、结构体、枚举类型或者协议类型添加新功能（functionality）。这包括在没有权限获取原始源代码的情况下扩展类型的能力（即逆向建模）。扩展和 Objective-C 中的分类（categories）类似。（不过与 Objective-C 不同的是，Swift 的扩展没有名字。）
 
 Swift 中的扩展可以：
 • 添加计算型属性和计算型静态属性
 • 定义实例方法和类型方法
 • 提供新的构造器
 • 定义下标
 • 定义和使用新的嵌套类型
 • 使一个已有类型符合某个协议
 TODO： 在 Swift 中，你甚至可以对一个协议(Procotol)进行扩展，提供协议需要的实现，或者添加额外的功能能够对合适的类型带来额外的好处
 */


//扩展语法（Extension Syntax）
//extension SomeType{
//   // 加到SomeType的新功能写到这里
//}

//一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议（protocol）。
//extension SomeType: SomeProtocol, AnotherProctocol {
//    // 协议实现写到这里
//}






//计算型属性（Computed Properties）
//扩展可以向已有类型添加计算型实例属性和计算型类型属性。
extension Double{
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneLnch = 25.4.mm
let threeFeet = 3.0.ft
let aMarathon = 42.0.km + 195.0.m






//构造器（Initializers）
/*
 扩展可以向已有类型添加新的构造器。这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提
 供该类型的原始实现中没有包含的额外初始化选项。
 
 扩展能向类中添加新的便利构造器，但是它们不能向类中添加新的指定构造器或析构器。指定构造器和析构器必
 须总是由原始的类实现来提供
 */
struct Size{
    var width = 0.0,height = 0.0
}
struct Point{
    var x = 0.0,y = 0.0
}
struct Rect{
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()//默认构造器
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))//逐一成员构造器

extension Rect{
    init(center:Point,size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
//这个新的构造器首先根据提供的 center 和 size 值计算一个合适的原点。然后调用该结构体自动的逐一成员构造器 init(origin:size:) ，该构造器将新的原点和大小存到了合适的属性中：
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))





//方法（Methods）
//扩展可以向已有类型添加新的实例方法和类型方法。
extension Int{//实现多次执行
    func repetitions(task:()->()) {
        for i in 0..<self{
            task()
        }
    }
}

3.repetitions {
    print("Hello")
}

//修改实例方法（Mutating Instance Methods）
//通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating ，正如来自原始实现的修改方法一样。
extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()







//下标（Subscripts）
//扩展可以向一个已有类型添加新下标。这个例子向Swift内建类型 Int 添加了一个整型下标。该下标 [n] 返回十进制数字从右向左数的第n个数字
extension Int{
    subscript(digitIndex:Int) -> Int{
        var digitIndexCopy = digitIndex
        var decimalBase = 1
        while digitIndexCopy > 0{
            decimalBase *= 10
            digitIndexCopy -= 1
        }
        return (self/decimalBase)%10
    }
}

76584357[0]
76584357[5]
//如果该 Int 值没有足够的位数，即下标越界，那么上述实现的下标会返回0，因为它会在数字左边自动补0：
76584357[8]






//嵌套类型（Nested Types）
//扩展可以向已有的类、结构体和枚举添加新的嵌套类型：
extension Int{
    enum Kind {//添加了新的嵌套枚举。
        case Negative,Zero,Positive
    }
    
    var kind:Kind {
        switch self {//添加了一个新的计算实例属性
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("-", separator: "", terminator:"")
        case .Zero:
            print("0", separator: "", terminator:"")
        case .Positive:
            print("+", separator: "", terminator:"")
        }
    }
    print("")
}
printIntegerKinds(numbers: [3, 19, -27, 0, -6, 0, 7])

















