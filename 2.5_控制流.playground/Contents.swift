//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//For循环
/*
 for-in 循环对一个集合里面的每个元素执行一系列语句。
 for循环，用来重复执行一系列语句直到达成特定条件达成，一般通过在每次循环完成后增加计数器的值来实
 现。
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//如果你不需要知道区间内每一项的值，你可以使用下划线（ _ ）替代变量名来忽略对值的访问：
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}





//While 循环
/*
 while 循环运行一系列语句直到条件变成 false 。这类循环适合使用在第一次迭代前迭代次数未知的情况下。Sw
 ift 提供两种 while 循环形式：
 • while 循环，每次在循环开始时计算条件是否符合；
 • do-while 循环，每次在循环结束时计算条件是否符合。
 */
//eg：游戏示例图片#imageLiteral(resourceName: "屏幕快照 2017-08-04 02.42.10 PM.png")
/*
 游戏的规则如下：
 • 游戏盘面包括 25 个方格，游戏目标是达到或者超过第 25 个方格；
 • 每一轮，你通过掷一个 6 边的骰子来确定你移动方块的步数，移动的路线由上图中横向的虚线所示；
 • 如果在某轮结束，你移动到了梯子的底部，可以顺着梯子爬上去；
 • 如果在某轮结束，你移动到了蛇的头部，你会顺着蛇的身体滑下去。
 */

let finalSquare = 25
var board = Array.init(repeating: 0, count: finalSquare+1)//创建游戏盘面数组（25+1）
//指定方块设置指定值，值为前进或后退的步数
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

//玩家由左下角编号为 0 的方格开始游戏。一般来说玩家第一次掷骰子后才会进入游戏盘面：
var square = 0
var diceRoll = 0
//while square<finalSquare {
//    //掷骰子
//    diceRoll+=1
//    if diceRoll==7 {//任何时候如果 diceRoll 的值等于7时，就超过了骰子的最大值，会被重置为 1 。所以 diceRoll 的取值顺序会一直是 1 ， 2 ， 3 ， 4 ， 5 ， 6 ， 1 ， 2 。
//        diceRoll==1
//    }
//    print(diceRoll)
//    //根据点数移动
//    square+=diceRoll;
//    if square<board.count {//26
//        // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
//        square += board[square]
//    }
//}
//print("Sucess");


//Repeat-While,while 循环的另外一种形式是 repeat-while ，它和 while 的区别是在判断循环条件之前，先执行一次循环的代码块，然后重复循环直到条件为 false (类似do while)。
//依旧使用上面游戏的例子
//repeat{
//    // 顺着梯子爬上去或者顺着蛇滑下去
//    square += board[square]
//    // 掷骰子
//    diceRoll+=1
//    if diceRoll == 7 { diceRoll = 1 }
//    // 根据点数移动
//    square += diceRoll
//    print(diceRoll)
//}while square<finalSquare
//print("sucess")






//条件语句
//if
let temperatureInFahrenheit = 40
if temperatureInFahrenheit>20{
    
}
else if temperatureInFahrenheit>30{
    
}
else
{
    
}

//switch,switch 语句必须是完备的。这就是说，每一个可能的值都必须至少有一个 case 分支与之对应。在某些不可能涵盖所有值的情况下，你可以使用默认（ default ）分支满足该要求，这个默认分支必须在 switch 语句的最后面。
let someCharacter:Character="e"

