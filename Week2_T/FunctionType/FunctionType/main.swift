//
//  main.swift
//  FunctionType
//
//  Created by 조성윤 on 2017. 1. 12..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

func add(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a+b
}
func substract(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a+b
}
func multifly(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a+b
}
func divide(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a+b
}

let firstOperand = 2
let secondOperand = 3
let op = "*"

var function: ((Int, Int) -> Int)?

switch op {
    case "+":
    function = add
    case "-":
    function = substract
    case "*":
    function = multifly
    case "/":
    function = divide
default:
    break
}

if let calc = function {
    let result = calc(firstOperand, secondOperand)
    print("\(firstOperand) \(op) \(secondOperand) = \(result)")
} else {
    print("not supported")
}


