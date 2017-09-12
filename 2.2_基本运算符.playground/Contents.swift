//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//赋值运算符(=)
let b=10
var a = 5
a=b;

var (x,y) = (1,2)

//与C语言和object-c不同，Swift的赋值操作并不返回任何值
//if x=y//错误



//算术运算符（=，-,*，/），与 C 语言和 Objective-C 不同的是，Swift 默认情况下不允许在数值运算中出现溢出情况。但是你可以使用 Swift 的溢出运算符来实现溢出运算（如 a &+ b ）。
//加法运算符也可用于String的拼接
"hello"+"world"

//求余运算符（%）
//不同于C语言和Objective-C，Swift中是可以对浮点数进行求余的
//8%2.5//等于0.5,swift2.0的写法
let value1=8.0,value2=2.5
value1.truncatingRemainder(dividingBy: 2.5)

//自增自减
var i=0;
/*swift2.0
 ++i
 i--
 */
//swift3.0
i+=1
i-=1

//一元负号运算符
let three=3
let minusThree = -three

//一元正号运算符，不做任何改变地返回操作数的值，虽然一元 + 什么都不会改变，但当你在使用一元负号来表达负数时，你可以使用一元正号来表达正数，如此你的代码会具有对称美。




//复合赋值（Compound Assignment Operators）
var c=1
c+=2




//比较运算符,(每个比较运算都返回了一个标识表达式是否成立的布尔值)
1==1
2 != 1//"！"要和2分开写，不然程序会认为是可选值取值。
2>1
1<2
1>=1
2<=1




//三目运算符
let contengHeight=40
let hasHeader = true
let rowHeight = contengHeight+(hasHeader ? 50:20)




//空合运算符（a ?? b）,将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b ，这个运算符有两个条件：表达式 a 必须是Optional类型；默认值 b 的类型必须要和 a 存储值的类型保持一致

//空合并运算符是对以下代码的简短表达方法
var d:Int?
let e:Int=4

d != nil ? d! : e
//上述代码使用了三目运算符。当可选类型 a 的值不为空时，进行强制解封( a! )访问 a 中值，反之当 a 中值为空时，返回默认值b。无疑空合运算符( ?? )提供了一种更为优雅的方式去封装条件判断和解封两种行为，显得简洁以及更具可读性。

//下文例子采用空合并运算符，实现了在默认颜色名和可选自定义颜色名之间抉择：
let defaultColorname="red"
var userDefinedColorname:String?
var coolorNameToUse = userDefinedColorname ?? defaultColorname//如果userDefinedColorname为nil就选择defaultColorname
//另一种情况，分配一个非空值（non-nil）给userDefinedColorName，在此执行空合运算，运算结果为封包在userDefinedColorName中的值，而非默认值。
userDefinedColorname="green"
coolorNameToUse=userDefinedColorname ?? defaultColorname





//区间运算符
//闭区间运算符（a...b）
for index in 1...5//1-5的循环，包含1-5；
{
    
}
//半开区间运算符（a..<b）,不包含最后的值





//逻辑运算(!,&&,||)

















		