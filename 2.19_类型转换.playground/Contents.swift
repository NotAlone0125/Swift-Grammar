//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类型转换（Type Casting）
/*
 类型转换可以判断实例的类型，也可以将实例看做是其父类或者子类的实例。
 类型转换在 Swift 中使用 is 和 as 操作符实现。这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型。
 你也可以用它来检查一个类是否实现了某个协议，
 */

//你可以将类型转换用在类和子类的层次结构上，检查特定类实例并且转换这个类实例的类型成为这个层次结构中的其他类型。
class MediaItem{
    var name:String
    init(name:String) {
        self.name = name
    }
}

class Movie:MediaItem{
    var director:String
    init(name:String,director:String) {
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem{
    var artist:String
    init(name:String,artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [//Swift的类型检测器能够推理出 Movie 和 Song 有共同的父类 MediaItem ，所以它推断出 [MediaItem] 类作为 library 的类型。
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]






//检查类型（Checking Type）
//用类型检查操作符( is )来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true ，否则返回 false 。
var movieCount = 0
var songCount = 0
for item in library{
    if item is Movie {
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}






//向下转型（Downcasting）
/*
 某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类
 型，用类型转换操作符( as? 或 as! )
 
 因为向下转型可能会失败，类型转型操作符带有两种不同形式。条件形式（conditional form） as? 返回一个
 你试图向下转成的类型的可选值（optional value）。强制形式 as! 把试图向下转型和强制解包（force-unwraps）结果作为一个混合动作。
 
 当你不确定向下转型可以成功时，用类型转换的条件形式( as? )。条件形式的类型转换总是返回一个可选值（op
 tional value），并且若下转是不可能的，可选值将是 nil 。这使你能够检查向下转型是否成功。
 
 只有你可以确定向下转型一定会成功时，才使用强制形式( as! )。当你试图向下转型为一个不正确的类型时，强
 制形式的类型转换会触发一个运行时错误。
 */
for item in library{
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}




//Any 和 AnyObject 的类型转换
/*
 Swift为不确定类型提供了两种特殊类型别名：
 • AnyObject 可以代表任何class类型的实例。
 • Any 可以表示任何类型，包括方法类型（function types）。
 */

//AnyObject 类型
/*
 当在工作中使用 Cocoa APIs，我们一般会接收一个 [AnyObject] 类型的数组，或者说“一个任何对象类型的数
 组”。这是因为 Objective-C 没有明确的类型化数组。但是，你常常可以从 API 提供的信息中清晰地确定数组
 中对象的类型。
 在这些情况下，你可以使用强制形式的类型转换( as )来下转在数组中的每一项到比 AnyObject 更明确的类
 型，不需要可选解析（optional unwrapping）。
 */
let someObject:[AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]
//因为知道这个数组只包含 Movie 实例，你可以直接用( as! )下转并解包到不可选的 Movie 类型：
for object in someObject{
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}
//更简短的形式
for movie in someObject as! [Movie]{
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

//Any 类型
//这里有个示例，使用 Any 类型来和混合的不同类型一起工作，包括方法类型和非 class 类型。它创建了一个可以存储 Any 类型的数组 things 。

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things{
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}





















