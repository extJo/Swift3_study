//
//  main.swift
//  optional
//
//  Created by 조성윤 on 2017. 1. 1..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

var optionalNum: Int?
print(optionalNum)  // optional 형식 자체를 출력한다
// nil


/*

var nonOptionalNum: Int
print(nonOptionalNum)   // error
nonOptionalNum = nil    // error
 

*/

var optionalStr: String? = "hello"
print(optionalStr!)
// hello

optionalStr = "new value"
print(optionalStr as Any)
// Optional("new value")

optionalStr = nil
//print(optionalStr!)   // error
// ! 문자는 값을 가지던 안가지던지 상관없이 값을 추출한다

var IUOoptional : String! = "Hey Guys"
print(IUOoptional)


