//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//集合的可变性
/*
 如果创建一个 Arrays 、 Sets 或 Dictionaries 并且把它分配成一个变量，这个集合将会是可变的。这意味着我
 们可以在创建之后添加更多或移除已存在的数据项来改变这个集合的大小。如果我们把 Arrays 、 Sets 或 Dictio
 naries 分配成常量，那么它就是不可变的，它的大小不能被改变。
 */




//数组(Arrays)，数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。

//数组的简单语法
//Array<T>或者[T],T表示数组元素的类型

//创建数组
var someints=[Int]()
someints.append(3)//添加元素
someints=[]//设为空元素，但是类型仍为Int

var threeDouble:[Double] = [0.0,0.0,0.0]
var anotherThreeDouble:[Double] = [0.0,0.0,0.0]
var addArray = threeDouble+anotherThreeDouble//相加创建数组

var shopList:[String] = ["eggs","milk"]//字面量数组

//访问和修改数组
print("The shopList contains \(shopList.count) items")

if shopList.isEmpty {//判空
    
}

shopList.append("bananer")

shopList += ["baking powder"]

var firstItem = shopList[0]

shopList[0]="six eggs"//swift中可以直接用赋值方式修改索引对于的值
print("\(shopList)")
shopList[0...2]=["apples"]//可以将某范围的元素替换为其他数量、其他值的元素
print("\(shopList)")

shopList.insert("Maple", at: 0)
shopList.remove(at: 0)
shopList.removeLast()

for item in shopList//遍历
{
    
}
for (index,value) in shopList.enumerated()//同时获取索引值和数据项的值
{
    
}





//集合，集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以把集合当做是数组另一形式。
/*
 Set类型的哈希值
 为了存储在集合中，该类型必须是可哈希化的-也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是 Int 类型的，它和其他的对象相同，其被用来比较相等与否，比如 a==b ,它遵循的是 a.hashValue == b.hashValue 。
 Swift 的所有基本类型(比如 String , Int , Double 和 Bool )默认都是可哈希化的，它可以作为集合的值或字典的键值类型。没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。
 */

//Set类型语法
//Set<T>,这里的 T 表示 Set 中允许存储的类型，和数组不同的是，集合没有等价的简化形式。

//创建set
var letters=Set<Character>()

letters.insert("a")//插入值
letters=[]//置空

var favoriteGenres:Set<String> = ["rock","classical","hip hop"]//字面量集合
//一个 Set 类型不能从数组中字面量中独立地被推断出来，因此 Set 类型必须显式声明。然而，由于Swift的类型推导功能，如果你想使用一个数组字面量构造一个Set并且该数组字面量中的所有元素类型相同，那么你无须写出Set 的具体类型。(var favoriteGenres:Set = ["rock","classical","hip hop"])

//访问和修改一个set
print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {//判空
    
}

favoriteGenres.insert("music")
favoriteGenres.remove("music")

if !favoriteGenres.contains("music") {//检查是否包含特定值
    print("不包含")
}

for genre in favoriteGenres{//遍历
    print(genre)
}
for genre in favoriteGenres.sorted(){//特定顺序遍历
    print("\n\(genre)")
}

//完成集合操作,你可以高效的完成 Set 的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。

let oddDigits:Set=[1,2,3,4,5]
let newDigits:Set=[6,7,3,4,5]

let intersectSet = oddDigits.intersection(newDigits)//根据两个集合中都包含的值创建的一个新的集合。
let exclusiveOrSet=oddDigits.symmetricDifference(newDigits)//交集的补集，在一个集合中但不在两个集合中的值创建一个新的集合。
let unionSet=oddDigits.union(newDigits)//根据两个集合的值创建一个新的集合

let subtractSet = oddDigits.subtracting(newDigits)//根据不在该集合中的值创建一个新的集合。

//集合成员关系和相等
let houseAnimals: Set = ["?", "?"]
let farmAnimals: Set = ["?", "?", "?", "?", "?"]
let cityAnimals: Set = ["?", "?"]
houseAnimals.isSubset(of: farmAnimals)//判断一个集合中的值是否也被包含在另外一个集合中。
farmAnimals.isSuperset(of: houseAnimals)//判断一个集合中包含的值是另一个集合中所有的值
farmAnimals.isStrictSubset(of: cityAnimals)//判断一个集合是否是另外一个集合的子集合并且和特定集合不相等。
farmAnimals.isStrictSuperset(of: cityAnimals)//判断一个集合是否是另外一个集合的父集合并且和特定集合不相等。
houseAnimals.isDisjoint(with: cityAnimals)//判断两个结合是否不含有相同的值。





//字典
//Swift 的字典使用 Dictionary<Key, Value> 定义，其中 Key 是字典中键的数据类型， Value 是字典中对应于这些键所存储值的数据类型。

//创建字典
var namesOfIntegers=[Int:String]()

namesOfIntegers[16]="sixteen"//赋值
namesOfIntegers=[:]//置空

var airports:[String:String] = ["YYZ":"Toronto Person","DUB":"Dublin"]//字面量字典

//读取和修改字典
print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {//判空
    
}

airports["LHR"]="London"//增加键值对值
airports["LHR"]="London Heathrow"//相同键被覆盖

airports.updateValue("Dublin airports", forKey: "DUB")

airports["APL"] = "Apple Internation"
airports["APL"] = nil//等于删除该键值对

airports.removeValue(forKey: "LHR")//这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回 nil ：

//字典遍历
for (airportCode, airportName) in airports{//遍历键值对
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys{//遍历所有的key
    
}
for airportName in airports.values{//遍历所有的value
    
}

//方便的创建键和值的数组
let airportCodes = Array(airports.keys)
let airportNames = Array(airports.values)


//Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的 keys 或 values 属性使用 sorted() 方法。同集合（Set）的用法。







