//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//自动引用计数
/*
 Swift 使用自动引用计数（ARC）机制来跟踪和管理你的应用程序的内存。通常情况下，Swift 的内存管理机制会
 一直起着作用，你无须自己来考虑内存的管理。ARC 会在类的实例不再被使用时，自动释放其占用的内存。
 然而，在少数情况下，ARC 为了能帮助你管理内存，需要更多的关于你的代码之间关系的信息。
 */





//自动引用计数的工作机制
/*
 当你每次创建一个类的新的实例的时候，ARC 会分配一大块内存用来储存实例的信息。内存中会包含实例的类型
 信息，以及这个实例所有相关属性的值。
 
 此外，当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。这确保了不再被使用的
 实例，不会一直占用内存空间。
 
 然而，当 ARC 收回和释放了正在被使用中的实例，该实例的属性和方法将不能再被访问和调用。实际上，如果
 你试图访问这个实例，你的应用程序很可能会崩溃。

 为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。哪怕实
 例的引用数为1，ARC都不会销毁这个实例。
 
 为了使上述成为可能，无论你将实例赋值给属性、常量或变量，它们都会创建此实例的强引用。之所以称之
 为“强”引用，是因为它会将实例牢牢的保持住，只要强引用还在，实例是不允许被销毁的。
 */








