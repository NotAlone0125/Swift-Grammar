//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 swift 3.0中
 1，private
 private访问级别所修饰的属性或者方法只能在当前类里访问。
 原文:Swift - 访问控制（fileprivate，private，internal，public，open）
 
 2，fileprivate
 fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问。（比如上门样例把private改成fileprivate就不会报错了）
 
 3，internal（默认访问级别，internal修饰符可写可不写）
 internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
 如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
 如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
 
 4，public
 可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
 
 5，open
 可以被任何人使用，包括override和继承。
 
 原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_524.html
 */


/*
 访问控制可以限定其他源文件或模块中代码对你代码的访问级别。这个特性可以让我们隐藏功能实现的一些细
 节，并且可以明确的申明我们提供给其他人的接口中哪些部分是他们可以访问和使用的。
 
 你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类型的属性、函数、初始化方
 法、基本类型、下标索引等设置访问级别。协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变
 量和函数。
 
 在提供了不同访问级别的同时，Swift还为某些典型场景提供了默认的访问级别，这样就不需要我们在每段代码中都申明显式访问级别。其实，如果只是开发一个单目标应用程序，我们完全可以不用申明代码的显式访问级别。
 */




//模块和源文件
/*
 Swift 中的访问控制模型基于模块和源文件这两个概念。
 
 模块指的是以独立单元构建和发布的 Framework 或 Application 。在Swift 中的一个模块可以使用 import 关键字引入另外一个模块。在 Swift 中，Xcode的每个构建目标（比如 Framework 或 app bundle ）都被当作模块处理。如果你是为了实现某个通用的功能，或者是为了封装一些常用方法而将代码打包成独立的 Framework ，这个 Framework 在 Swift 中就被称为模块。当它被引入到某个 app 工程或者另外一个 Framework 时，它里面的一切（属性、函数等）仍然属于这个独立的模块。
 
 源文件指的是 Swift 中的 Swift File ，就是编写 Swift 源代码的文件，它通常属于一个模块。尽管一般我们将不同的 类 分别定义在不同的源文件中，但是同一个源文件可以包含多个 类 和 函数 的定义。
 */







//访问级别
/*
Swift 为代码中的实体提供了三种不同的访问级别。这些访问级别不仅与源文件中定义的实体相关，同时也与源文件所属的模块相关。
 
• public ：可以访问自己模块中源文件里的任何实体，别人也可以通过引入该模块来访问源文件里的所有实体。通常情况下， Framework 中的某个接口是可以被任何人使用时，你可以将其设置为 public 级别。
 
• internal ：可以访问自己模块中源文件里的任何实体，但是别人不能访问该模块中源文件里的实体。通常情况下，某个接口或 Framework 作为内部结构使用时，你可以将其设置为 internal 级别。
 
• private ：只能在当前源文件中使用的实体，称为私有实体。使用 private 级别，可以用作隐藏某些功能的实现细节。
 
public 为最高级访问级别， private 为最低级访问级别。
注意：Swift中的 private 访问和其他语言中的 private 访问不太一样，它的范围限于整个源文件，而不是声明。这就意味着，一个 类 可以访问定义该 类 的源文件中定义的所有 private 实体，但是如果一个 类 的扩展是定义在独立的源文件中，那么就不能访问这个 类 的 private 成员。
 */
 
//访问级别的使用原则
/*
Swift 中的访问级别遵循一个使用原则：访问级别统一性。 比如说：
 
• 一个 public 访问级别的变量，不能将它的类型定义为 internal 和 private 。因为变量可以被任何人访问，但是定义它的类型不可以，所以这样就会出现错误。
 
• 函数的访问级别不能高于它的参数、返回类型的访问级别。因为如果函数定义为 public 而参数或者返回类型定义为 internal 或 private ，就会出现函数可以被任何人访问，但是它的参数和返回类型确不可以，同样出现错误。
*/
 
//默认访问级别
//如果你不为代码中的所有实体定义显式访问级别，那么它们默认为 internal 级别。在大多数情况下，我们不需要设置实体的显式访问级别。因为我们一般都是在开发一个 app bundle 。

//单目标应用程序的访问级别
//当你编写一个单目标应用程序时，该应用的所有功能都是为该应用服务，不需要提供给其他应用或者模块使用，所以我们不需要明确设置访问级别，使用默认的访问级别 internal 即可。但是如果你愿意，你也可以使用 private 级别，用于隐藏一些功能的实现细节。

