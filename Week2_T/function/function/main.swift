//
//  main.swift
//  function
//
//  Created by 조성윤 on 2017. 1. 12..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

// 리턴 타입을 명시 하지 않는 경우
func printHello(){
    print("Hello")
}
printHello()
// Hello


// 리턴 타입을 명시하는 경우
func addOne(x: Int) -> Int {    // 여기서 x는 Formal parameter 라고 함.
    return x + 1
}
var value = 7   // argument, 인자
print(addOne(x: value))
// 4

func multyply(value x: Int, multiplier by: Int) -> Int {
    return x*by
}
print(multyply(value: 10, multiplier: 4))
// 40

func add(_ x:Int, value y:Int) -> Int {
    return x + y
}
print(add(3, value: 4))
// 7

func addFive(x: Int, y:Int = 5) -> Int{
    return x + y
}
print(addFive(x: 4))
// 9


// 가변 파라미터
func plus(_ numbers: Int...) -> Int {
    var sum = 0
    
    for n in numbers {
        sum += n
    }
    return sum
}

var result = plus(1, 2)
print(result)
// 3
result = plus(1, 2, 3)
print(result)
// 6



//////// call by reference
func swap(_ lhs:UnsafeMutablePointer<Int>, _ rhs:UnsafeMutablePointer<Int>) {
    let tmp = lhs.pointee
    lhs.pointee = rhs.pointee
    rhs.pointee = tmp
}

var a = 1
var b = 2
swap(&a, &b)
print(a, b)

// 가변 파라미터 사용
func swap2(_ lhs: inout Int, _ rhs: inout Int) {
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}
swap2(&a, &b)
print(a, b)



