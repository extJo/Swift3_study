//
//  main.swift
//  Closure
//
//  Created by 조성윤 on 2017. 1. 12..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

// 파라미터와 리턴형이 없는 클로져
let simpleClosure = { print("Hello world!") }
simpleClosure()
// Hello world!


// 파라미터와 리턴형이 있는 클로져
let simClosure = { (str: String) -> String in
    return "Hello, \(str)"
}
let result = simClosure("Swift Closure")
print(result)
// Hello, Swift Closure


// 클로져를 파라미터로 받는 함수
func performClosure(_ c: (String) -> (String)) {
    let result = c("Swift closure")
    print(result)
}
performClosure(simClosure)
// Hello, Swift closure


// 인라인 클로져. -> 함수선언을 통해서 파라미터의 자료형과 리턴형을 추론
performClosure({str in
    return "Hello, \(str)!!"
})

// 인라인 클로져의 암시적 리턴
performClosure({str in
"inline closure, \(str)"
})

// 클로져 내부에서 사용할 수 있는 축약된 인자 이름을 제공
// 첫번째 인자의 이름은 $0, 두번째 인자의 이름은 $1
// 축약 인자 이름을 사용하면 파라미터 이름 선언과 in 키워드를 생략 할 수 있음
performClosure({ "Hello, \($0)" })



// 연산자 함수
let numbers = [10, 9, 44, 88, 40]

let orderedNumber = numbers.sorted(by: { (lhs: Int, rhs: Int) in
    return lhs < rhs
})
print(orderedNumber)

let ordNumber = numbers.sorted(by: <)
print(ordNumber)


// trailing closure, closure의 내부 구현이 길어지는 경우
// 트레일링 클로져는 클로져가 함수의 마지막 파라미터로 전달되는 경우에만 사용 가능하다
performClosure() {"Trailing Closure, \($0)"}
// 함수에 클로져 파라미터 하나만 존재하는 경우 () 생략 가능
performClosure{"Hello Trailing Closure, \($0)"}


// capture value

var num = 0

let closure = { print("inside of block: \(num)")}

num += 10

print("outside of block: \(num)")

closure()












