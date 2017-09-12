//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//枚举（Enumerations）,枚举定义了一个通用类型的一组相关值，使你可以在你的代码中以一种安全的方式来使用这些值。
/*
 在 Swift 中，枚举类型是一等公民（first-class）。它们采用了很多传统上只被类（class）所支持的特征，例如
 计算型属性（computed properties），用于提供关于枚举当前值的附加信息， 实例方法（instance method
 s），用于提供和枚举所代表的值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；可
 以在原始的实现基础上扩展它们的功能；可以遵守协议（protocols）来提供标准的功能。
 */



//枚举语法
enum SomeEnumeration{
    case north
    case south
    case east
    case west
}
//多个成员值可以出现在同一行上
enum Planet{
    case Mercury,Venus,Mars
}

//每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如 CompassPoint 和 Planet ）必须以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：
var directionToHead = SomeEnumeration.east
//当 directionToHead 的类型已知时，再次为其赋值可以省略枚举名。使用显式类型的枚举值可以让代码具有更好的可读性。
directionToHead = .north





//匹配枚举值和 Switch 语句
switch directionToHead{
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
}




//相关值（Associated Values）
//如果有时候能够把其他类型的相关值和成员值一起存储起来会很有用。这能让你存储成员值之外的自定义信息，并且当你每次在代码中使用该成员时允许这个信息产生变化
enum Barcode{
    case UPCA(Int,Int,Int,Int)//代表条形码
    case QRCode(String)//代表二维码
}
var productBarcode = Barcode.UPCA(1, 1, 1, 1)
productBarcode = .QRCode("ABCD")
//同一个商品可以被分配给一个不同类型的条形码。像以前那样，不同的条形码类型可以使用一个 switch 语句来检查，然而这次相关值可以被提取作为 switch 语句
//你可以在 switch 的 case 分支代码中提取每个相关值作为一个常量（用 let 前缀）或者作为一个变量（用 var 前缀）来使用
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
    //let前缀的两种方式
}





//原始值（Raw Values）:作为相关值的另一种选择，枚举成员可以被默认值（称为原始值）赋值，其中这些原始值具有相同的类型。
enum ASCIIControlCharacter:Character{
    case Tab="\t"
    case LineFeed="\n"
    case CarriageReturn="\r"
}
//原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。

//原始值的隐式赋值（Implicitly Assigned Raw Values）,在使用原始值为整数或者字符串类型的枚举时，不需要显式的为每一个成员赋值，这时，Swift将会自动为你赋值。
enum Plant:Int{
    case Mecury=1,venues,Earth//默认第一个为0，递增1
}

enum poiot:String{
    case east,west//默认为east，west
}

let earthsOrder = Plant.Earth.rawValue//获取枚举对象的原始值

//使用原始值来初始化(Initializing from a Raw Value)
//使用原始值初始化枚举变量（Initializing from a Raw Value）
let possinleplant = Plant.RawValue(7)//如果使用了原始值，会自动获得初始化方法rewvalue，使用该初始方法可以创建一个新的枚举变量

//然而，并非所有可能的 Int 值都可以找到一个匹配的行星。正因为如此，构造函数可以返回一个可选的枚举成员
let positionToFind = 9
if let somePlanet = Plant(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}




//递归枚举（Recursive Enumerations）
//enum ArithmeticExpression{
//    case Number(Int)
//    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}
//也在枚举类型的开头加上indirect关键字来表示它的所有成员都是可递归的,
indirect enum ArithmeticExpression{
    case Number(Int)
    
    //或者加载分支前
    //indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//例如
func evaluate(expression: ArithmeticExpression)->Int{
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(expression: left) + evaluate(expression: right)
    case .Multiplication(let left, let right):
        return evaluate(expression: left) * evaluate(expression: right)
    }
}
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(expression: product))





















