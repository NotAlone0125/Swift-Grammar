//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//字符串字面量（String literals）
/*
 您可以在您的代码中包含一段预定义的字符串值作为字符串字面量。字符串字面量是由双引号 ("") 包裹着的具有
 固定顺序的文本字符集。 字符串字面量可以用于为常量和变量提供初始值：
 let someString = "Some string literal value"
 注意 someString 常量通过字符串字面量进行初始化，Swift 会推断该常量为 String 类型。
 */




//初始化空字符串 (Initializing an Empty String)
var emptyString=""
var anotherEmptyString = String()
//判空
if emptyString.isEmpty
{
    
}




//字符串可变性 (String Mutability)
var variableString="horse"
variableString+=" and carriage"




/*
 字符串是值类型（Strings Are Value Types）， 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操
 作。
 */




//使用字符（Working with Characters）
//利用for遍历字符串的字符
for character in "world".characters
{
    
}
//声明字符类型，简历独立字符常量或变量
let exclamationMark:Character="!"
let catCharacter:[Character] = ["c","a","t","s",exclamationMark];
let catString = String(catCharacter)




//连接字符串和字符 (Concatenating Strings and Characters)

let string1 = "hello"
let string2 = " three"
var welCome = string1+string2

var instruction = "look over"
instruction+=string2

welCome.append(exclamationMark)




//字符串插值 (String Interpolation)，字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。 您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中：
let multiplier=3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"




//Unicode，Unicode 是一个国际标准，用于文本的编码和表示。 它使您可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。 Swift 的字符串和字符类型是完全兼容 Unicode 标准的。

//Unicode 标量（Unicode Scalars），Swift 的 String 类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符的唯一21位数字或者修饰符，例如 U+0061 表示小写的拉丁字母( LATIN SMALL LETTER A )(" a ")， U+1F425 表示小鸡表情( FRONT-FACING BABY CHICK ) (" ? ")

//字符串字面量的特殊字符 (Special Characters in String Literals)
/*
 字符串字面量可以包含以下特殊字符：
 • 转义字符 \0 (空字符)、 \\ (反斜线)、 \t (水平制表符)、 \n (换行符)、 \r (回车符)、 \" (双引号)、 \' (单引
 号)。
 • Unicode 标量，写成 \u{n} (u为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位码。
 */
let wiseWords="\"imagination is more important than knowledge\"-Einstein"
let dollarSign = "\u{24}"//Unicode 标量 U+0024
let blackHeart = "\u{2665}"//Unicode 标量 U+2665
let sparklingheart = "\u{1F496}"//Unicode 标量 U+1F496

//可扩展的字形群集(Extended Grapheme Clusters)
/*
 每一个 Swift 的 Character 类型代表一个可扩展的字形群。 一个可扩展的字形群是一个或者更多可生成人类可读
 的字符 Unicode 标量的有序排列。 举个例子，字母 é 可以用单一的 Unicode 标量 é ( LATIN SMALL LETTE
 R E WITH ACUTE , 或者 U+00E9 )来表示。然而一个标准的字母 e ( LATIN SMALL LETTER E 或者 U+006
 5 ) 加上一个急促重音( COMBINING ACTUE ACCENT )的标量( U+0301 )，这样一对标量就表示了同样的字母
 é。 这个急促重音的标量形象的将 e 转换成了 é。 在这两种情况中，字母 é 代表了一个单一的 Swift 的字符
 串，同时代表了一个可扩展的字形群。 在第一种情况，这个字形群包含一个单一标量；而在第二种情况，它是包
 含两个标量的字形群：
 */
let eAcute:Character = "\u{E9}"
let combinedEacute:Character = "\u{65}\u{301}"

let precomposed:Character = "\u{D55c}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"




//计算字符数量 (Counting Characters)
let unusualMenagerie = "Koala ?, Snail ?, Penguin ?, Dromedary ?"
print("unusualMenagerie has \(unusualMenagerie.characters.count) character")

//注意在 Swift 中，使用可拓展的字符群集作为字符来连接或改变字符串时，并不一定会更改字符串的字符数量。
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in cafe is 4"
word += "\u{301}" // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in café is 4




//访问和修改字符串 (Accessing and Modifying a String)

//字符串索引 (String Indices)
let greeting="guten tag"
print(greeting.startIndex)
print(greeting.endIndex)

greeting[greeting.startIndex]
greeting[greeting.index(after:  greeting.startIndex)]//越界会报错
greeting[greeting.index(before: greeting.endIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 4)


//插入和删除
var come="hello"
come.insert("!", at: come.endIndex)//插入字符
come.insert(contentsOf: " world".characters, at: come.endIndex)//插入字符串

come.remove(at: index)//不能直接填数字，greeting.index(greeting.startIndex, offsetBy: 4)
let range1=come.index(come.endIndex, offsetBy: -3)..<come.endIndex
come.removeSubrange(range1)





//比较字符串

//字符串/字符相等或不等（==，！=）
let quotation="quotation"
let sameQuotation = "quotation"
if quotation==sameQuotation {
    print("相等")
}

//前缀/后缀相等
let prefix1="prefixOne"
let prefix2 = "prefixTwo"
let stringArray:[String] = [prefix1,prefix2]
for prefixString in stringArray
{
    if prefixString.hasPrefix("prefix") {
        print("前缀")
    }
    if prefixString.hasSuffix("One") {
        print("后缀")
    }
}





//字符串的 Unicode 表示形式（Unicode Representations of Strings）






























		