//Framework的访问级别
//当你开发 Framework 时，就需要把一些对外的接口定义为 public 级别，以便其他人导入该 Framework 后可以正常使用其功能。这些被你定义为 public 的接口，就是这个 Framework 的API。
//注意： Framework 的内部实现细节依然可以使用默认的 internal 级别，或者也可以定义为 private 级别。只有当你想把它作为 API 的一部分的时候，才将其定义为 public 级别。

//单元测试目标的访问级别
//当你的app有单元测试目标时，为了方便测试，测试模块需要能访问到你app中的代码。默认情况下只有 public级别的实体才可以被其他模块访问。然而，如果在引入一个生产模块时使用 @testable 注解，然后用带测试的方式编译这个生产模块，单元测试目标就可以访问所有 internal 级别的实体。






//访问控制语法
public class SomePublicClass{
    
}
internal class SomeInternalClass{
    
}
private class SomePrivateClass{
    
}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {

}
//除非有特殊的说明，否则实体都使用默认的访问级别 internal 






//自定义类型
/*
 如果想为一个自定义类型申明显式访问级别，那么要明确一点。那就是你要确保新类型的访问级别和它实际的作
 用域相匹配。比如说，如果你定义了一个 private 类，那这个类就只能在定义它的源文件中当作属性类型、函数参数或者返回类型使用。
 
 类的访问级别也可以影响到类成员（属性、函数、初始化方法等）的默认访问级别。如果你将类申明为 private类，那么该类的所有成员的默认访问级别也会成为 private 。如果你将类申明为 public 或者 internal 类（或者不明确的申明访问级别，而使用默认的 internal 访问级别），那么该类的所有成员的访问级别是 internal 。
 */
public class SomePublicClassTwo{//显式的public类
    public var somePublicProprty = 0 //显式的public类成员
    var someInternalPropety = 0 //隐式的internal类成员
    private func somePrivateMethod(){ //显式的private类成员
        
    }
}
class SomeInternalClassTwo{//隐式的internal类
    var someInternalPropety = 0 //隐式的internal类成员
    private func somePrivateMethod(){ //显式的private类成员
        
    }
}
private class SomePrivateClassTwo{ // 显式的 private 类
    var somePrivateProprty = 0  //隐式的private类成员
    func somePrivateMethod() { //隐式的private类成员
        
    }
}

//元组类型
/*
 元组的访问级别使用是所有类型的访问级别使用中最为严谨的。比如说，如果你构建一个包含两种不同类型元素的元组，其中一个元素类型的访问级别为 internal ，另一个为 private 级别，那么这个元组的访问级别为 private 。也就是说元组的访问级别与元组中访问级别最低的类型一致。
 */

//函数类型
//函数的访问级别需要根据该函数的参数类型和返回类型的访问级别得出。如果根据参数类型和返回类型得出的函数访问级别不符合默认上下文，那么就需要明确地申明该函数的访问级别。

//func someFunction() -> (SomeInternalClass,SomePrivateClass){
//    return (SomeInternalClass(),SomePrivateClass())
//}
//无法编译通过，返回值为元组，根据规则，该元组的访问级别是private，因此必须使用private修饰符
private func someFunction() -> (SomeInternalClass,SomePrivateClass){
    return (SomeInternalClass(),SomePrivateClass())
}

//枚举类型
//枚举中成员的访问级别继承自该枚举，你不能为枚举中的成员单独申明不同的访问级别。
public enum CompassPoint {//成员的访问级别都是public
    case North
    case South
    case East
    case West
}

//原始值和关联值
//枚举定义中的任何原始值或关联值的类型都必须有一个访问级别，这个级别至少要不低于枚举的访问级别。比如说，你不能在一个 internal 访问级别的枚举中定义 private 级别的原始值类型。

//嵌套类型
//如果在 private 级别的类型中定义嵌套类型，那么该嵌套类型就自动拥有 private 访问级别。如果在 public 或者internal 级别的类型中定义嵌套类型，那么该嵌套类型自动拥有 internal 访问级别。如果想让嵌套类型拥有 public 访问级别，那么需要明确地申明该嵌套类型的访问级别。







//子类
//子类的访问级别不得高于父类的访问级别。在满足这个条件的情况下，你可以重写任意类成员（方法，属性，初始化方法）
//如果我们无法直接访问某个类中的属性或函数等，那么可以继承该类，从而可以更容易的访问到该类的类成员。

public class A{ //public类
    fileprivate func someMethod(){//private方法
        
    }
}

internal class B:A{//继承并声明访问级别为internal
    override internal func someMethod() {//重写类A中的private方法，并声明为internal访问级别，通过这种方式，我们就可以访问到某类中 private 级别的类成员，并且可以重新申明其访问级别，以便其他人使用：
    }
}






