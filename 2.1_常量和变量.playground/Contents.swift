//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//声明常量（let，不能改变）和变量（var）
let maxNumeber=10

var currentNumber = 0

var x = 0.0,y=0.0,z=0.0

//类型标注（type annotation）
var welcomeMessage:String

welcomeMessage="Hello"

var red,green,blue:Double


//常量和变量的命名（可以使用任何字符作为常量和变量名，包括Unicode字符）
let π=3.14
let 你好 = "你好世界"
let ？？ = "dogCow"//必须是中文输入法下


//常量不可更改，切不可与变量相互转换
var friendMessage="boy"
friendMessage="girl"

let lanuagename = "chinese"
//lanuagename="english"//报错：note: change 'let' to 'var' to make it mutable


//输出常量和变量
print(friendMessage)

print("this is a string\(friendMessage)")


//注释，多行注释可以嵌套

/*
 第一个多行注释
 /*
 第二个多行注释
 */
 第一个多行注释
 */


//分号：分号在swift中不是必须的，但如果在同一行中需要多个独立的语句，中间需要用分号进行分割


//整数:分为有符号（正，负，零）和无符号（正，零），swift中提供了8，16，32和64位的有符号和无符号整型,命名方式UInt8,UInt32,UInt16,UInt64,

let minValue = UInt8.min//输出该整数类型范围的最小值
let maxValue = UInt8.max//输出该整数类型范围的最大值

//在32位平台上，int和int32长度相同；在64位平台上，int和int64长度相同

//浮点数：Float（32位浮点数）和Double（64位浮点数），比整数类型表示的范围更大


//类型安全和类型推断
//swift是一个类型安全（type safe）的语言。类型安全的语言可以让你清楚的知道代码要处理的值的类型。swift会在编译时进行类型检查（type checks），把不匹配的类型标记为错误。
//如果没有显式的指定类型，swift会使用类型推断（type inference）来选择合适的类型。


//数值型字面量
//整数字面量可以被写作：一个十进制数，没有前缀；一个二进制数，前缀是0b；一个八进制数，前缀是0o；一个十六进制数，前缀是0x。
let decimaIInterget=17
let binaryInteger = 0b10001
let ictaIInteger = 0o21
let hexadecumaIInteger=0x11

//浮点字面量可以是十进制或者是十六进制。小数两边必须有至少一个十进制数字（或者是十六进制的数字）。浮点字面量还有一个可选的指数（exponent,在十进制浮点数中通过大写或者小写的e来指定，在十六进制浮点数中通过大写或者小写的p来指定）

//例：*1.25e2表示1.25*10^2，等于125.0;*1.25e-2表示1.25*10^-2，等于0.01250
//例：*0xFp2表示15*2^2,等于60.0；*0xFp-2表示15*2^-2,等于3.75；

let dicimalDouble = 12.1875
let exponentdouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量
let paddedDouble=000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//数值类型转换
//整数转换

//let cannotBenegatibe:UInt8 = -1//negative integer '-1' overflows when stored into unsigned type 'UInt8',UInt8不能存储负数。
//let tooBig:Int8=Int8.max+1//arithmetic operation '127 + 1' (on type 'Int8') results in an overflow,Int8类型不能存储超过最大值的数

let twoThousand:UInt16 = 2_000
let one:UInt8=1
let twoThousandAndOne = twoThousand+UInt16(one)


//整数和浮点数转换,整数和浮点数的转换必须显示指定类型

let three=3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three)+pointOneFourOneFiveNine


//类型别名（type aliases）,就是给现有类型定义另一个名字

typealias AudioSample = UInt16
let audioSampleMax = AudioSample.max


//布尔值:(BOOL:true或者false)



//元组（tuples）,把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。

let http404Error = (404,"not found")

let (statusCode,statusMessage) = http404Error

print("status code is\(statusCode),status message is\(statusMessage)")

let (justStatusCode,_) = http404Error

print("status code is\(justStatusCode)")//只需要一部分元组的值

print("status code is\(http404Error.0),status message is\(http404Error.1)")//通过下标访问元素

let http200Status = (code:200,description:"OK")//给元组中单个元素命名

print("status code is\(http200Status.code),status message is\(http200Status.description)")//通过名字访问元素

//作为元素返回值时，元组非常有用；


//可选类型：使用可选类型来处理值可能缺失的情况。可选类型表示：有值，等于X;没有值，Swift中声明的一个变量时, 默认情况下它是non-optional的, 即必须赋予这个变量一个非空的值. 如果给non-optional类型的变量赋值nil, 编译器就会报错。http://www.cocoachina.com/swift/20160810/17330.html?utm_source=tuicool&utm_medium=referral，能够预防运行时错误，编译过程中就会报错

var serverResponseCode:Int?=404//serverResponseCode包含一个可选的Int值404
print(serverResponseCode!)//Optional(404)
serverResponseCode=nil//serverResponseCode现在不包含值
print(serverResponseCode)

var surveyAnswer:String?//声明一个可选常量或变量没有赋值，会被自动设置为nil


//if语句以及强制解析，当你确定可选类型确实包含值之后，你可以再可选的名字后面加一个感叹号（！），表示“我知道这个可选有值，请使用它”，这被称为可选值的强制解析。
if serverResponseCode != nil {
    print(serverResponseCode!)
}



//可选绑定（optional binding），用来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中来对可选类型的值进行判断并吧值赋给一个常量或者变量。

//多个可选绑定可以用逗号区分成一列表达式出现在一个 if 语句中。
//if let constantName = someOptional, anotherConstantName = someOtherOptional {
//    statements
//}


//隐式解析可选类型。如上所述，可选类型暗示了常量或者变量可以“没有值”。可选可以通过 if 语句来判断是否有值，如果有值的话可以通过可选绑定来解析值。有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。

//一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值。下面的例子展示了可选类型 String 和隐式解析可选类型 String 之间的区别：
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号来获取值
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // 不需要感叹号
//你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。
/*
 你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：
 if assumedString != nil {
 print(assumedString)
 }
 // 输出 "An implicitly unwrapped optional string."
 你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
 if let definiteString = assumedString {
 print(definiteString)
 }
 // 输出 "An implicitly unwrapped optional string."
 */




//错误处理（error handing）,应对程序中出错的条件，相对于可选中运用值的存在和缺失来表达函数的成功和失败，错误处理可以推断失败的原因，并传送至程序的其他部分

func canThrowAnErroe() throws{//函数中错误时可以抛出错误消息并合理处理
    
}

do{//创建了一个新的包含作用域，使得错误能被传播到一个或更多catch从句
    try canThrowAnErroe()
    //没有错误消息抛出
}catch{
    //有一个错误消息抛出
}

/*eg:
 func makeASandwich() throws {
 // ...
 }
 do {
 try makeASandwich()
 eatASandwich()
 } catch Error.OutOfCleanDishes{
 washDishes()
 } catch Error.MissingIngredients(let ingredients) {
 buyGroceries(ingredients)
 }
 在此例中， makeASandwich() （做一个三明治）函数会抛出一个错误消息如果没有干净的盘子或者某个原料缺
 失。因为 makeASandwich() 抛出错误，调用函数会被包裹在 try 表达式中。将函数包裹在一个 do 声明中,任何
 被抛出的错误会被传送到提供的 catch 从句中
 
 如果没有错误被抛出, eatASandwich() 函数会被调用。如果一个符合 Error.OutOfCleanDishes 的错误被抛
 出, washDishes 函数会被调用。如果一个符合 Error.MissingIngredients 的错误被抛出， buyGroceries(_:) 函
 数会被调用并传递相关被 catch 所捕捉到的 [String] 值。
 */



//断言（assertion）,可选类型可以让你判断值是否存在，能够优雅地处理值缺失的情况。然而，如果值缺失或者值并不满足特定的条件，代码可能无法继续执行。可以在代码中触发一个断言来结束代码运行并通过调试来找到缺失的原因。

let age = -3
assert(age>0, "A person age cannot be less than zero")
//何时使用断言：当条件可能为假时使用断言。
/*
 1.整数类型的下标索引被传入一个自定义下标脚本实现，但是下标索引值可能太小或者太大。
 2.需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
 3.一个可选值现在是nil,但是后面的代码运行需要一个非nin值。
 */















		
