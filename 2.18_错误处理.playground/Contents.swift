//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 错误处理是响应错误以及从错误中返回的过程。swift提供第一类错误支持，包括在运行时抛出，捕获，传送和控
 制可回收错误。
 
 一些函数和方法不能总保证能够执行所有代码或产生有用的输出。可空类型用来表示值可能为空，但是当函数执
 行失败的事后，可空通常可以用来确定执行失败的原因，因此代码可以正确地响应失败。在Swift中，这叫做抛出
 函数或者抛出方法。
 */

//错误的表示：在Swift中，错误用符合 ErrorType 协议的值表示。 Swift枚举特别适合把一系列相关的错误组合在一起，同时可以把一些相关的值和错误关联在一起。因此编译器会为实现 ErrorType 协议的Swift枚举类型自动实现相应合成。
enum VendingMachineError:Error{
    case InvalidSelection
    case InsufficientFunds(required: Double)
    case OutOfStock
}

//错误抛出 通过在函数或方法声明的参数后面加上 throws 关键字，表明这个函数或方法可以抛出错误。如果指定一个返回值，可以把 throws 关键字放在返回箭头(->)的前面。除非明确地指出，一个函数，方法或者就闭包不能抛出错误。
//func canThrowErrors() throws -> String
//func cannotThrowErrors() throws -> String

struct Item{
    var price:Double
    var count:Int
}

var inventory =  [
    "Candy Bar": Item(price: 1.25, count: 7),
    "Chips": Item(price: 1.00, count: 4),
    "Pretzels": Item(price: 0.75, count: 11)
]
var amountDeposited = 1.00

func vend(itemNamed name:String) throws {
    guard var item = inventory[name] else {
        throw VendingMachineError.InvalidSelection
    }//先查找是否有库存，没有的话抛异常
    
    guard item.count > 0 else {
        throw VendingMachineError.OutOfStock
    }//物品数量为小于等于0，抛异常
    
    if amountDeposited >= item.price {
        amountDeposited -= item.price
        item.count -= 1
        inventory[name] = item
    }else{
        let amountRequired = item.price - amountDeposited
        throw VendingMachineError.InsufficientFunds(required: amountRequired)
    }//购买资金不足，抛异常，同时将缺少的金额赋值给该错误的关联值
}

//当调用一个抛出函数的时候，在调用前面加上 try 。这个关键字表明函数可以抛出错误，而且在 try 后面代码将不会执行。
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person:String) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"//如果这个人在列表中没有喜欢的零食，就会购买 Candy Bar
    try vend(itemNamed: snackName)
}

//捕捉和处理错误
//使用do-catch语句来就捕获和处理错误
do{
    try vend(itemNamed: "Candy Bar")
}catch VendingMachineError.InvalidSelection{
    print("Invalid Selection")
}catch VendingMachineError.OutOfStock{
    print("Out of Stock.")
}catch VendingMachineError.InsufficientFunds(required: let amountRequired){
    print("Insufficient funds. Please insert an additional $\(amountRequired).")
}

//禁止错误传播
/*
 在运行时，有几种情况抛出函数事实上是不会抛出错误的。在这几种情况下，你可以用 forced-try 表达式来调用
 抛出函数或方法，即使用 try! 来代替 try 。
 
 通过 try! 来调用抛出函数或方法禁止了错误传送，并且把调用包装在运行时断言，这样就不会抛出错误。如果错
 误真的抛出了，会触发运行时错误。
 */

//func willOnlyThrowIfTrue(value: Bool) throws {
//    if value { throw someError }
//}
//do {
//    try willOnlyThrowIfTrue(false)
//} catch {
//    // Handle Error
//}
//try! willOnlyThrowIfTrue(false)


//收尾操作
/*
 使用defer语句来在执行一系列的语句。这样不管有没有错误发生，都可以执行一些必要的收尾操作。包括关闭打
 开的文件描述符以及释放所有手动分配的内存。
 
 defer 语句把执行推迟到退出当前域的时候。 defer 语句包括 defer 关键字以及后面要执行的语句。被推迟语
 句可能不包含任何将执行流程转移到外部的代码，比如 break 或者 return 语句，或者通过抛出一个错误。被推
 迟的操作的执行的顺序和他们定义的顺序相反，也就是说，在第一个 defer 语句中的代码在第二个 defer 语句中
 的代码之后执行。
 */
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
}
//上面这个例子使用了 defer 语句来保证 open 有对应的 close 。这个调用不管是否有抛出都会执行。











