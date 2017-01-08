//
//  main.swift
//  range_operator
//
//  Created by 조성윤 on 2017. 1. 9..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

print("Closed Range Operator")
// Closed Range Operator
let range = 0...3
for index in range {
    print(index)
}
// 0
// 1
// 2
// 3

print("Half-Open Range Operator")
// Half-Open Range Operator
let range2 = 0..<3
for index in range2 {
    print(index)
}
// 0
// 1
// 2

print("Reverse Range")
// Reverse Range
let range3 = 1..<4
for index in range3.reversed() {
    print(index)
}
// 3
// 2
// 1