//常量、变量、属性、下标
/*
 常量、变量、属性不能拥有比它们的类型更高的访问级别。比如说，你定义一个 public 级别的属性，但是它的类型是 private 级别的，这是编译器所不允许的。同样，下标也不能拥有比索引类型或返回类型更高的访问级别。
 如果常量、变量、属性、下标索引的定义类型是 private 级别的，那么它们必须要明确的申明访问级别为 private ：
 */
private var privateInstance = SomePrivateClass()

//Getter和Setter
//常量、变量、属性、下标索引的 Getters 和 Setters 的访问级别继承自它们所属成员的访问级别。
//Setter 的访问级别可以低于对应的 Getter 的访问级别，这样就可以控制变量、属性或下标索引的读写权限。在var 或 subscript 定义作用域之前，你可以通过 private(set) 或 internal(set) 先为它们的写权限申明一个较低的访问级别。
struct TrackedString{//默认internal访问级别
    private(set) var numberOfEdits = 0
    /*
     numberOfEdits 属性的 Getter 依然是默认的访问级别 internal ，但是 Setter 的访问级别是 private ，这表示该属性只有在当前的源文件中是可读写的，而在当前源文件所属的模块中它只是一个可读的属性。
     */
    var value:String = ""{//默认internal访问级别
        didSet{
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
//虽然你可以在其他的源文件中实例化该结构体并且获取到 numberOfEdits 属性的值，但是你不能对其进行赋值。这样就能很好的告诉使用者，你只管使用，而不需要知道其实现细节。

//如果有必要你可以为 Getter 和 Setter 方法设定显式访问级别。下面的例子就是明确申明了 public 访问级别的TrackedString 结构体。结构体的成员（包括 numberOfEdits 属性）拥有默认的访问级别 internal 。你可以结合 public 和 private(set) 修饰符把结构体中的 numberOfEdits 属性 Getter 方法的访问级别设置为 public ，而Setter 方法的访问级别设置为 private ：

public struct TrackedStringTwo{
    public private(set) var numberOfEdits = 0
    public var value:String = ""{
        didSet{
           numberOfEdits += 1
        }
    }
    public init(){
        
    }
}






//初始化
//我们可以给自定义的初始化方法申明访问级别，但是要不高于它所属类的访问级别。如同函数或方法参数，初始化方法参数的访问级别也不能低于初始化方法的访问级别。

//默认初始化方法
//Swift为结构体、类都提供了一个默认的无参初始化方法，用于给它们的所有属性提供赋值操作，但不会给出具体值。默认初始化方法的访问级别与所属类型的访问级别相同。

//结构体的默认成员初始化方法
/*
 如果结构体中的任一存储属性的访问级别为 private ，那么它的默认成员初始化方法访问级别就是 private 。尽管如此，结构体的初始化方法的访问级别依然是 internal。
 
 如果你想在其他模块中使用该结构体的默认成员初始化方法，那么你需要提供一个访问级别为 public 的默认成员初始化方法。
 */








//协议
/*
 如果想为一个协议明确的声明访问级别，那么需要注意一点，就是你要确保该协议只在你声明的访问级别作用域中使用。
 协议中的每一个必须要实现的函数都具有和该协议相同的访问级别。这样才能确保该协议的使用者可以实现它所提供的函数。
 */

//协议继承
//如果定义了一个新的协议，并且该协议继承了一个已知的协议，那么新协议拥有的访问级别最高也只和被继承协议的访问级别相同。比如说，你不能定义一个 public 的协议而去继承一个 internal 的协议

//协议一致性
//类可以采用比自身访问级别低的协议。
//采用了协议的类的访问级别取它本身和所采用协议中最低的访问级别。
//如果采用了协议，那么实现了协议所必须的方法后，该方法的访问级别遵循协议的访问级别。






//扩展
//你可以再条件允许的情况下对类、结构体、枚举进行扩展。扩展成员应该具有和原始类成员一致的访问级别。或者，你可以明确声明扩展的访问级别给该扩展内所有成员声明一个新的默认访问级别。这个新的默认访问级别仍然可以被单独成员所声明的访问级别所覆盖。

//协议的扩展
//如果一个扩展采用了某个协议，那么你就不能对该扩展使用访问级别修饰符来声明了。该扩展中实现协议的方法都会遵循该协议的访问级别。




//泛型
//泛型类型或泛型函数的访问级别取泛型类型、函数本身、泛型类型参数三者中的最低访问级别。






//类型别名
//任何你定义的类型别名都会被当做不同的类型，以便于进行访问控制。一个类型别名的访问级别不可高于原类型的访问级别。






