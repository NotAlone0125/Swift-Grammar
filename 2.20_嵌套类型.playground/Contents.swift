//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 枚举类型常被用于实现特定类或结构体的功能。也能够在有多种变量类型的环境中，方便地定义通用类或结构体
 来使用，为了实现这种功能，Swift允许你定义嵌套类型，可以在枚举类型、类和结构体中定义支持嵌套的类型。
 要在一个类型中嵌套另一个类型，将需要嵌套的类型的定义写在被嵌套类型的区域{}内，而且可以根据需要定义多级嵌套。
 */

//嵌套类型实例
struct BlackjackCard{
    // 嵌套定义枚举型Suit
    enum Suit:Character {//花色
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    // 嵌套定义枚举型Rank
    enum Rank:Int {//牌面
        case Two = 2,Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first:Int,second:Int?
        }
        var values:Values{
            switch self {
            case .Ace:
                return Values.init(first: 1, second: 11)
            case .Jack,.Queen,.King:
                return Values.init(first: 10, second: nil)
            default:
                return Values.init(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank:Rank,suit:Suit
    var description:String{
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += "or \(second)"
        }
        return output
    }
    
}





//嵌套类型的引用
let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue















