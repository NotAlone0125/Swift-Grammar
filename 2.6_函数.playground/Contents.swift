//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//函数的定义与调用（Defining and Calling Functions）
func sayHello(personName:String)->String{
    let greetString = "Hello," + personName + "!"
    return greetString
}
sayHello(personName: "YYH")





//函数参数与返回值（Function Parameters and Return Values）

//多重输入参数（Multiple Input Parameters）
func halfOpenRangeLength(start:Int ,end:Int)->Int{
    return end-start
}
halfOpenRangeLength(start: 5, end: 10)

//无参函数（Functions Without Parameters）
func sayHelloWorld()->String{
    return "Hello World"
}
sayHelloWorld()

//多参量函数 (Functions With Multiple Parameters)
func sayHi(personName:String,alreadyGreeted:Bool)->String{
    if alreadyGreeted {
        return "Hello again," + personName + "!"
    }
    else
    {
        return "Hello," + personName + "!"
    }
}
sayHi(personName: "YYH", alreadyGreeted: true)

//无返回值函数（Functions Without Return Values）
func sayGoodBye(personName:String){
    print("Goodbye, \(personName)!")
}
sayGoodBye(personName: "YYH")

//被调用时，一个函数的返回值可以被忽略：
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint: stringToPrint)
}
printAndCount(stringToPrint: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(stringToPrint: "hello, world")
// prints "hello, world" but does not return a value

//多重返回值函数
func minMax(array:[Int])->(min:Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]
    {
        if value<currentMin
        {
            currentMin=value
        }
        else if value>currentMax
        {
            currentMax=value
        }
    }
    return (currentMin,currentMax)
}
let bounds = minMax(array: [8,-6,2,109,3,71])
print("minis \(bounds.min) and max is \(bounds.max)")
//函数不会在数组中执行任何安全检查,如果 array参数有一个空数组,如上定义的 minMax(_:) 在试图访问 array[0] 时会触发一个运行时错误,因此可以在函数的第一句前加入判空处理（if array.isEmpty { return nil }）





//函数参数名称（Function Parameter Names）：函数参数都有一个外部参数名(external parameter name)和一个本地参数名(local parameter name).外部参数名用来标记传递给函数调用的参数,本地参数名在实现函数的时候使用.

//指定外部参数名(Specifying External Parameter Names)
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}
someFunction(externalParameterName: 6)

//忽略外部参数名(Omitting External Parameter Names),如果你不想为第二个及后续的参数设置参数名,用一个下划线(_)代替一个明确地参数名.
/////////////////swift3.0中第一个外部参数必须显示指明////////////////////
func someFunctionTwo(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunctionTwo(firstParameterName: 1, 2)

//默认参数值（Default Parameter Values）,你可以在函数体中为每个参数定义 默认值(Deafult Values) 。当默认值被定义后，调用这个函数时可以忽略这个参数。
func someFunctionThree(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no arguments are passed to the function call,
    // value of parameterWithDefault is 42
}
someFunctionThree(parameterWithDefault: 6) // parameterWithDefault is 6
someFunctionThree() // parameterWithDefault is 12

//可变参数（Variadic Parameters）,一个 可变参数（variadic parameter） 可以接受零个或多个值。函数调用时，你可以用可变参数来传入不确定数量的输入参数。通过在变量类型名后面加入 （...） 的方式来定义可变参数。
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(numbers: 3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
//如果函数有一个或多个带默认值的参数，而且还有一个可变参数，那么把可变参数放在参数表的最后

//常量参数和变量参数（Constant and Variable Parameters）,函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。通过在参数名前加关键字 var 来定义变量参数
func alignRight( string: String, totalLength: Int, pad: Character) -> String {
    var string = string
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(string: originalString, totalLength: 10, pad: "-")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello"

//输入输出参数（In-Out Parameters）,变量参数，正如上面所述，仅仅能在函数体内被更改。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
//定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。
func swapTwoInts( a:inout Int, b:inout Int){
    let temporary = a
    a=b
    b=temporary
}
var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")





//函数类型（Function Types）

//使用函数类型（Using Function Types）,在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将函数赋值给它
func addTwoInts(numberA:Int,numberb:Int)->Int
{
    return numberA+numberb
}
var mathFunction:(Int,Int)->Int = addTwoInts

//函数类型作为参数类型（Function Types as Parameter Types）
func printMathResult(_ mathFunction:(Int,Int)->Int,numberA:Int,numberB:Int)
{
    print("result:\(mathFunction(numberA,numberB))")
}
printMathResult(mathFunction, numberA: 3, numberB: 5)

//函数类型作为返回类型（Function Type as Return Types）
func stepForward(input:Int)->Int
{
    return input+1
}
func stepBackWard(input:Int)->Int
{
    return input-1
}
func chooseStepFunction(backWards:Bool)->(Int)->Int
{
    return backWards ? stepBackWard:stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backWards: currentValue>0)
moveNearerToZero(3)

//嵌套函数（Nested Functions）,你也可以把函数定义在别的函数体中，称作嵌套函数（nested functions）。
//默认情况下，嵌套函数是对外界不可见的，但是可以被他们封闭函数（enclosing function）来调用。一个封闭函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
func chooseStepFunctionTwo(backWards:Bool)->(Int)->Int
{
    func stepForward(input: Int)->Int{return input+1}
    func stepBackWard(input: Int)->Int{return input-1}
    return backWards ? stepBackWard:stepForward
}












































