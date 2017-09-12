//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//可空链式调用
/*
 可空链式调用（Optional Chaining）是一种可以请求和调用属性、方法及下标的过程，它的可空性体现于请求或
 调用的目标当前可能为空（nil）。如果可空的目标有值，那么调用就会成功；如果选择的目标为空（nil），那么
 这种调用将返回空（nil）。多个连续的调用可以被链接在一起形成一个调用链，如果其中任何一个节点为空（ni
 l）将导致整个链调用失败。
 
 注意： Swift 的可空链式调用和 Objective-C 中的消息为空有些相像，但是 Swift 可以使用在任意类型中，并
 且能够检查调用是否成功。
 */





//使用可空链式调用来强制展开
/*
 通过在想调用非空的属性、方法、或下标的可空值（optional value）后面放一个问号，可以定义一个可空
 链。这一点很像在可空值后面放一个叹号（！）来强制展开其中值。它们的主要的区别在于当可空值为空时可空
 链式只是调用失败，然而强制展开将会触发运行时错误。
 
 为了反映可空链式调用可以在空对象（nil）上调用，不论这个调用的属性、方法、下标等返回的值是不是可空
 值，它的返回结果都是一个可空值。你可以利用这个返回值来判断你的可空链式调用是否调用成功，如果调用有
 返回值则说明调用成功，返回 nil 则说明调用失败。
 
 特别地，可空链式调用的返回结果与原本的返回结果具有相同的类型，但是被包装成了一个可空类型值。当可空
 链式调用成功时，一个本应该返回 Int 的类型的结果将会返回 Int? 类型。
 */

class Person{
    var residence:Residence?
}

class Residence{
    var numberOfRows = 1
}

let john = Person()
//john.residence!.numberOfRows//报错unexpectedly found nil while unwrapping an Optional value,因为residence为nil，强制展开numberOfRows属性会报错，因为没有可展开的residence

//可空链式的访问
if let roomCount = john.residence?.numberOfRows{//在 residence 后面添加问号之后，Swift就会在 residence 不为空的情况下访问 numberOfRooms 。
    print("John's residence has \(roomCount) rooms")
}else{
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()
if let roomCount = john.residence?.numberOfRows{
    print("John's residence has \(roomCount) rooms")
}else{
    print("Unable to retrieve the number of rooms.")
}






//为可空链式调用定义模型类
//通过使用可空链式调用可以调用多层属性，方法，和下标。这样可以通过各种模型向下访问各种子属性。并且判断能否访问子属性的属性，方法或下标。
class PersonTwo{
    var residence:ResidenceTwo?
}

class ResidenceTwo{
    var rooms = [Room]()
    var numberOfRooms:Int {
        return rooms.count
    }
    
    subscript(i:Int)->Room{
        get{
            return rooms[i]
        }set{
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address:Address?
}

class Room{
    let name:String
    init(name:String) {
        self.name = name
    }
}

class Address{
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil{
            return buildingNumber
        }else{
            return nil
        }
    }
}
//类Address 提供 buildingIdentifier() 方法，返回值为 String? 。 如果 buildingName 不为空则返回 buildingName ， 如果 buildingNumber 不为空则返回 buildingNumber 。如果这两个属性都为空则返回 nil 。





//通过可空链式调用访问属性
//可以通过可空链式调用访问属性的可空值，并且判断访问是否成功。
let mary = PersonTwo()
if let roomCount = mary.residence?.numberOfRooms {
    print("Mary's residence has \(roomCount) room(s).")
}else{
    print("Unable to retrieve the number of rooms.")
}
//因为 john.residence 为 nil ，所以毫无疑问这个可空链式调用失败。
//通过可空链式调用来设定属性值：
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
mary.residence?.address = someAddress
//在这个例子中，通过 mary.residence 来设定 address 属性也是不行的，因为 mary.residence 为 nil 。







//通过可空链式调用来调用方法
//可以通过可空链式调用来调用方法，并判断是否调用成功，即使这个方法没有返回值。
if mary.residence?.printNumberOfRooms() != nil{
    print("It was possible to print the number of rooms.")
}else{
    print("It was not possible to print the number of rooms.")
}
//同样的，可以判断通过可空链式调用来给属性赋值是否成功。
if (mary.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}






//通过可空链式调用来访问下标
//通过可空链式调用，我们可以用下标来对可空值进行读取或写入，并且判断下标调用是否成功。
if let firstRoomName = mary.residence?[0].name {
    print("The first room name is \(firstRoomName).")
}else{
    print("Unable to retrieve the first room name.")
}//因为 mary.residence 为 nil ，所以下标调用毫无疑问失败了：

mary.residence?[0] = Room.init(name: "BathRoom")//赋值失败， mary.residence 为 nil

let maryHouse = ResidenceTwo()
maryHouse.rooms.append(Room.init(name: "Living Room"))
maryHouse.rooms.append(Room.init(name: "Kitchen"))
mary.residence = maryHouse

if let firstRoomName = mary.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}






//访问可空类型的下标：
//如果下标返回可空类型值，比如Swift中 Dictionary 的 key 下标。可以在下标的闭合括号后面放一个问号来链接下标的可空返回值：
var testScores = ["Dave":[86,82,84],"Bev":[79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72//调用失败






//多层链接
/*
 可以通过多个链接多个可空链式调用来向下访问属性，方法以及下标。但是多层可空链式调用不会添加返回值的可空性。
 也就是说：
 • 如果你访问的值不是可空的，通过可空链式调用将会放回可空值。
 • 如果你访问的值已经是可空的，通过可空链式调用不会变得“更”可空。
 因此：
 • 通过可空链式调用访问一个 Int 值，将会返回 Int? ，不过进行了多少次可空链式调用。
 • 类似的，通过可空链式调用访问 Int? 值，并不会变得更加可空。
 */

//下面的例子访问 john 中的 residence 中的 address 中的 street 属性。这里使用了两层可空链式调用， residence 以及 address ，这两个都是可空值。
if let maryStreet = mary.residence?.address?.street{
    print("John's street name is \(maryStreet).")
} else {
    print("Unable to retrieve the address.")//mary.residence.address 为 nil,因此不能访问mary.residence?.address?.street
}
//mary.residence?.address?.street的返回值为String？，和street属性的类型一致
let maryAddress = Address()
maryAddress.buildingName = "The Larches"
maryAddress.street = "Laurel Street"
mary.residence?.address = maryAddress
if let maryStreet = mary.residence?.address?.street {
    print("John's street name is \(maryStreet).")
} else {
    print("Unable to retrieve the address.")
}







//对返回可空值的函数进行链接
//通过可空链式调用来调用 Address 的 buildingIdentifier() 方法。这个方法返回 String? 类型。
if let buildingIdentifier = mary.residence?.address?.buildingIdentifier(){
    print("Mary's building identifier is \(buildingIdentifier)")
}
//如果要进一步对方法的返回值进行可空链式调用，在方法 buildingIdentifier() 的圆括号后面加上问号：
if let beginWithThe = mary.residence?.address?.buildingIdentifier()?.hasPrefix("The"){
    if beginWithThe {
        print("mary's building identifier begins with \"The\".")
    } else {
        print("mary's building identifier does not begin with \"The\".")
    }
}