//自动引用计数实践
class Person{
    let name:String
    init(name:String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1:Person?
var reference2:Person?
var reference3:Person?

reference1 = Person.init(name: "John")// 由于 Person 类的新实例被赋值给了 reference1 变量，reference1 到 Person 类的新实例之间建立了一个强引用。正是因为这一个强引用，ARC 会保证 Person 实例被保持在内存中不被销毁。
reference2 = reference1//reference1强引用加1
reference3 = reference1//reference1强引用加1，现在有三个强引用

reference1 = nil
reference2 = nil//还剩下一个强引用，因此Person实例不会被销毁
reference3 = nil//最后一个强引用被断开，实例销毁，调用deInit






//类实例之间的循环强引用
/*
 我们可能会写出一个类实例的强引用数永远不能变成0的代码。如果两个类实例互相持有对方的强引用，因
 而每个实例都让对方一直存在，就是这种情况。这就是所谓的循环强引用。
 
 你可以通过定义类之间的关系为弱引用或无主引用，以替代强引用，从而解决循环强引用的问题。
 */
//不经意产生循环强引用的例子
class PersonTwo{
    let name:String
    init(name:String) {
        self.name = name
    }
    var apartment:Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment {
    let number: Int
    init(number: Int) {
        self.number = number
    }
    var tenant: PersonTwo?
    deinit {
        print("Apartment #\(number) is being deinitialized")
    }
}
//两个类互相拥有对方的可选属性

var john:PersonTwo?
var number73:Apartment?

john = PersonTwo.init(name: "john")//john的强引用（name:"john",apartment:nil）
number73 = Apartment.init(number: 73)//number73的强引用（number:73,tenant:nil）

john!.apartment = number73
number73!.tenant = john
//产生循环强引用，Person 实例现在有了一个指向 Apartment 实例的强引用，而 Apartment 实例也有了一个指向 Person 实例的强引用。

john = nil
number73 = nil//此时没有任何一个析构函数调用，循环强引用会一直阻止Person和Apartment类实例的销毁，造成了内存泄漏。







//解决实例之间的循环强引用,弱引用（weak reference）和无主引用（unowned reference）。
/*
 弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产
 生循环强引用。

 对于生命周期中会变为 nil 的实例使用弱引用。相反地，对于初始化赋值后再也不会被赋值为 nil 的实例，使用无主引用。
 */

//弱引用,弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。
//在实例的生命周期中，如果某些时候引用没有值，那么弱引用可以避免循环强引用。如果引用总是有值，则可以使用无主引用.
//因为弱引用可以没有值，你必须将每一个弱引用声明为可选类型。
//因为弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁。因此，ARC 会在引用的实例被销毁后自动将其赋值为 nil 。


class PersonThree{
    let name:String
    init(name:String) {
        self.name = name
    }
    var apartment:ApartmentTwo?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class ApartmentTwo {
    let number: Int
    init(number: Int) {
        self.number = number
    }
    weak var tenant: PersonThree?
    deinit {
        print("Apartment #\(number) is being deinitialized")
    }
}
var mary:PersonThree?
var number64:ApartmentTwo?

mary = PersonThree.init(name: "mary")
number64 = ApartmentTwo.init(number: 64)

mary!.apartment = number64
number64!.tenant = mary
//Person 实例依然保持对 Apartment 实例的强引用，但是 Apartment 实例只是对 Person 实例的弱引用。这意味着当你断开 john 变量所保持的强引用时，再也没有指向 Person 实例的强引用了
mary = nil//此时deinit被调用
number64 = nil//由于再也没有指向 Apartment 实例的强引用，该实例也会被销毁

//无主引用,和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用是永远有值的。因此，无主引用总是被定义为非可选类型（non-optional type）。你可以在声明属性或者变量时，在前面加上关键字 unowned 表示这是一个无主引用。
//由于无主引用是非可选类型，你不需要在使用它的时候将它展开。无主引用总是可以被直接访问。不过 ARC 无法在实例被销毁后将无主引用设为 nil ，因为非可选类型的变量不允许被赋值为 nil 。
class Customer{
    let name:String
    var card:CreditCard?
    init(name:String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
class CreditCard{
    let number:UInt64
    unowned let customer:Customer
    init(number:UInt64,customer:Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
var nick:Customer?
nick = Customer.init(name: "nick")
nick!.card = CreditCard.init(number: 1234_5678, customer: nick!)
//Customer 实例持有对 CreditCard 实例的强引用，而 CreditCard 实例持有对 Customer 实例的无主引用。
//由于再也没有指向 Customer 实例的强引用，该实例被销毁了。其后，再也没有指向 CreditCard 实例的强引用，该实例也随之被销毁了：
nick = nil

//无主引用以及隐式解析可选属性
//除了前两种场景，还存在第三种场景。两个属性都必须有值，并且初始化完成后永远不会为 nil 。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。
//这使两个属性在初始化完成后能被直接访问（不需要可选展开），同时避免了循环引用。
class Country{
    let name:String
    var capitalCity:City!
    init(name:String,capitalName:String) {
        self.name = name
        self.capitalCity = City.init(name: capitalName, country: self)
    }
}
class City{
    let name:String
    unowned let country:Country
    init(name:String,country:Country) {
        self.name = name
        self.country = country
    }
}
/*
 Country 的构造函数调用了 City 的构造函数。然而，只有 Country 的实例完全初始化完后， Country 的构造函数才能把 self 传给 City 的构造函数。
 
 为了满足这种需求，通过在类型结尾处加上感叹号（ City! ）的方式，将 Country 的 capitalCity 属性声明为隐式解析可选类型的属性。这表示像其他可选类型一样， capitalCity 属性的默认值为 nil ，但是不需要展开它的值就能访问它。
 
 由于 capitalCity 默认值为 nil ，一旦 Country 的实例在构造函数中给 name 属性赋值后，整个初始化过程就完成了。这代表一旦 name 属性被赋值后， Country 的构造函数就能引用并传递隐式的 self 。 Country 的构造函数在赋值 capitalCity 时，就能将 self 作为参数传递给 City 的构造函数。
 
 以上的意义在于你可以通过一条语句同时创建 Country 和 City 的实例，而不产生循环强引用，并且capitalCity的属性能被直接访问，而不需要通过感叹号来展开它的可选值：
 */
var country = Country.init(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
//使用隐式解析可选值的意义在于满足了两个类构造函数的需求。 capitalCity 属性在初始化完成后，能像非可选值一样使用和存取同时还避免了循环强引用。








//闭包引起的循环强引用
/*
 循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例。这个
 闭包体中可能访问了实例的某个属性，例如 self.someProperty ，或者闭包中调用了实例的某个方法，例如 self.someMethod 。这两种情况都导致了闭包 “捕获" self ，从而产生了循环强引用。
 
 循环强引用的产生，是因为闭包和类相似，都是引用类型。当你把一个闭包赋值给某个属性时，你也把一个引用
 赋值给了这个闭包。实质上，这跟之前的问题是一样的－两个强引用让彼此一直有效。但是，和两个类实例不
 同，这次一个是类实例，另一个是闭包。
 
 Swift 提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表（closuer capture list）。
 */
class HTMLElement{
    let name:String
    let text:String?
    lazy var asHTML:()->String = {
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)>"
        }else
        {
            return "<\(self.name)/>"
        }
    }
    init(name:String,text:String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraph:HTMLElement? = HTMLElement.init(name: "p", text: "Hello World")//HTMLElement 类产生了类实例和 asHTML 默认值的闭包之间的循环强引用。实例的 asHTML 属性持有闭包的强引用。但是，闭包在其闭包体内使用了 self （引用了 self.name 和 self.text ），因此闭包捕获了 self ，这意味着闭包又反过来持有了 HTMLElement 实例的强引用。
print(paragraph!.asHTML())
paragraph = nil//不会调用析构函数






//解决闭包引起的循环强引用

//定义捕获列表
/*
 捕获列表中的每一项都由一对元素组成，一个元素是 weak 或 unowned 关键字，另一个元素是类实例的引
 用（如 self ）或初始化过的变量（如 delegate = self.delegate! ）。
 */
/*
 如果闭包有参数列表和返回类型，把捕获列表放在它们前面：
 lazy var someClosure: (Int, String) -> String = {
 [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
 // closure body goes here
 }
 
 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字 in 放在闭包
 最开始的地方：
 lazy var someClosure: Void -> String = {
 [unowned self, weak delegate = self.delegate!] in
 // closure body goes here
 }
 */

//弱引用和无主引用
/*
 在闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。
 相反的，在被捕获的引用可能会变为 nil 时，将闭包内的捕获定义为弱引用。弱引用总是可选类型，并且当引用的
 实例被销毁后，弱引用的值会自动置为 nil 。这使我们可以在闭包体内检查它们是否存在。
 */

//前面的 HTMLElement 例子中，无主引用是正确的解决循环强引用的方法。
class HTMLElementTwo{
    let name:String
    let text:String?
    lazy var asHTML:()->String = {
        [unowned self] in//这里，捕获列表是 [unowned self] ，表示“用无主引用而不是强引用来捕获 self ”。
        if let text = self.text{
            return  "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name) />"
        }
    }
    
    init(name:String,text:String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraphTwo: HTMLElementTwo? = HTMLElementTwo(name: "p", text: "hello, world")
print(paragraphTwo!.asHTML())

paragraphTwo = nil//析构函数调用






