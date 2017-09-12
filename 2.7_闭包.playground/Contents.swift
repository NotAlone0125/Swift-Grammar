//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//闭包（Closures）,闭包是自包含的函数代码块，可以在代码中被传递和使用。 Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 lambdas 函数比较相似。





//闭包表达式（Closure Expressions）

//sort 函数（The Sort Function）
//下面的闭包表达式示例使用 sort(_:) 方法对一个String类型的数组进行字母逆序排序
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backWard(s1:String,s2:String)->Bool
{
    return s1>s2
}
var reversed = names.sorted(by: backWard)
print(reversed)

//闭包表达式语法（Closure Expression Syntax）
/*
 闭包表达式语法有如下一般形式：
 { (parameters) -> returnType in
 statements
 }
 闭包表达式语法可以使用常量、变量和 inout 类型作为参数，不提供默认值。 也可以在参数列表的最后使用可变
 参数。 元组也可以作为参数和返回值。
 */
//下面的例子展示了之前 backwards 函数对应的闭包表达式版本的代码：
reversed = names.sorted(by:{ (s1:String,s2:String)->Bool in return s1>s2 })

//根据上下文推断类型（Inferring Type From Context）
/*
 因为排序闭包函数是作为 sort(_:) 方法的参数进行传入的，Swift可以推断其参数和返回值的类型。 sorted 期望
 第二个参数是类型为 (String, String) -> Bool 的函数，因此实际上 String , String 和 Bool 类型并不需要作为闭
 包表达式定义中的一部分。 因为所有的类型都可以被正确推断，返回箭头 ( -> ) 和围绕在参数周围的括号也可以
 被省略：
 */
reversed = names.sorted(by:{s1,s2 in return s1>s2})

//单表达式闭包隐式返回（Implicit Return From Single-Expression Clossures）
//单行表达式闭包可以通过隐藏 return 关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：
reversed = names.sorted(by:{ s1, s2 in s1 > s2 })

//参数名称缩写（Shorthand Argument Names）
//Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过 $0 , $1 , $2 来顺序调用闭包的参数。
reversed = names.sorted(by:{$0>$1})

//运算符函数（Operator Functions）
reversed = names.sorted(by: >)





//尾随闭包（Trailing Closures）,如果您需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
func someFunctionThatTakesACloseure(closure:()->Void)
{
    //函数体部分
}
//不使用尾随闭包
someFunctionThatTakesACloseure(closure: {
    
})
//使用尾随闭包
someFunctionThatTakesACloseure {
    
}
//例如
reversed = names.sorted(){$0>$1}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map{
    (number)->String in
    var output=""
    var copyNumber=number
    while copyNumber>0{
        output=digitNames[copyNumber % 10]! + output
        copyNumber /= 10
    }
    return output
}

//捕获值（Capturing Values）,闭包可以在其定义的上下文中捕获常量或变量。 即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
//Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
func makeIncrementor(forIncrement amount:Int)->()->Int{
    var runningTotal = 0
    func incrementor()->Int{
        runningTotal += amount
        return runningTotal
        /*
         incrementer 函数并没有任何参数，但是在函数体内访问了 runningTotal 和 amount 变量。这是因为其通过捕
         获在包含它的函数体内已经存在的 runningTotal 和 amount 变量的引用(reference)而实现。捕捉了变量引用,保
         证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失,并且保证了在下一次执行 increme
         nter 函数时, runningTotal 可以继续增加
         */
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()





//闭包是引用类型（Closures Are Reference Types）
//无论您将函数/闭包赋值给一个常量还是变量，您实际上都是将常量/变量的值设置为对应函数/闭包的引用。 上面的例子中， incrementByTen 指向闭包的引用是一个常量，而并非闭包内容本身。
//这也意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包：
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()


















