//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//下标脚本（Subscripts）
/*
 下标脚本 可以定义在类（Class）、结构体（structure）和枚举（enumeration）这些目标中，可以认为是访问
 集合（collection），列表（list）或序列（sequence的快捷方式，使用下标脚本的索引设置和获取值，不需要
 再调用实例的特定的赋值和访问方法。举例来说，用下标脚本访问一个数组(Array)实例中的元素可以这样写 so
 meArray[index] ，访问字典(Dictionary)实例中的元素可以这样写 someDictionary[key] 。
 */


//下标脚本语法，下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。语法类似于实例方法和计算型属性的混合。与定义实例方法类似，定义下标脚本使用 subscript 关键字，显式声明入参（一个或多个）和返回类型。与实例方法不同的是下标脚本可以设定为读写或只读。这种方式又有点像计算型属性的getter和setter：
//subscript(index:Int)->Int{
//    get{
//        //返回与入参匹配的Int类型的值
//    }
//    set(newValue){
//        //执行赋值操作
//    }
//}
//例子
struct TimesTable{
    let mulitiplier:Int
    subscript(index:Int)->Int{
        return mulitiplier * index
    }
}
let threeTimesTable = TimesTable.init(mulitiplier: 3)
threeTimesTable[6]






//下标脚本用法,根据使用场景不同下标脚本也具有不同的含义。通常下标脚本是用来访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。你可以在你自己特定的类或结构体中自由的实现下标脚本来提供合适的功能。
//例如在字典中的使用
var numberOfLegs = ["spider":8,"ant":6,"cat":4]
numberOfLegs["bird"] = 2






//下标脚本选项
/*
 下标脚本允许任意数量的入参索引，并且每个入参类型也没有限制。下标脚本的返回值也可以是任何类型。下标
 脚本可以使用变量参数和可变参数，但使用写入读出（in-out）参数或给参数设置默认值都是不允许的。
 
 一个类或结构体可以根据自身需要提供多个下标脚本实现，在定义下标脚本时通过入参个类型进行区分，使用下
 标脚本时会自动匹配合适的下标脚本实现运行，这就是下标脚本的重载。
 */
struct Matrix{
    let rows:Int,columns:Int
    var grid:[Double]
    init(rows:Int,columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array.init(repeating: 0, count: rows * columns)
    }
    func indexIsVaildForRow(row:Int,column:Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row:Int,column:Int)->Double{
        get{
            assert(indexIsVaildForRow(row: row, column: column),"index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsVaildForRow(row: row, column: column), "index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix.init(rows: 2, columns: 2)
matrix.grid

//通过下标赋值改变值
matrix[0,1] = 1.5
matrix[1,0] = 3.2
matrix.grid

//let somevalue = matrix[2,2]//触发断言






























