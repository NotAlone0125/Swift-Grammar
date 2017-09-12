//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//构造过程（Initialization）
/*
 构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个存储
 型属性设置初始值和为其执行必要的准备和初始化任务。
 构造过程是通过定义构造器（ Initializers ）来实现的，这些构造器可以看做是用来创建特定类型实例的特殊方法。与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
 类的实例也可以通过定义析构器（ deinitializer ）在实例释放之前执行特定的清除工作。
 */





//存储型属性的初始赋值
/*
 类和结构体在实例创建时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状
 态。
 你可以在构造器中为存储型属性赋初值，也可以在定义属性时为其设置默认值。以下章节将详细介绍这两种方
 法。
 */

//构造器
//init(){
//    
//}
struct Fahrenheit{
    var temperature:Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
f.temperature

//默认属性值
/*
 你可以使用更简单的方式在定义结构体 Fahrenheit 时为属性 temperature 设置默认值：
 struct Fahrenheit {
 var temperature = 32.0
 }
 */






//自定义构造过程

//构造参数,你可以在定义构造器时提供构造参数，为其提供自定义构造所需值的类型和名字。构造器参数的功能和语法跟函数和方法参数相同。
struct CeIsius{
    var temperatureInCeIsius:Double = 0.0
    init(fromFahrenheit fahrenheit:Double) {
        temperatureInCeIsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCeIsius = kelvin - 273.15
    }
}

let boilingPointOfWater = CeIsius.init(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCeIsius
let freezingPointOfWater = CeIsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCeIsius

//参数的内部名称和外部名称
/*
 跟函数和方法参数相同，构造参数也存在一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参
 数名字。
 然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。所以在调用构造器时，主要通过构造器中的
 参数名和类型来确定需要调用的构造器。正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名
 字，Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名，就相当于在每个构造参数之前加了一个
 哈希符号。
 */
struct Color{
    let red,green,blue:Double
    init(red:Double,green:Double,blue:Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//不带外部名的构造器参数
struct Celsius{
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius.init(37.0)
bodyTemperature.temperatureInCelsius

//可选属性类型
/*
 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性--不管是因为它无法在初始化时赋值，还是因为它
 可以在之后某个时间点可以赋值为空--你都需要将它定义为可选类型 optional type 。可选类型的属性将自动初
 始化为空 nil ，表示这个属性是故意在初始化时设置为空的。
 */

class SurveyQuestion{
    var text:String
    var response:String?//如果不是可选类型，构造方法init(text:String)也会出现报错信息
    init(text:String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion.init(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "YES"

//构造过程中常量属性的修改,只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。
//将上例中的text属性更改为常量属性，依然可以在其类的构造器中设置它的值
class SurveyQuestionTwo{
    let text:String
    var response:String?
    init(text:String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestionTwo(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"







//默认构造器,Swift 将为所有属性已提供默认值的且自身没有定义任何构造器的结构体或基类，提供一个默认的构造器。这个默认构造器将简单的创建一个所有属性值都设置为默认值的实例。
class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem.init()//由于 ShoppingListItem 类中的所有属性都有默认值，且它是没有父类的基类，它将自动获得一个可以为所有属性设置默认值的默认构造器

//结构体的逐一成员构造器
/*
 如果结构体对所有存储型属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器。
 
 逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。我们在调用逐一成员构造器时，通过与成员
 属性名相同的参数名进行传值来完成对成员属性的初始赋值。
 */
struct Size{
    var width = 0.0,height = 0.0
}
let twoByTwo = Size.init(width: 2.0, height: 2.0)//由于这两个存储型属性都有默认值，结构体 Size 自动获得了一个逐一成员构造器 init(width:height:) 。






//值类型的构造器代理,构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。
/*
 构造器代理的实现规则和形式在值类型和类类型中有所不同。值类型（结构体和枚举类型）不支持继承，所以构
 造器代理的过程相对简单，因为它们只能代理给本身提供的其它构造器。类则不同，它可以继承自其它类（请参
 考继承），这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。
 
 对于值类型，你可以使用 self.init 在自定义的构造器中引用其它的属于相同值类型的构造器。并且你只能在构造
 器内部调用 self.init 。
 如果你为某个值类型定义了一个定制的构造器，你将无法访问到默认构造器（如果是结构体，则无法访问逐一对
 象构造器）。这个限制可以防止你在为值类型定义了一个更复杂的，完成了重要准备构造器之后，别人还是错误
 的使用了那个自动生成的构造器。
 */

//例子
struct SizeTwo{
    var width = 0.0,height = 0.0
}
struct PointTwo{
    var x = 0.0,y = 0.0
}
struct Rect{//提供三种自定义构造器
    var origin = PointTwo()
    var size = SizeTwo()
    init() {
        
    }
    init(origin:PointTwo,size:SizeTwo) {
        self.origin = origin
        self.size = size
    }
    init(center:PointTwo,size:SizeTwo) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: PointTwo.init(x: originX, y: originY), size: size)
    }
}
let baseRect = Rect.init()//该自定义构造器和默认构造器一样
let originRect = Rect.init(origin: PointTwo.init(x: 2, y: 2), size: SizeTwo.init(width: 5, height: 5))//该构造器在功能上跟结构体的逐一成员构造器是一样的
let centerRect = Rect.init(center: PointTwo.init(x: 4.0, y: 4.0), size: SizeTwo.init(width: 3.0, height: 3.0))//该构造器先通过 center 和 size 的值计算出 origin 的坐标。然后再调用（或代理给） init(origin:size:) 构造器来将新的 origin 和 size 值赋值到对应的属性中








//类的继承和构造过程,类里面的所有存储型属性--包括所有继承自父类的属性--都必须在构造过程中设置初始值。
//Swift 提供了两种类型的类构造器来确保所有类实例中存储型属性都能获得初始值，它们分别是指定构造器和便利构造器。

//指定构造器(主要,每个类至少拥有一个)和便利构造器,
//一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。
//便利构造器是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。

//指定构造器和便利构造器的语法
//init(){
//    
//}
//convenience init(){
//    
//}

//类的构造器代理规则
/*
 规则一：指定构造器必须调用其父类的指定构造器
 规则二：便利构造器必须调用同一类中定义的其他构造器
 规则三：便利构造器必须最终以调用一个指定构造器结束
 
 一个更方便记忆的方法是：
 • 指定构造器必须总是向上代理
 • 便利构造器必须总是横向代理
 */

//两段式构造过程
/*
 Swift 中类的构造过程包含两个阶段。第一个阶段，每个存储型属性通过引入它们的类的构造器来设置初始值。当
 每一个存储型属性值被确定后，第二阶段开始，它给每个类一次机会在新实例准备使用之前进一步定制它们的存
 储型属性。
 
 两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过
 程可以防止属性值在初始化之前被访问；也可以防止属性被另外一个构造器意外地赋予不同的值。
 */
/*
 Swift 编译器将执行 4 种有效的安全检查，以确保两段式构造过程能顺利完成：
 安全检查一：指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其他构造任务向上代理给父类中的构造器
 安全检查二：指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖
 安全检查三：便利构造器必须先代理调用同一类中的其他构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中的其他指定构造器所覆盖
 安全检查四：构造器在第一阶段构造完成之前，不能调用任何实例方法、不能读取任何实例属性的值，self的值不能被引用。
 类实例在第一阶段结束以前并不是完全有效，仅能访问属性和调用方法，一旦完成第一阶段，该实例才会声明为
 有效实例。
 */
/*
 以下是两段式构造过程中基于上述安全检查的构造流程展示：
 阶段一：
 某个指定构造器或便利构造器被调用；
 完成新实例内存的分配，但此时内存还没有被初始化；
 指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化；
 指定构造器将调用父类的构造器，完成父类属性的初始化；
 这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部；
 当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段一完成。
 
 阶段二：
 从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
 最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。
 */

//构造器的继承和重写
/*
 跟 Objective-C 中的子类不同，Swift 中的子类不会默认继承父类的构造器。Swift 的这种机制可以防止一个父
 类的简单构造器被一个更专业的子类继承，并被错误的用来创建子类的实例。
 
 假如你希望自定义的子类中能实现一个或多个跟父类相同的构造器，也许是为了完成一些定制的构造过程，你可
 以在你定制的子类中提供和重写与父类相同的构造器。
 
 当你写一个父类中带有指定构造器的子类构造器时，你需要重写这个指定的构造器。因此，你必须在定义子类构
 造器时带上 override 修饰符。即使你重写系统提供的默认构造器也需要带上 override 修饰符。
 
 无论是重写属性，方法或者是下标脚本，只要含有 override 修饰符就会去检查父类是否有相匹配的重写指定构造
 器和验证重写构造器参数。
 
 相反地，如果你写了一个和父类便利构造器相匹配的子类构造器，子类都不能直接调用父类的便利构造器
 */
//例子
class Vehicle{//该类拥有一个默认构造器
    var numberOfWheels = 0
    var description:String {
        return "\(numberOfWheels) wheels"
    }
}
let vehicle = Vehicle.init()
vehicle.description

class Bicycle:Vehicle{
    override init() {
        super.init()
        numberOfWheels = 2
    }
    /*
     子类 Bicycle 定义了一个自定义指定构造器 init() 。这个指定构造器和父类的指定构造器相匹配，所以 Bicycle中的指定构造器需要带上 override 修饰符。
     Bicycle 的构造器 init() 一开始调用 super.init() 方法，这个方法的作用是调用 Bicycle 的父类 Vehicle 。这样可以确保 Bicycle 在修改属性之前它所继承的属性 numberOfWheels 能被 Vehicle 类初始化。
     */
}
let bicycle = Bicycle.init()
bicycle.description

//自动构造器的继承
/*
 如上所述，子类不会默认继承父类的构造器。但是如果特定条件可以满足，父类构造器是可以被自动继承的。在
 实践中，这意味着对于许多常见场景你不必重写父类的构造器，并且在尽可能安全的情况下以最小的代价来继承
 父类的构造器。
 
 子类中引入的任意新属性提供默认值，请遵守以下2个规则：
 规则一：
 如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器
 
 规则二：
 如果子类提供了所有父类指定构造器的实现————不管是通过规则一继承过来的，还是通过自定义实现的————它将自动继承所有父类的便利构造器
 即便你在子类中添加了更多的便利构造器，这两条规则仍然适用。
 */

//指定构造器和便利构造器操作
//接下来的例子将在操作中展示指定构造器、便利构造器和自动构造器的继承。它定义了包含三个类 Food 、 RecipeIngredient 以及 ShoppingListItem 的类层次结构，并将演示它们的构造器是如何相互作用的。
class Food{
    var name:String
    init(name:String) {
        self.name = name
    }
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food.init(name: "Bacon")//类不会提供一个默认的逐一成员构造器,指定构造器，能确保所有新 Food 实例的中存储型属性都被初始化
let mysterymeat = Food.init()//没有参数的便利构造器 init() 。这个 init() 构造器为新食物提供了一个默认的占位名字，通过代理调用同一类中定义的指定构造器 init(name: String) 并给参数 name 传值 [Unnamed] 来实现：
class RecipeIngredient:Food{
    var quantity:Int
    init(name:String,quantity:Int) {
        /*
         这个构造器一开始先将传入的 quantity 参数赋值给 quantity 属性，这个属性也是唯一在
         RecipeIngredient 中新引入的属性。随后，构造器将任务向上代理给父类 Food 的 init(name: String) 。这个过程满足两段式构造过程 (页 0)中的安全检查1。
         */
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient.init(name: "Bacon")
let sixEggs = RecipeIngredient.init(name: "Eggs", quantity: 6)

class ShoppingList:RecipeIngredient{
    var purchased = false
    var description:String {
        var output = "\(quantity) x \(name.lowercased())"
        output += purchased ? "√" : "X"
        return output
    }
}
//由于它为自己引入的所有属性都提供了默认值，并且自己没有定义任何构造器， ShoppingListItem 将自动继承所有父类中的指定构造器和便利构造器。
let shoppingListOne = ShoppingList()
shoppingListOne.description
let shoppingListTwo = ShoppingList.init(name: "eggs", quantity: 6)
shoppingListTwo.description
let shoppingListThree = ShoppingList.init(name: "Bacon")
shoppingListThree.description







//可失败构造器
/*
 如果一个类，结构体或枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败构造器，是非
 常有必要的。这里所指的“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不
 满足某种必要的条件等。
 */
//可失败构造器，在构建对象的过程中，创建一个其自身类型为可选类型的对象。你通过 return nil 语句，来表明可失败构造器在何种情况下“失败”。
struct Animal{
    let specice:String
    init?(specice:String) {
        if specice.isEmpty {
            return nil
        }
        self.specice = specice
    }
}
let someCreature = Animal.init(specice: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.specice)")
}

let anonymousCreature = Animal(specice: "")
// anonymousCreature 的类型是 Animal?, 而不是 Animal
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//枚举类型的可失败构造器,你可以通过构造一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员。还能在参数不满足你所期望的条件时，导致构造失败。
enum TemperatureUnit{
    case Kelvin,Celsius,Fahrenheit
    init?(symbol:Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
//你可以通过给该可失败构造器传递合适的参数来获取这三个枚举成员中相匹配的其中一个枚举成员。当参数的值不能与任意一枚举成员相匹配时，该枚举类型的构建过程失败：
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

//带原始值的枚举类型的可失败构造器
/*
 带原始值的枚举类型会自带一个可失败构造器 init?(rawValue:) ,该可失败构造器有一个名为 rawValue 的默认参
 数,其类型和枚举类型的原始值类型一致，如果该参数的值能够和枚举类型成员所带的原始值匹配，则该构造器构
 造一个带此原始值的枚举成员，否则构造失败。
 */
enum TemperatureUnitTwo:Character{
    case Kelvin = "K",Celsius = "C",Fahrenheit = "F"
}
let fahrenheitUnitOne = TemperatureUnitTwo.init(rawValue: "K")
if fahrenheitUnitOne != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

//类的可失败构造器
/*
 值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。比如在前
 面的例子中，结构体 Animal 的可失败构造器触发失败的行为，甚至发生在 species 属性的值被初始化以前。而
 对类而言，就没有那么幸运了。类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的
 代理调用发生完后触发失败行为。
 */
class Product{
    let name:String
    init?(name:String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}
if let bowTie = Product.init(name: "bow tie") {
    //不需要检查bowTie.name == nil
    print("The product's name is \(bowTie.name)")
}

//构造失败的传递
/*
 可失败构造器同样满足在构造器链所描述的构造规则。其允许在同一类，结构体和枚举中横向代理其他
 的可失败构造器。类似的，子类的可失败构造器也能向上代理基类的可失败构造器。
 
 无论是向上代理还是横向代理，如果你代理的可失败构造器，在构造过程中触发了构造失败的行为，整个构造过
 程都将被立即终止，接下来任何的构造代码都将不会被执行。
 */
class Cartltem:Product{
    var quantity:Int!
    init?(name:String,quantity:Int) {
        super.init(name: name)
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
    }
}
if let twoSocks = Cartltem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = Cartltem.init(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = Cartltem.init(name: "", quantity: 0) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize oneUnnamed product")
}

//重写一个可失败构造器
/*
 就如同其它构造器一样，你也可以用子类的可失败构造器重写基类的可失败构造器。或者你也可以用子类的非可
 失败构造器重写一个基类的可失败构造器。这样做的好处是，即使基类的构造器为可失败构造器，但当子类的构
 造器在构造过程不可能失败时，我们也可以把它修改过来。
 
 注意当你用一个子类的非可失败构造器重写了一个父类的可失败构造器时，子类的构造器将不再能向上代理父类
 的可失败构造器。一个非可失败的构造器永远也不能代理调用一个可失败构造器。
 */
class Document{
    var name:String?
    init() {
        //该构造器构建了一个name属性值为nil的document对象
    }
    init?(name:String) {
        //该构造器构建了一个name属性值为非空字符串的document对象
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument:Document{
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        }else{
            self.name = name
        }
    }
}
//AutomaticallyNamedDocument 用一个非可失败构造器 init(name:) ,重写了基类的可失败构造器 init?(name:) 。因为子类用不同的方法处理了 name 属性的值为一个空字符串的这种情况。所以子类将不再需要一个可失败的构造器。

//可失败构造器init!
/*
 通常来说我们通过在 init 关键字后添加问号的方式来定义一个可失败构造器，但你也可以使用通过在 init 后面添
 加惊叹号的方式来定义一个可失败构造器 (init!) ，该可失败构造器将会构建一个特定类型的隐式解析可选类型的
 对象。
 你可以在 init? 构造器中代理调用 init! 构造器，反之亦然。 你也可以用 init? 重写 init! ，反之亦然。 你还可以用 init 代理调用 init! ，但这会触发一个断言：是否 init! 构造器会触发构造失败？
 */






//必要构造器
//在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器：
class someClass{
    required init(){
        
    }
}
//当子类重写基类的必要构造器时，必须在子类的构造器前同样添加 required 修饰符以确保当其它类继承该子类时，该构造器同为必要构造器。在重写基类的必要构造器时，不需要添加 override 修饰符：
class SomeSubClass{
    required init() {
        
    }
}







//通过闭包和函数来设置属性的默认值
/*
 如果某个存储型属性的默认值需要特别的定制或准备，你就可以使用闭包或全局函数来为其属性提供定制的默认
 值。每当某个属性所属的新类型实例创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给
 这个属性。
 这种类型的闭包或函数一般会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最
 后将这个临时变量的值作为属性的默认值进行返回。
 */
/*
 下面列举了闭包如何提供默认值的代码概要：
 class SomeClass {
 let someProperty: SomeType = {
 // 在这个闭包中给 someProperty 创建一个默认值
 // someValue 必须和 SomeType 类型相同
 return someValue
 }()
 }
 */

struct CheckBoard{
    let boardColors:[Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10{
            for j in 1...10{
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareBlackAtRow(row:Int,column:Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}
let board = CheckBoard()
board.squareBlackAtRow(row: 0, column: 1)
board.squareBlackAtRow(row: 9, column: 9)





