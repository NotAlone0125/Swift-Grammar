//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//高级运算符
/*
 与C语言中的算术运算符不同，Swift 中的算术运算符默认是不会溢出的。所有溢出行为都会被捕获并报告为错误。如果想让系统允许溢出行为，可以选择使用 Swift 中另一套默认支持溢出的运算符，比如溢出加法运算符( &+ )。所有的这些溢出运算符都是以 & 开头的。
 
 在定义自有的结构体、类和枚举时，最好也同时为它们提供标准swift运算符的实现。Swift简化了运算符的自定义实现，也使判断不同类型所对应的行为更为简单。
 
 我们不用被预定义的运算符所限制。在 Swift 当中可以自由地定义中缀、前缀、后缀和赋值运算符，以及相应的优先级与结合性。这些运算符在代码中可以像预设的运算符一样使用，我们甚至可以扩展已有的类型以支持自定义的运算符。
 */



//位运算符
/*
 位运算符( Bitwise operators )可以操作一个数据结构中每个独立的位。它们通常被用在底层开发中，比如图形编程和创建设备驱动。位运算符在处理外部资源的原始数据时也十分有用，比如对自定义通信协议传输的数据进行编码和解码。
 */

//按位取反运算符( bitwise NOT operator ),0变为1，1变为0
let initialBits:UInt8 = 0b00001111
let invertedBits = ~initialBits//0b11110000

//按位与运算符(Bitwise AND Operator)
//按位与运算符( & )可以对两个数的比特位进行合并。它返回一个新的数，只有当两个操作数的对应位都为 1 的时候，该数的对应位才为 1 。
let firstSixBits:UInt8 = 0b11111100
let lastSixBits:UInt8 =  0b00111111
let middleFourBits = firstSixBits & lastSixBits//0b00111100

//按位或运算符(Bitwise OR Operator)
//按位或运算符( | )可以对两个数的比特位进行比较。它返回一个新的数，只要两个操作数的对应位中有任意一个为1 时，该数的对应位就为 1 。
let combineBits = firstSixBits | lastSixBits//0b11111111

//按位异或运算符(Bitwise XOR Opoerator)
//按位异或运算符( ^ )可以对两个数的比特位进行比较。它返回一个新的数，当两个操作数的对应位不相同时，该数的对应位就为 1 ：
let outputBits = firstSixBits ^ lastSixBits//0b11000011

//按位左移/右移运算符
/*
 按位左移运算符( << )和按位右移运算符( >> )可以对一个数进行指定位数的左移和右移，但是需要遵守下面定义的规则。

 对一个数进行按位左移或按位右移，相当于对这个数进行乘以 2 或除以 2 的运算。将一个整数左移一位，等价于将这个数乘以 2，同样地，将一个整数右移一位，等价于将这个数除以 2。
 */

//无符号整型的移位操作
/*
对无符号整型进行移位的规则如下：
1. 已经存在的比特位按指定的位数进行左移和右移。
2. 任何移动超出整型存储边界的位都会被丢弃。
3. 用 0 来填充移动后产生的空白位。
*/
let shiftBits:UInt8 = 4//即二进制的00000100
shiftBits << 1  //00001000
shiftBits << 2  //00010000
shiftBits << 5  //10000000
shiftBits << 6  //00000000
shiftBits >> 2  //00000001
//可以使用移位操作对其他的数据类型进行编码和解码：
let pink:UInt32 = 0xCC6699                 //十六进制中每两个字符表示 8 个比特位
let redComponet = (pink & 0xFF0000) >> 16  // redComponent 是 0xCC, 即 204
//pink & 0xFF0000 = 0xCC0000 ,  0xCC0000 >> 16 = 0x00CC00 = 0xCC
let greenComponet = (pink & 0x00FF00) >> 8 // greenComponent 是 0x66, 即 102
let blueComponet = pink & 0x0000FF         // blueComponent 是 0x99, 即 153

//有符号整型的移位操作
//对比无符号整型来说，有符整型的移位操作相对复杂得多，这种复杂性源于有符号整数的二进制表现形式。(为了简单起见，以下的示例都是基于 8 位有符号整数的，但是其中的原理对任何位数的有符号整数都是通用的。)





