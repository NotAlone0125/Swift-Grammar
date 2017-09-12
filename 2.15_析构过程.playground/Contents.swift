//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//析构过程（Deinitialization）
//析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字 deinit 来标示，类似于构造器要用 init 来标示。






//析构过程原理
/*
 Swift 会自动释放不再需要的实例以释放资源。但是，当使用自己的资源时，你可能
 需要进行一些额外的清理。例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在
 类实例被释放之前手动去关闭该文件。
 */

//每个类最多只能有一个析构器，而且不带任何参数
//deinit{
//    //执行析构过程
//}

/*
 析构器是在实例释放发生前被自动调用。析构器是不允许被主动调用的。子类继承了父类的析构器，并且在子类
 析构器实现的最后，父类的析构器会被自动调用。即使子类没有提供自己的析构器，父类的析构器也同样会被调
 用。
 因为直到实例的析构器被调用时，实例才会被释放，所以析构器可以访问所有请求实例的属性，并且根据那些属
 性可以修改它的行为（比如查找一个需要被关闭的文件）
 */








//析构器操作
struct Bank{
    static var coinslnBank = 10_000
    static func vendCoins(numberOfCoinsToVend:Int)->Int{
        var numberOfCoinsToVendCopy = numberOfCoinsToVend
        numberOfCoinsToVendCopy = min(numberOfCoinsToVend,coinslnBank)
        coinslnBank -= numberOfCoinsToVendCopy
        return numberOfCoinsToVendCopy
    }//模拟游戏银行支出
    static func receiveCoins(coins:Int){
        coinslnBank += coins
    }//模拟游戏银收入
}
class Player{
    var coinslnPurse:Int
    init(coins:Int) {//初始游戏币
        coinslnPurse = Bank.vendCoins(numberOfCoinsToVend: coins)
    }
    func winCoins(coins:Int) {//赢得游戏币
        coinslnPurse += Bank.vendCoins(numberOfCoinsToVend: coins)
    }
    deinit {//玩家将游戏币返回给银行
        Bank.receiveCoins(coins: coinslnPurse)
    }
}
var playerOne:Player? = Player.init(coins: 100)
print("A new player has joined the game with \(playerOne!.coinslnPurse) coins")
print("There are now \(Bank.coinslnBank) coins left in the bank")

playerOne!.winCoins(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinslnPurse) coins")
print("The bank now only has \(Bank.coinslnBank) coins left")

playerOne = nil//必须为可选类型才能设为nil。此时析构器自动调用，银行收到玩家游戏币
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinslnBank) coins")




