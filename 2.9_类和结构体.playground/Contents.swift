//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类和结构体,类和结构体是人们构建代码所用的一种通用且灵活的构造体。我们可以使用完全相同的语法规则来为类和结构体定义属性（常量、变量）和添加方法，从而扩展类和结构体的功能。
/*
 类和结构体对比
 Swift 中类和结构体有很多共同点。共同处在于：
 • 定义属性用于存储值
 • 定义方法用于提供功能
 • 定义附属脚本用于访问值
 • 定义构造器用于生成初始化值
 • 通过扩展以增加默认实现的功能
 • 实现协议以提供某种标准功能
 
 与结构体相比，类还有如下的附加功能：
 • 继承允许一个类继承另一个类的特征
 • 类型转换允许在运行时检查和解释一个类实例的类型
 • 解构器允许一个类实例释放任何其所被分配的资源
 • 引用计数允许对一个类的多次引用
 */





//定义
class SomeClass{
    var width = 0
    var height = 0
    
}
struct SomeStruct{
    var resolution = true
    var name:String?
}

//类和结构体实例
let someClass = SomeClass()
let someSttuct = SomeStruct()

//属性访问
someClass.height
someSttuct.name

//结构体类型的成员逐一构造器(Memberwise Initializers for Structure Types),所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中：
let vga=SomeStruct(resolution: true, name: "YYH")





//结构体和枚举是值类型
let hd = SomeStruct.init(resolution: true, name: "YS")
var cinema = hd
cinema.resolution = false
print("hd.resolution is \(hd.resolution),cinema.resolution is \(cinema.resolution)")
//枚举同样遵从该规则




//类是引用类型
let oneClass = SomeClass()
oneClass.height = 20
oneClass.width = 40

let twoClass = oneClass
twoClass.width = 30
print("one width is \(oneClass.width)")

//类的实例的恒等运算符(等价于“===”，不等价于“！==”)
if oneClass === twoClass{
    print("true")
}
if oneClass !== twoClass{
    print("flase")
}

//指针
/*
 如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地
 址。一个 Swift 常量或者变量引用一个引用类型的实例与 C 语言中的指针类似，不同的是并不直接指向内存中的
 某个地址，而且也不要求你使用星号（*）来表明你在创建一个引用。Swift 中这些引用与其它的常量或变量的定
 义方式相同。
 */





//类和结构体的选择
/*
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 • 结构体的主要目的是用来封装少量相关简单数据值。
 • 有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
 • 任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
 • 结构体不需要去继承另一个已存在类型的属性或者行为。
 
 在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的
 自定义数据构造都应该是类，而非结构体。
 */






//字符串(String)、数组(Array)、和字典(Dictionary)类型的赋值与复制行为
//Swift 中 字符串（String） , 数组（Array） 和 字典（Dictionary） 类型均以结构体的形式实现,OC中是以类的形式实现，NSString，NSArray，NSDictionary在发生赋值或者传入函数（或方法）时，不会发生值拷贝，而是传递已存在实例的引用。



