switch someCharacter {
    
case "a","e","i","o","u":
    print("\(someCharacter) is a vowel")
    
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
    
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//不存在隐式的贯穿（No Implicit Fallthrough）,与 C 语言和 Objective-C 中的 switch 语句不同，在 Swift 中，当匹配的 case 分支中的代码执行完毕后，程序会终止 switch 语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用 break 语句。这使得 switch 语句更安全、更易用，也避免了因忘记写 break 语句而产生的错误。
//每一个 case 分支都必须包含至少一条语句。

//区间匹配
let approximateCount=62
let countedThings = "moons orbiting Saturn"
var naturalCount:String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//元组（Tuple）
let somepoint=(1,1)
switch somepoint {
case (0,0):
    print("(0.0) is at the origin")
case (_,0):
    print("\(somepoint.0,0) is on the x-axis")
case (0,_):
    print("\(0,somepoint.1) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somepoint.0), \(somepoint.1)) is inside the box")
default:
    print("(\(somepoint.0), \(somepoint.1)) is outside of the box")
}

//值绑定，case 分支的模式允许将匹配的值绑定到一个临时的常量或变量，这些常量或变量在该 case 分支里就可以被引用了——这种行为被称为值绑定（value binding）。
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//请注意，这个 switch 语句不包含默认分支。这是因为最后一个 case —— case let(x, y) 声明了一个可以匹配余下所有值的元组。这使得 switch 语句已经完备了，因此不需要再书写默认分支。

//Where，case分支的模式可以使用where语句来判断额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}





//控制转移语句（Control Transfer Statements）,continue,break,fallthrough,return,throw

//continue，告诉循环体立即停止本次循环，开始下次循环
let puzzleInPut="great minds think alike"
var puzzleOutput = ""

for character in puzzleInPut.characters
{
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

//Break,立即结束整个控制流的执行，当你想要更早的结束一个switch代码块或者一个循环体时，你都可以使用break语句。

//循环中的Break，当在一个循环体中使用 break 时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号( } )后的第一行代码。不会再有本次循环迭代的代码被执行，也不会再有下次的循环迭代产生。

//Switch 语句中的 break,当在一个 switch 代码块中使用 break 时，会立即中断该 switch 代码块的执行，并且跳转到表示 switch 代码块结束的大括号( } )后的第一行代码。

//贯穿（Fallthrough），Swift 中的 switch 不会从上一个 case 分支落入到下一个 case 分支中。相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个 switch 代码块完成了它的执行。相比之下，C 语言要求你显示的插入 break 语句到每个 switch 分支的末尾来阻止自动落入到下一个 case 分支中。
//如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用 fallthrough 关键字。
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

//带标签的语句
/*
 在 Swift 中，你可以在循环体和 switch 代码块中嵌套循环体和 switch 代码块来创造复杂的控制流结构。然
 而，循环体和 switch 代码块两者都可以使用 break 语句来提前结束整个方法体。因此，显示地指明 break 语句
 想要终止的是哪个循环体或者 switch 代码块，会很有用。类似地，如果你有许多嵌套的循环体，显示指明 conti
 nue 语句想要影响哪一个循环体也会非常有用。
 */
//游戏增加了一条额外的规则：为了获胜，你必须刚好落在第 25 个方块中。
gameLoop:while square != finalSquare{
    diceRoll+=1
    if diceRoll==7 {
        diceRoll=1
    }
    switch square + diceRoll {
    case finalSquare:
        //到达最后一个方块，游戏结束
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // 超出最后一个方块，再掷一次骰子
        continue gameLoop
    default:
        // 本次移动有效
        square += diceRoll
        square += board[square]
    }
}

//提前退出，像 if 语句一样， guard 的执行取决于一个表达式的布尔值。我们可以使用 guard 语句来要求条件必须为真时，以执行 guard 语句后的代码。不同于 if 语句，一个 guard 语句总是有一个 else 分句，如果条件不为真则执行 else 分局中的代码。

func greet(person:[String:String]){
    guard let name=person["name"] else {//key为“name”有值
        return
    }
    print("hello\(name)")
    
    guard let location=person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in\(location)")
}
greet(person: ["name":"YYH"])
greet(person: ["name":"YYH","location":"china"])
//相比于可以实现同样功能的 if 语句，按需使用 guard 语句会提升我们代码的可靠性。 它可以使你的代码连贯的被执行而不需要将它包在 else 块中，它可以使你处理违反要求的代码接近要求。

//检测API是否可用，Swift 有内置支持去检查接口的可用性的，这可以确保我们不会不小心地使用对于当前部署目标不可用的API。
if #available(iOS 9,OSX 10.10, *)
{
    // 在 iOS 使用 iOS 9 APIs , 并且在 OS X 使用 OS X v10.10 APIs
}
else
{
    // 回滚至早前 iOS and OS X 的API
}
//用在条件语句代码块中，判断不同的平台下，做不同的逻辑处理

//@available用法
//@available放在函数（方法），类或者协议前面。表明这些类型适用的平台和操作系统。看下面一个例子：
@available(iOS 9, *)
func myMethod() {
    // do something
}
















