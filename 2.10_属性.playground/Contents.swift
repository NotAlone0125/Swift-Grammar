//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//属性 (Properties)

//存储属性
/*
 简单来说，一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。存储属性可以是变量存储属
 性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）。
 */
//下面的例子定义了一个名为 FixedLengthRange 的结构体，它描述了一个在创建后无法修改值域宽度的区间：
struct fixedLengthRange{
    var firstValue:Int
    let length:Int
}
var range = fixedLengthRange.init(firstValue: 6, length: 5)
//range.length = 3//报错，不可变属性

//常量结构体的存储属性
let rangeTwo = fixedLengthRange.init(firstValue: 0, length: 4)
//rangeTwo.firstValue = 6//报错，不可变实例，即便属性可变，还是报错
//这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。

//延迟存储属性,延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。
//延迟属性很有用，当属性的值依赖于在实例的构造过程结束后才会知道具体值的外部因素时，或者当获得属性的初始值需要复杂或大量计算时，可以只在需要的时候计算它。
//例子
class DataImporter{
    /*
     DataImporter 是一个将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"
    // 这是提供数据导入功能
}
class DataManager{
    lazy var importer = DataImporter ()
    var data = String ()
    //这里提供管理数据
}
let manager = DataManager()
manager.data.appending("Some data")
manager.data.appending("Other data")//此时importer属性还没有被创建
//由于使用了 lazy ， importer 属性只有在第一次被访问的时候才被创建。比如访问它的属性 fileName 时：
print(manager.importer.fileName)

//存储属性和实例变量
/*
 如果您有过 Objective-C 经验，应该知道 Objective-C 为类实例存储值和引用提供两种方法。对于属性来
 说，也可以使用实例变量作为属性值的后端存储。
 Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直
 接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。一个类型中属性的全部
 信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。
 */






//计算属性，除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
struct Point{
    var x = 0.0 , y = 0.0
}
struct Size{
    var width = 0.0 , height = 0.0
}
struct Rect{
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point.init(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
    //Rect 也提供了一个名为 center 的计算属性。一个矩形的中心点可以从原点（ origin ）和尺寸（ size ）算出，所以不需要将它以显式声明的 Point 来保存。
}
var square = Rect.init(origin: Point.init(x: 0.0, y: 0.0), size: Size.init(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point.init(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//便捷 setter 声明(可以使用默认名称newValue)
struct AlternativeRect{
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point.init(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

//只读计算属性(可以去掉get关键字和花括号)
struct Cuboid{
    var width = 0.0,height = 0.0,depth = 0.0
    var volume:Double{
        return width*height*depth
    }
}
let cuboid = Cuboid.init(width: 5, height: 4, depth: 2)
print("The cuboid's Volume is \(cuboid.volume)")







//属性观察器
/*
 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相
 同的时候也不例外。
 可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性（包括
 存储属性和计算属性）添加属性观察器。
 
 可以为属性添加如下的一个或全部观察器：
 • willSet 在新的值被设置之前调用
 • didSet 在新的值被设置之后立即调用
 
 willSet 观察器会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称 newValue 表示。
 didSet 观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名 oldValue 。
 */
//例子
class StepCounter{
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet{
            if totalSteps>oldValue {
                print("Added \(totalSteps - oldValue)")
            }
        }
    }
}
let setpCounter = StepCounter()
setpCounter.totalSteps=20

setpCounter.totalSteps=360

setpCounter.totalSteps=896







//全局变量和局部变量
/*
 计算属性和属性观察器所描述的模式也可以用于全局变量和局部变量。全局变量是在函数、方法、闭包或任何类
 型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。
 前面章节提到的全局或局部变量都属于存储型变量，跟存储属性类似，它提供特定类型的存储空间，并允许读取
 和写入。
 另外，在全局或局部范围都可以定义计算型变量和为存储型变量定义观察器。计算型变量跟计算属性一样，返回
 一个计算的值而不是存储值，声明格式也完全一样。
 */







//类型属性,实例的属性属于一个特定类型实例，每次类型实例化后都拥有自己的一套属性值，实例之间的属性相互独立。也可以为类型本身定义属性，不管类型有多少个实例，这些属性都只有唯一一份。这种属性就是类型属性。

//类型属性语法,使用关键字 static 来定义类型属性。在为类（class）定义计算型类型属性时，可以使用关键字 class 来支持子类对父类的实现进行重写。下面的例子演示了存储型和计算型类型属性的语法：
struct SomeStructure{
    static var stroedTypePropety = "some value"
    static var computerTypePropety:Int{
        return 1
    }
}
enum SomeEnumeration{
    static var stroedTypePropety = "some value"
    static var computerTypePropety:Int{
        return 6
    }
}
class SomeClass{
    static var stroedTypePropety = "some value"
    static var computerTypePropety:Int{
        return 27
    }
    class var overrideableComputedTypePropety: Int {
        return 107
    }
}

//获取和设置类型属性的值,通过类型本身获取，而不需要初始化实例
SomeStructure.stroedTypePropety
SomeStructure.stroedTypePropety = "Another Value"
print("\(SomeStructure.stroedTypePropety)")
SomeEnumeration.computerTypePropety

//例子
struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel:Int = 0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel {
                //将新电平值设置为阀值
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                //存储当前电平值作为新的最大输入电平
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 11
AudioChannel.maxInputLevelForAllChannels






















