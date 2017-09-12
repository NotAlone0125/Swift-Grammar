//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//方法（Methods）,方法是与某些特定类型相关联的函数。

//实例方法 (Instance Methods)
//实例方法是属于某个特定类、结构体或者枚举类型实例的方法。实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能
//例子
class Counter{
    var count = 0
    func incremment() {
        count += 1
    }
    func incrementBy(amount:Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.incremment()
counter.incrementBy(amount: 5)
counter.reset()

//方法的局部参数名称和外部参数名称(Local and External Parameter Names for Methods)
//函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用），方法参数也一样（因为方法就是函数，只是这个函数与某个类型相关联了）。
//例子
class CounterTwo{
    var count:Int = 0
    func incrementBy(amount:Int,numberOfTimes:Int) {
        count += amount * numberOfTimes
    }
}
let counterTwo = CounterTwo()
counterTwo.incrementBy(amount: 5, numberOfTimes: 3)

//修改方法的外部参数名称(Modifying External Parameter Name Behavior for Methods)
/*
 有时为方法的第一个参数提供一个外部参数名称是非常有用的，尽管这不是默认的行为。你可以自己添加一个显
 式的外部名称或者用一个井号（ # ）作为第一个参数的前缀来把这个局部名称当作外部名称使用。
 相反，如果你不想为方法的第二个及后续的参数提供一个外部名称，可以通过使用下划线（ _ ）作为该参数的显
 式外部名称，这样做将覆盖默认行为。
*/

//self 属性(The self Property),类型的每一个实例都有一个隐含属性叫做 self ， self 完全等同于该实例本身。你可以在一个实例的实例方法中使用这个隐含的 self 属性来引用当前实例。
//例如
class CounterThree{
    var count:Int = 0
    func incrementBy() {
        self.count += 1
    }
}
//实际上，你不必在你的代码里面经常写 self 。如果你没有明确的写 self ，Swift 假定你是指当前实例的属性或者方法。主要是为了避免一些参数和实例属性同名时的歧义，例如：
struct Point{
    var x = 0.0,y = 0.0
    func isTheRightOfX(x:Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point.init(x: 4.0, y: 5.0)
if somePoint.isTheRightOfX(x: 1.0) {
    print(">")
}

//在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
//结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
/*
 但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择 变异(mutating) 这个方
 法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。方法
 还可以给它隐含的 self 属性赋值一个全新的实例，这个新实例在方法结束后将替换原来的实例。
 */
struct PointTwo{
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX:Double,deltaY:Double){
        x += deltaX
        y += deltaY
    }
}
var twoPoint = PointTwo.init(x: 1.0, y: 1.0)
twoPoint.moveByX(deltaX: 5.0, deltaY: 5.0)
//不能在结构体类型常量上调用变异方法，因为常量的属性不能被改变，即使想改变的是常量的变量属性也不行

//在变异方法中给self赋值(Assigning to self Within a Mutating Method)
struct PointThree{
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX:Double,deltaY:Double){
        self = PointThree.init(x: x+deltaX, y: y+deltaY)
    }
}
//枚举的变异方法应用
enum TriStateSwitch{
    case off,low,high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()






//类型方法 (Type Methods)
/*
 实例方法是被类型的某个实例调用的方法。你也可以定义类型本身调用的方法，这种方法就叫做类型方法。声明
 结构体和枚举的类型方法，在方法的 func 关键字之前加上关键字 static 。类可能会用关键字 Class 来允许子类
 重写父类的实现方法。
 */
class SomeClass{
    class func someTypeMethod(){
        
    }
}
SomeClass.someTypeMethod()

/*
 在类型方法的方法体（body）中， self 指向这个类型本身，而不是类型的某个实例。对于结构体和枚举来
 说，这意味着你可以用 self 来消除静态属性和静态方法参数之间的歧义（类似于我们在前面处理实例属性和实例
 方法参数时做的那样）。

 一般来说，任何未限定的方法和属性名称，将会来自于本类中另外的类型级别的方法和属性。一个类型方法可以
 调用本类中另一个类型方法的名称，而无需在方法名称前面加上类型名称的前缀。同样，结构体和枚举的类型方
 法也能够直接通过静态属性的名称访问静态属性，而不需要类型名称前缀。
 */
struct LevelTracker{
    static var hightestUnlockedLevel = 1
    static func unlockLevel(level:Int){
        if level > hightestUnlockedLevel {
            hightestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level:Int)->Bool{
        return level <= hightestUnlockedLevel
    }
    var currentlevel = 1
    mutating func advanceTolevel(level:Int)->Bool{
        if LevelTracker.levelIsUnlocked(level: level) {
            currentlevel = level
            return true
        }else{
            return false
        }
    }
}

class Player{
    var tracker = LevelTracker()
    let playername:String
    func compeletedLevel(level:Int) {
        LevelTracker.unlockLevel(level: level+1)
        tracker.advanceTolevel(level: level+1)
    }
    init(name:String) {
        playername = name
    }
}

var player = Player.init(name: "one")
player.compeletedLevel(level: 1)
print("highest unlocked level is now \(LevelTracker.hightestUnlockedLevel)")

player = Player.init(name: "two")
if player.tracker.advanceTolevel(level: 6) {
    print("player is now on level 6")
}else{
    print("level 6 has not yet been unlocked")
}













