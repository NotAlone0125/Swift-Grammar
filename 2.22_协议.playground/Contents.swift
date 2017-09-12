//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//协议 定义了一个蓝图，规定了用来实现某一特定工作或者功能所必需的方法和属性。类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。任意能够满足协议要求的类型被称为 遵循(conform) 这个协议。


//协议的语法
/*
 协议的定义方式与类，结构体，枚举的定义非常相似。
 protocol SomeProtocol {
 // 协议内容
 }
 
 要使类遵循某个协议，需要在类型名称后加上协议名称，中间以冒号 : 分隔，作为类型定义的一部分。遵循多个协议时，各协议之间用逗号 , 分隔。
 struct SomeStructure: FirstProtocol, AnotherProtocol {
 // 结构体内容
 }
 
 如果类在遵循协议的同时拥有父类，应该将父类名放在协议名之前，以逗号分隔。
 class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
 // 类的内容
 }
 */





//对属性的规定
/*
 协议可以规定其 遵循者 提供特定名称和类型的 实例属性(instance property) 或 类属性(type property) ，而不指定是 存储型属性(stored property) 还是 计算型属性(calculate property) 。此外还必须指明是只读的还是可读可写的。
 
 如果协议规定属性是可读可写的，那么这个属性不能是常量或只读的计算属性。如果协议只要求属性是只读的(gettable)，那个属性不仅可以是只读的，如果你代码需要的话，也可以是可写的。
 
 协议中的通常用var来声明属性，在类型声明后加上 { set get } 来表示属性是可读可写的，只读属性则用 { get} 来表示。
 protocol SomeProtocol {
 var mustBeSettable : Int { get set }
 var doesNotNeedToBeSettable: Int { get }
 }
 
 在协议中定义类属性(type property)时，总是使用 static 关键字作为前缀。当协议的遵循者是类时，可以使用 class 或 static 关键字来声明类属性，但是在协议的定义中，仍然要使用 static 关键字。
 protocol AnotherProtocol {
 static var someTypeProperty: Int { get set }
 }
 */
protocol FullyNamed{
    var fullName:String{get}
}
struct Person:FullyNamed{
    var fullName: String
}
let john = Person.init(fullName: "John")//Person 结构体完整的 遵循 了协议。(如果协议要求未被完全满足,在编译时会报错)

class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String,prefix:String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{//Starship类把 fullName 属性实现为只读的计算型属性。
        return (prefix != nil ? prefix! + " ":"")
    }
}
var ncc1701 = Starship.init(name: "Enterprise", prefix: "USS")
ncc1701.fullName






//对方法的规定
/*
 协议可以要求其遵循者实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通的方法一样放在
 协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相
 同。但是在协议的方法定义中，不支持参数默认值。
 */
protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {//线性随机数
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom/m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")






//对Mutating方法的规定
/*
 有时需要在方法中改变它的实例。例如，值类型(结构体，枚举)的实例方法中，将 mutating 关键字作为函数的前缀，写在 func 之前，表示可以在该方法中修改它所属的实例及其实例属性的值。
 
 如果你在协议中定义了一个方法旨在改变遵循该协议的实例，那么在协议定义时需要在方法前加 mutating 关键字。这使得结构和枚举遵循协议并满足此方法要求。
 */
protocol Togglable{
    mutating func toggle()
}

enum OnOffSwitch:Togglable{
    case off,on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()






//对构造器的规定
/*
 协议可以要求它的遵循者实现指定的构造器。你可以像书写普通的构造器那样，在协议的定义里写下构造器的声
 明，但不需要写花括号和构造器的实体：
 protocol SomeProtocol {
 init(someParameter: Int)
 }
 */

//协议构造器规定在类中的实现
//你可以在遵循该协议的类中实现构造器，并指定其为类的指定构造器(designated initializer)或者便利构造器(convenience initializer)。在这两种情况下，你都必须给构造器实现标上"required"修饰符：
/*
 class SomeClass:SomeProtocol{
 required init(someParameter:Int){
 //构造器实现
 }
 }
 */
//使用 required 修饰符可以保证：所有的遵循该协议的子类，同样能为构造器规定提供一个显式的实现或继承实现。

//如果一个子类重写了父类的指定构造器，并且该构造器遵循了某个协议的规定，那么该构造器的实现需要被同时标示 required 和 override 修饰符
/*
 protocol SomeProtocol {
 init()
 }
 
 class SomeSuperClass {
 init() {
 // 构造器的实现
 }
 }
 
 class SomeSubClass: SomeSuperClass, SomeProtocol {
 // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
 required override init() {
 // 构造器实现
 }
 }
 
*/

//可失败构造器的规定
/*
 可以通过给协议 Protocols 中添加可失败构造器来使遵循该协议的类型必须实现该可失败构造器。
 
 如果在协议中定义一个可失败构造器，则在遵顼该协议的类型中必须添加同名同参数的可失败构造器或非可失败
 构造器。如果在协议中定义一个非可失败构造器，则在遵循该协议的类型中必须添加同名同参数的非可失败构造
 器或隐式解析类型的可失败构造器（ init! ）
 */





//协议类型,尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。
/*
 协议可以像其他普通类型一样使用，使用场景:
 • 作为函数、方法或构造器中的参数类型或返回值类型
 • 作为常量、变量或属性的类型
 • 作为数组、字典或其他容器中的元素类型
 */
class Dice{//该类中将协议当做类型来使用
    let sides:Int
    let generator:RandomNumberGenerator
    init(sides:Int,generator:RandomNumberGenerator) {//任何遵循了 RandomNumberGenerator 协议的类型的实例都可以赋值给 generator ，除此之外，无其他要求。
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice.init(sides: 6, generator: LinearCongruentialGenerator() as RandomNumberGenerator)
for _ in 1...5{
    print("Random dice rool is \(d6.roll())")
}






//委托(代理)模式
/*
 委托是一种设计模式，它允许 类 或 结构体 将一些需要它们负责的功能 交由(委托) 给其他的类型的实例。委托模式的实现很简单: 定义协议来封装那些需要被委托的函数和方法， 使其 遵循者 拥有这些被委托的 函数和方法 。委托模式可以用来响应特定的动作或接收外部数据源提供的数据，而无需要知道外部数据源的类型信息。
 */
protocol DiceGame{
    var dice:Dice {get}
    func play()
}

protocol DiceGameDelegate{
    func gameDidStart(game:DiceGame)
    func game(game:DiceGame,didStartNewTurnWithDiceRoll diceRoll:Int)
    func ganmeDidEnd(game:DiceGame)
}
//模拟之前的25宫格的骰子游戏
class SnakesAndLadders:DiceGame{//使用 Dice 作为骰子，并且实现了 DiceGame 和 DiceGameDelegate 协议，后者用来记录游戏的过程:
    let finalSquare = 25
    let dice:Dice = Dice.init(sides: 6, generator: LinearCongruentialGenerator() as RandomNumberGenerator)
    var square = 0
    var board:[Int]
    init() {
        board = [Int].init(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate:DiceGameDelegate?//delegate 并不是游戏的必备条件，因此 delegate 被定义为遵循 DiceGameDelegate 协议的可选属性。
    func play() {
        square = 0
        delegate?.gameDidStart(game: self)//可选链 来调用委托方法。 若 delegate 属性为 nil ， 则delegate所调用的方法失效，并不会产生错误。若 delegate 不为 nil ，则方法能够被调用
        gameLoop:while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(game: self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.ganmeDidEnd(game: self)
    }
}

class DiceGameTracker:DiceGameDelegate{//DiceGameTracker 实现了 DiceGameDelegate 协议规定的三个方法，用来记录游戏已经进行的轮数。
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Staeted a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func ganmeDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()







//在扩展中添加协议成员
//即便无法修改源代码，依然可以通过扩展(Extension)来扩充已存在类型(译者注: 类，结构体，枚举等)。扩展可以为已存在的类型添加属性，方法，下标脚本，协议等成员。
protocol TextRepresentable{
    func asText()->String
}
//可以通过扩展，为上一节中提到的 Dice 增加类遵循 TextRepresentable 协议的功能
extension Dice:TextRepresentable{
    func asText() -> String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice.init(sides: 12, generator: LinearCongruentialGenerator() as RandomNumberGenerator)
d12.asText()

extension SnakesAndLadders: TextRepresentable {
    func asText() -> String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
game.asText()







//通过扩展补充协议声明
//当一个类型已经实现了协议中的所有要求，却没有声明为遵循该协议时，可以通过扩展(空的扩展体)来补充协议声明:
struct Hamster{
    var name:String
    func asText()->String{
        return "A hamster named \(name)"
    }
}
extension Hamster:TextRepresentable{//Hamster 的实例可以作为 TextRepresentable 类型使用
    
}
let simonTheHamster = Hamster.init(name: "Simon")
let somethingTextRepresentable:TextRepresentable = simonTheHamster
somethingTextRepresentable.asText()







//集合中的协议类型
//协议类型可以在集合使用，表示集合中的元素均为协议类型
let things:[TextRepresentable] = [game,d12,simonTheHamster]
for thing in things{//thing 被当做是 TextRepresentable 类型而不是 Dice ， DiceGame ， Hamster 等类型。
    print(thing.asText())
}








//协议的继承
//协议能够继承一个或多个其他协议，可以在继承的协议基础上增加新的内容要求。协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔:
protocol PrettyTextRepresentable:TextRepresentable{//继承自 TextRepresentable 协议。任何遵循 PrettyTextRepresentable 协议的类型在满足该协议的要求时，也必须满足 TextRepresentable 协议的要求。
    func asPrettyText() -> String
}
extension SnakesAndLadders:PrettyTextRepresentable{
    func asPrettyText() -> String {
        var output = asText() + ":\n"
        for index in 1...finalSquare{
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}
print(game.asPrettyText())






//类专属协议
//你可以在协议的继承列表中,通过添加 class 关键字,限制协议只能适配到类（class）类型。（结构体或枚举不能遵循该协议）。该 class 关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。
/*
 protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
 // class-only protocol definition goes here
 }
 */






//协议合成
/*
 有时候需要同时遵循多个协议。你可以将多个协议采用 protocol<SomeProtocol， AnotherProtocol> 这样的格式进行组合，称为 协议合成(protocol composition) 。你可以在 <> 中罗列任意多个你想要遵循的协议，以逗号分隔。
 */
protocol Named{
    var name:String {get}
}
protocol Aged{
    var age:Int {get}
}
struct People:Named,Aged{
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator:protocol<Named,Aged>){//wishHappyBirthday 函数的形参 celebrator 的类型为 protocol<Named，Aged> 。可以传入任意 遵循 这两个协议的类型的实例。
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = People.init(name: "Mary", age: 21)
wishHappyBirthday(celebrator: birthdayPerson)






//检验协议的一致性
//你可以使用 is 和 as 操作符来检查是否遵循某一协议或强制转化为某一类型。
/*
 • is 操作符用来检查实例是否 遵循 了某个 协议
 • as? 返回一个可选值，当实例 遵循 协议时，返回该协议类型;否则返回 nil
 • as 用以强制向下转型，如果强转失败，会引起运行时错误。
 */
protocol HasArea{
    var area:Double {get}
}

class Circle:HasArea{
    let pi = 3.1415927
    var radius:Double
    var area: Double{//Circle 类把 area 实现为基于 存储型属性 radius的 计算型属性
        return pi * radius * radius
    }
    init(radius:Double) {
        self.radius = radius
    }
}

class Country:HasArea{
    var area: Double
    init(area:Double) {// Country 类则把 area 实现为 存储型属性
        self.area = area
    }
}

class Animal{
    var legs:Int
    init(legs:Int) {
        self.legs = legs
    }
}

let objects:[AnyObject] = [Circle.init(radius: 2.0),Country.init(area: 243_610),Animal.init(legs: 4)]
for object in objects{
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    }else{
        print("Something that doesn't have an area")
    }
}







//对可选协议的规定
/*
 协议可以含有可选成员，其 遵循者 可以选择是否实现这些成员。在协议中使用 optional 关键字作为前缀来定义
 可选成员。
 
 可选协议在调用时使用 可选链 ，因为协议的遵循者可能没有实现可选内容
 
 像 someOptionalMethod?(someArgument) 这样，你可以在可选方法名称后加上 ? 来检查该方法是否被实现。可选方法和可选属性都会返回一个 可选值(optional value) ，当其不可访问时， ? 之后语句不会执行，并整体返回 nil
 */
@objc protocol CounterDataSource{
    @objc optional func incrementForCount(count:Int)->Int//返回值为可选 Int 类型
    @objc optional var fixedIncrement:Int {get}
}

class Counter{
    var count = 0
    var dataSource:CounterDataSource?
    func increment(){
        if let amount = dataSource?.incrementForCount?(count: count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4{
    counter.increment()
    print(counter.count)
}
//下面是一个更为复杂的数据源 TowardsZeroSource ，它将使得最后的值变为0
class TowardZeroSource:CounterDataSource{
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        }else if count<0{
            return 1
        }else{
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardZeroSource()
for _ in 1...4{
    counter.increment()
    print(counter.count)
}






//协议扩展
/*
 使用扩展协议的方式可以为遵循者提供方法或属性的实现。通过这种方式，可以让你无需在每个遵循者中都实现
 一次，无需使用全局函数，你可以通过扩展协议的方式进行定义
 */
extension RandomNumberGenerator{
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
let generatorTwo = LinearCongruentialGenerator()
print("Here's a random number: \(generatorTwo.random())")
print("And here's a random Boolean: \(generatorTwo.randomBool())")

//提供默认实现
/*
 可以通过协议扩展的方式来为协议规定的属性和方法提供默认的实现。如果协议的遵循者对规定的属性和方法提
 供了自己的实现，那么遵循者提供的实现将被使用。
 */
//例如， PrettyTextRepresentable 协议，继承了 TextRepresentable 协议，可以为其提供一个默认的 asPrettyText() 方法来简化返回值
extension PrettyTextRepresentable{
    func asPrettyText()->String{
        return asText()
    }
}

//为协议扩展添加限制条件
/*
 在扩展协议的时候，可以指定一些限制，只有满足这些限制的协议遵循者，才能获得协议扩展提供的属性和方
 法。这些限制写在协议名之后，使用 where 关键字来描述限制情况。
 */
/*
例如，你可以扩展 CollectionType 协议，但是只适用于元素遵循 TextRepresentable 的情况:
extension CollectionType where Generator.Element : TextRepresentable {
    func asList() -> String {
        return "(" + ", ".join(map({$0.asText()})) + ")"
    }
}

现在我们来看 Hamster ，它遵循 TextRepresentable :
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
 
因为 Array 遵循 CollectionType 协议，数组的元素又遵循 TextRepresentable 协议，所以数组可以使用 asList() 方法得到数组内容的文本表示:
print(hamsters.asList())
// 输出 "(A hamster named Murray, A hamster named Morgan, A hamster named Maurice)
*/




