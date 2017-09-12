//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//继承（Inheritance）

/*
 一个类可以继承（inherit）另一个类的方法（methods），属性（properties）和其它特性。当一个类继承其它类时，继承类叫子类（subclass），被继承类叫超类（或父类，superclass）。在 Swift 中，继承是区分「类」与其它类型的一个基本特征。
 在 Swift 中，类可以调用和访问超类的方法，属性和下标脚本（subscripts），并且可以重写（override）这些方法，属性和下标脚本来优化或修改它们的行为。Swift 会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。
 可以为类中继承来的属性添加属性观察器（property observers），这样一来，当属性值改变时，类就会被通知到。可以为任何属性添加属性观察器，无论它原本被定义为存储型属性（stored property）还是计算型属性（computed property）。
 */


//定义一个基类（Base class）
class Vehicle{//一个通用特性的车辆类
    var currentSpeed = 0.0
    var description:String {
        return  "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}
let someVehicle = Vehicle()
someVehicle.description






//子类生成（Subclassing），子类继承超类的特性，并且可以优化或改变它。你还可以为子类添加新的特性。

class Bicycle:Vehicle{
    var hasBasket = false
}
let bicyle = Bicycle()
bicyle.hasBasket = true
bicyle.currentSpeed = 15.0






//重写（Overriding）
/*
 子类可以为继承来的实例方法（instance method），类方法（class method），实例属性（instance proper
 ty），或下标脚本（subscript）提供自己定制的实现（implementation）。我们把这种行为叫重写（overridin
 g）。
 */
//如果要重写某个特性，你需要在重写定义的前面加上 override 关键字。

//访问超类的方法，属性及下标脚本
/*
 在合适的地方，你可以通过使用 super 前缀来访问超类版本的方法，属性或下标脚本：
 • 在方法 someMethod 的重写实现中，可以通过 super.someMethod() 来调用超类版本的 someMethod 方
 法。
 • 在属性 someProperty 的 getter 或 setter 的重写实现中，可以通过 super.someProperty 来访问超类版本的 someProperty 属性。
 • 在下标脚本的重写实现中，可以通过 super[someIndex] 来访问超类版本中的相同下标脚本。
 */

//重写方法
class Train:Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

//重写属性,你可以重写继承来的实例属性或类属性，提供自己定制的getter和setter，或添加属性观察器使重写的属性可以观察属性值什么时候发生改变。
//重写属性的Getters和Setters
/*
 你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属
 性。子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。你在重
 写一个属性时，必需将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同类型
 的属性相匹配的。

 你可以将一个继承来的只读属性重写为一个读写属性，只需要你在重写版本的属性里提供 getter 和 setter 即
 可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。
 */
class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("car:\(car.description)")

//重写属性观察器（Property Observer）,你可以在属性重写中为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会被通知到，无论那个属性原本是如何实现的。
class AutomaticCar:Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.description)")






//防止重写
/*
 你可以通过把方法，属性或下标脚本标记为 final 来防止它们被重写，只需要在声明关键字前加上 final 特性即
 可。（例如： final var , final func , final class func , 以及 final subscript ）
 如果你重写了 final 方法，属性或下标脚本，在编译时会报错。在类扩展中的方法，属性或下标脚本也可以在扩展
 的定义里标记为 final。
 你可以通过在关键字 class 前添加 final 特性（ final class ）来将整个类标记为 final 的，这样的类是不可被继承的，任何子类试图继承此类时，在编译时会报错。
 */






























