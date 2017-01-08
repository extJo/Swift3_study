//
//  main.swift
//  loop
//
//  Created by 조성윤 on 2017. 1. 9..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

/// for - in

let list = ["one", "two", "three"]
for str in list {
    print(str)
}
// one
// two
// three

let str = "One"
for ch in str.characters {
    print(ch)
}
// O
// n
// e

for index in 2..<6 {
    print(index)
}
// 2
// 3
// 4
// 5

// 루프 상수 생략
for _ in 3..<5{
    print("_")
}
// _
// _


/// while

var i = 0
while i < 3 {
    print(i)
    i += 1
}
// 0
// 1
// 2

var k = 10
repeat {
    print("repeat-while \(k)")
    k += 1
} while k < 3
// repeat-while 10

print("after repeat-while \(k)")
// after repeat-while 11


