//: Playground - noun: a place where people can play

import UIKit
/***********************************************************
                chapter29. 연산자 함수
 ************************************************************/
// c++ : 클래스 내 구현 ==> swift : 전역 공간에서 구현
// func 연산자(파라미터) -> return {}
//++, --, += 에대해서 오버로딩을 이용해서 쓸수 있음
/*
struct KSize{
    var width = 0.0
    var height= 0.0
}
struct KOffset{
    var x = 0.0
    var y = 0.0
}

enum KSwitch : String{
    case on = "Switch On"
    case off = "Switch Off"
    case auto = "Switch Auto"
    
    mutating func push(){
        ++self      //연산자 오버로딩을 통한 열거형 멤버 순회
    }
}
class KView{
    var origin = KOffset()
    var size = KSize()
}
//public func +(lhs: String, rhs: String) -> String {}// 표준 라이브러리에 +연산을 지원하는 연산자 함수

/* 책 원본 코드
 #if swift(>3.0)
 postfix func ++(size: inout KSize) -> KSize{
 let current = size;
 size = KSize(width: size.width + 1, height : size.height +1)
 return current
 }
 
 prefix func ++(size: inout KSize) -> KSize{
 size.width += 1;
 size.height += 1;
 return size;           //;부호 언제 붙이는 걸까?
 }
*/

//Ksize class에 대한 연산자 overloading
#if swift(>=3.0)
postfix func ++(size: inout KSize) -> KSize {       //prefix : 임시변수 이용 후위증가 c++에서 취하던 방식 동일
    let current = size                              //(임시로 current라는 변수를 줘서 현 size를 기억하고 그 변수를 반환하여 그 다음줄에서 size가 후위증가를 하도록 하는 형식)
    size = KSize(width: size.width + 1, height : size.height + 1)
    return current
}

prefix func ++(size: inout KSize) -> KSize {        //prefix : c++에서 취하던 방식과 동일
    size.width += 1
    size.height += 1
    return size
}
#else
#endif
//구버젼에 대한 코드

//enum에 대한 연산자 overloading(prefix)
#if swift(>=3.0)
prefix func ++(s: inout KSwitch) -> KSwitch{
    switch s{
    case KSwitch.on:
        s = KSwitch.off
    case KSwitch.off:
        s = KSwitch.auto
    case KSwitch.auto:
        s = KSwitch.on
    }
    return s
}

#else
#endif

var boxSize = KSize(width: 100, height : 200)
let newSize = ++boxSize // prefix result
print(newSize)
print(boxSize)

let anotherSize = boxSize++ //postfix result
print(anotherSize)
print(boxSize)


//1.2  이항 연산자 오버로딩
//이전에 infix 키워드를 썼으나, 현재는 쓰이지 않음

func + (lhs : KSize, rhs: KSize) -> KSize{
    return KSize(width: lhs.width + rhs.width, height : lhs.height + rhs.height)
}

func * (lhs : KSize, times : Double) -> KSize{
    return KSize(width: lhs.width * times, height : lhs.height * times)
}

let size1 = KSize(width: 50, height: 100)
let size2 = KSize(width: 100, height: 200)

var newSize2 = size1 + size2
print(newSize2)
//newSize2 = newSize2 * 2.5
print(newSize2 * 2.5)

//1.3 복합 할당 연산자 오버로딩
//+=, -=, *=...
#if swift(>=3.0)
    func +=(lhs: inout KSize, rhs: KSize){
        //lhs = KSize(width: lhs.width + rhs.width, height : lhs.height + rhs.height)
        lhs = lhs + rhs //단항연산자 + overloading을 이용하였을때 코드가 더 간단해짐
}
#else
#endif

var size3 = KSize(width : 50, height : 100)
size3 += KSize(width : 100, height : 200)
print(size3)


//1.4 비교 연산자 구현(==)
//swift : 사용자 구현 자료형에대해서 ==는 제공 X (어쩌면 당연한 소리...)

func == (lhs : KOffset, rhs : KOffset) -> Bool{
    return lhs.x == rhs.x && lhs.y == rhs.y
}

func != (lhs : KOffset, rhs : KOffset) -> Bool{
    return lhs.x != rhs.x || lhs.y != rhs.y
}

func == (lhs : KSize, rhs : KSize) -> Bool {
    return lhs.width == rhs.width && lhs.height == rhs.height
}

func != (lhs : KSize, rhs : KSize) -> Bool{
    return lhs.width != rhs.width || lhs.height != rhs.height
}

func == (lhs : KView, rhs : KView) -> Bool{
    return lhs.origin == rhs.origin && lhs.size == rhs.size
}

func != (lhs : KView, rhs : KView) -> Bool {
    return lhs.origin != rhs.origin || lhs.size != rhs.size
}

var view1 = KView()
var view2 = KView()

if view1 == view2{
    print("equal")
}
else{
    print("not equal")
}


//1.5 항등 연산자
//a === b a !== b
//클래스는 참조형식이라 메모리 주소까지 참조하는 기능 추가

if view1 === view2{
    print("Identical")
}
else{
    print("Not Identical")
}

view2 = view1
if view1 === view2{
    print("Identical")
}
else{
    print("Not Identical")
}

//2. 사용자 정의 연산자
//Swift : Unicode에 충실한 언어(ex. var ♡ -> 가능)
//다만, 가독성을 위해서 ^, &, ~ 이런 문자들이 조합되는것이 적합
//prefix operator 연산자 {}
//infix operator 연산자 {}
//postifx operator 연산자 {}

//+ swift 3에서 새로 도입된 개념 : 우선순위 그룹
/*
 precedencegroup 우선순위 그룹 이름{
   higherThan : 현재 그룹보다 우선순위가 낮은 그룹 목록
   lowerThan  : 현재 그룹보다 우선순위가 높은 그룹 목록
   associativity : 결합규칙
 }
 */
*/

//2.1 연산자 우선순위
//swift : 기본적으로 사칙연산에 근거한 우선순위 제공
// 기본순서를 바꾸고 싶을때 쓰면 됩니다!
infix operator ** : AdditionPrecedence
infix operator + : MultiplicationPrecedence
infix operator * : AdditionPrecedence

var a = 2 + 3 * 4 ** 3

print(a)
