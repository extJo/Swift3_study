//: Playground - noun: a place where people can play

import UIKit
/***********************************************************
                chapter28 : 제네릭 (c++ = template)
************************************************************/

//Generics, Generics Programming -> 일반화 프로그래밍
//자료형에 의존하지 않는 범용 코드
//swift : array, dictionary와 같은 자료형은 제네릭으로 구현

#if swift(>=3.0)
    func swapInteger(lhs: inout Int, rhs: inout Int){
        let tmp = lhs
        lhs = rhs
        rhs = tmp
    }
#else   //swift 구버젼에서의 구문
    func swapInterger(inout lhs lhs: Int, inout rhs: Int){
    let tmp = lhs
    lhs = rhs
    rhs = tmp
    }
#endif

var a = 10
var b = 20
swapInteger(lhs : &a, rhs : &b)
print(a,b)

#if swift(>=3.0)
    func swapValue<T>(lhs : inout T, rhs: inout T){
        let tmp = lhs
        lhs = rhs
        rhs = tmp
}
#endif

var c = 10
var d = 20
swapValue(lhs : &c, rhs : &d)
print(c,d)

/* 형식 파라미터를 두개 이상 선언시 ,
 func doSomethig<T,V>(lhs: T, rhs: V){
 }
 */

//p.629~634 generic queue 구현

//protocol를 generic으로 사용하기 위해서(Associated Type)
// <T> (X), associatedtypep 연관 형식 이름 (O)

protocol Queuealbe_{
    typealias ElementType
}

protocol Queueable{ // protocol Queueable<T> X
    associatedtype ElementType
}
















