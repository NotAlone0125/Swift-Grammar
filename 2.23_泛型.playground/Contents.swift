//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 泛型代码可以让你写出根据自我需求定义、适用于任何类型的，灵活且可重用的函数和类型。它的可以让你避免
 重复的代码，用一种清晰和抽象的方式来表达代码的意图。
 
 泛型是 Swift 强大特征中的其中一个，许多 Swift 标准库是通过泛型代码构建出来的。事实上，泛型的使用贯穿了整本语言手册，只是你没有发现而已。例如，Swift 的数组和字典类型都是泛型集。你可以创建一个 Int 数组，也可创建一个 String 数组，或者甚至于可以是任何其他 Swift 的类型数据数组。同样的，你也可以创建存储任何指定类型的字典（dictionary），而且这些类型可以是没有限制的。
 */






//泛型所解决的问题
//这里是一个标准的，非泛型函数 swapTwoInts ,用来交换两个Int值：
func swapTwoInts( a:inout Int, b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//swapTwoInts(_:_:) 函数是非常有用的，但是它只能交换 Int 值，如果你想要交换两个 String 或者 Double ，就不得不写更多的函数，如 swapTwoStrings 和 swapTwoDoubles(_:_:) ，如同如下所示：
func swapTwoStrings(a:inout String, b:inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoDoubles(a:inout Double, b:inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//函数功能都是相同的，唯一不同之处就在于传入的变量类型不同。但实际应用中通常需要一个用处更强大并且尽可能的考虑到更多的灵活性单个函数，可以用来交换两个任何类型值，很幸运的是，泛型代码帮你解决了这种问题。（一个这种泛型函数后面已经定义好了。）





//泛型函数,泛型函数 可以工作于任何类型
func swapTwoValues<T>(a:inout T,b:inout T){
    /*
     这个函数的泛型版本使用了占位类型名字（通常此情况下用字母 T 来表示）来代替实际类型名（如 Int 、 String 或 Double ）。占位类型名没有提示 T 必须是什么类型，但是它提示了 a 和 b 必须是同一类型 T ，而不管T 表示什么类型。只有 swapTwoValues(_:_:) 函数在每次调用时所传入的实际类型才能决定 T 所代表的类型。
     
     另外一个不同之处在于这个泛型函数名后面跟着的占位类型名字（T）是用尖括号括起来的（ <T> ）。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数所定义的一个类型。因为 T 是一个占位命名类型，Swift 不会去查找命名为T的实际类型。
     */
    let temporaryA = a
    a = b
    b = temporaryA
}





//类型参数
/*
 在上面的 swapTwoValues 例子中，占位类型 T 是一种类型参数的示例。类型参数指定并命名为一个占位类
 型，并且紧随在函数名后面，使用一对尖括号括起来（如 <T> ）。
 
 一旦一个类型参数被指定，那么其可以被使用来定义一个函数的参数类型（如 swapTwoValues(_:_:) 函数中的参数 a 和 b ），或作为一个函数返回类型，或用作函数主体中的注释类型。在这种情况下，被类型参数所代表的占位类型不管函数任何时候被调用，都会被实际类型所替换（在上面 swapTwoValues 例子中，当函数第一次被调用时， T 被 Int 替换，第二次调用时，被 String 替换。）。你可支持多个类型参数，命名在尖括号中，用逗号分开。
 */





//命名类型参数
/*
 在简单的情况下，泛型函数或泛型类型需要指定一个占位类型（如上面的 swapTwoValues 泛型函数，或一个存
 储单一类型的泛型集，如数组），通常用一单个字母 T 来命名类型参数。不过，你可以使用任何有效的标识符来
 作为类型参数名。
 
 如果你使用多个参数定义更复杂的泛型函数或泛型类型，那么使用更多的描述类型参数是非常有用的。例如，Swi
 ft 字典（Dictionary）类型有两个类型参数，一个是键，另外一个是值。如果你自己写字典，你或许会定义这两个类型参数为 Key 和 Value ，用来记住它们在你的泛型代码中的作用。
 */







//泛型类型
/*
 通常在泛型函数中，Swift 允许你定义你自己的泛型类型。这些自定义类、结构体和枚举作用于任何类型，如同 Array 和 Dictionary 的用法。
 
 这部分向你展示如何写一个泛型集类型-- Stack （栈）。一个栈是一系列值域的集合，和 Array （数组）类
 似，但其是一个比 Swift 的 Array 类型更多限制的集合。一个数组可以允许其里面任何位置的插入/删除操作，而栈，只允许在集合的末端添加新的项（如同push一个新值进栈）。同样的一个栈也只能从末端移除项（如同pop一个值出栈）。
 */

//非泛型版本的栈
struct IntStack{
    var items = [Int]()
    mutating func push(item:Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
}

//泛型版本的栈
struct Stack<T>{
    var items = [T]()
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop()->T{
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push(item: "uno")
stackOfStrings.push(item: "dos")
stackOfStrings.push(item: "tres")
stackOfStrings.push(item: "cuatro")

let fromTheTop = stackOfStrings.pop()







//扩展一个泛型类型
/*
 当你扩展一个泛型类型的时候，你并不需要在扩展的定义中提供类型参数列表。更加方便的是，原始类型定义中
 声明的类型参数列表在扩展里是可以使用的，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数
 的引用。
 */
extension Stack{
    var topItem:T?{//为其添加了一个名为 topItem 的只读计算属性，它将会返回当前栈顶端的元素而不会将其从栈中移除。
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}






//类型约束
/*
 swapTwoValues(_:_:) 函数和 Stack 类型可以作用于任何类型，不过，有的时候对使用在泛型函数和泛型类型上的类型强制约束为某种特定类型是非常有用的。类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。
 
 例如，Swift 的 Dictionary 类型对作用于其键的类型做了些限制。在字典 (页 0)的描述中，字典的键类型必须是可哈希，也就是说，必须有一种方法可以使其被唯一的表示。
 */

//类型约束语法
/*
 你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为类型参数链的一部分。这种作用于泛型
 函数的类型约束的基础语法如下所示（和泛型类型的语法相同）：
 
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 // 这里是函数主体
 }
 第一个类型参数 T ，有一个需要 T 必须是 SomeClass 子类的类型约
 束；第二个类型参数 U ，有一个需要 U 必须遵循 SomeProtocol 协议的类型约束。
 */

//类型约束行为
func findStringIndex(array:[String],valueToFind:String)->Int?{
    for (index,value) in array.enumerated(){
        if value == valueToFind {
            return index
        }
    }
    return nil
}
//findStringIndex(_:_:) 函数可以作用于查找一字符串数组中的某个字符串:
let strings =  ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(array: strings, valueToFind: "parakeet"){
    print("The index of llama is \(foundIndex)")
}

//泛型版本
func findIndex<T:Equatable>(array:[T],valueToFind:T)->Int?{
    /*
     不是所有的 Swift中的类型都可以用等式符（==）进行比较。
     
     Swift 标准库中定义了一个 Equatable 协议，该协议要求任何遵循的类型实现等式符（==）和不等符（!=）对任何两个该类型进行比较。
     */
    for (index,value) in array.enumerated(){
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(array: [3.14159, 0.1, 0.25], valueToFind: 9.3)

let stringIndex = findIndex(array: ["Mike", "Malcolm", "Andrea"], valueToFind: "Andrea")






//关联类型(Associated Types)
/*
 当定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分是非常有用的。一个关联类型作为
 协议的一部分，给定了类型的一个占位名（或别名）。作用于关联类型上实际类型在协议被实现前是不需要指定
 的。关联类型被指定为 associatedtype 关键字。
 */
protocol Container{
    associatedtype ItemType
    mutating func append(item:ItemType)
    var conut:Int {get}
    subscript(i:Int)->ItemType {get}
}
/*
 Container 协议定义了三个任何容器必须支持的兼容要求：
 • 必须可以通过 append(_:) 方法添加一个新元素到容器里；
 • 必须可以通过使用 count 属性获取容器里元素的数量，并返回一个 Int 值；
 • 必须可以通过容器的 Int 索引值下标可以检索到每一个元素。
 
 这个协议没有指定容器里的元素是如何存储的或何种类型是允许的。这个协议只指定三个任何遵循 Container 类型所必须支持的功能点。一个遵循的类型在满足这三个条件的情况下也可以提供其他额外的功能。
 
 任何遵循 Container 协议的类型必须指定存储在其里面的值类型，必须保证只有正确类型的元素可以加进容器
 里，必须明确可以通过其下标返回元素类型。
 
 为了定义这三个条件， Container 协议需要一个方法指定容器里的元素将会保留，而不需要知道特定容器的类
 型。 Container 协议需要指定任何通过 append(_:) 方法添加到容器里的值和容器里元素是相同类型，并且通过容器下标返回的容器元素类型的值的类型是相同类型。
 */

//这里是一个早前 IntStack 类型的非泛型版本，遵循 Container 协议
struct IntStackTwo:Container{
    // IntStack的原始实现
    var items = [Int]()
    mutating func push(item:Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
    
    /*
     IntStack 类型实现了 Container 协议的所有三个要求，在 IntStack 类型的每个包含部分的功能都满足这些要求。
     此外， IntStack 指定了 Container 的实现，适用的 ItemType 被用作 Int 类型。对于这个 Container 协议实现而言，定义 typealias ItemType = Int ，将抽象的 ItemType 类型转换为具体的 Int 类型。
     */
    
    //遵循Container协议的实现
    typealias ItemType = Int
    mutating func append(item: Int) {
        self.push(item: item)
    }
    var conut: Int{
        return items.count
    }
    subscript(i:Int)->Int{
        return items[i]
    }
}

//你也可以生成遵循 Container 协议的泛型 Stack 类型：

struct StackTwo<T>:Container{
    var items = [T]()
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop()->T{
        return items.removeLast()
    }
    mutating func append(item:T) {
        self.push(item: item)
    }
    var conut: Int{
        return items.count
    }
    subscript(i:Int)->T{
        return items[i] as! T
    }
}

//扩展一个存在的类型为一指定关联类型
/*
 在扩展中添加协议成员 (页 0)中有描述扩展一个存在的类型添加遵循一个协议。这个类型包含一个关联类型的
 协议。
 
 Swift的 Array 已经提供 append(_:) 方法，一个 count 属性和通过下标来查找一个自己的元素。这三个功能都达到 Container 协议的要求。也就意味着你可以扩展 Array 去遵循 Container 协议，只要通过简单声明 Array适用于该协议而已。如何实践这样一个空扩展，在通过扩展补充协议声明 (页 0)中有描述这样一个实现一个空扩展的行为：
 
 extension Array: Container {}
 
 如同上面的泛型 Stack 类型一样， Array 的 append(_:) 方法和下标保证 Swift 可以推断出 ItemType 所使用的适用的类型。定义了这个扩展后，你可以将任何 Array 当作 Container 来使用。
 */
 extension Array: Container {
    
}




//Where 语句
/*
 类型约束 (页 0)能够确保类型符合泛型函数或类的定义约束。
 
 对关联类型定义约束是非常有用的。你可以在参数列表中通过where语句定义参数的约束。一个 where 语句能够
 使一个关联类型遵循一个特定的协议，以及（或）那个特定的类型参数和关联类型可以是相同的。你可以写一个
 where 语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个
 或多个类型和关联类型间的等价(equality)关系。
 */
func allItemsMatch<C1:Container,C2:Container where C1.ItemType == C2.ItemType,C1.ItemType:Equatable>(someContainer: C1, anotherContainer: C2)->Bool{
    
    /*
     • C1 必须遵循 Container 协议 (写作 C1: Container )。
     • C2 必须遵循 Container 协议 (写作 C2: Container )。
     • C1 的 ItemType 同样是C2的 ItemType （写作 C1.ItemType == C2.ItemType ）。
     • C1 的 ItemType 必须遵循 Equatable 协议 (写作 C1.ItemType: Equatable )。
     */
    
    //检查两个Container的元素个数是否相同
    if someContainer.conut != anotherContainer.conut {
        return false
    }
    
    //检查两个Container相应位置的元素彼此是否相等
    for i in 0..<someContainer.conut{
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    //如果所有元素检查都相同则返回true
    return true
}
var stackOfStringsTwo = StackTwo<String>()
stackOfStringsTwo.push(item: "uno")
stackOfStringsTwo.push(item: "dos")
stackOfStringsTwo.push(item: "tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(someContainer: stackOfStringsTwo, anotherContainer: arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}



