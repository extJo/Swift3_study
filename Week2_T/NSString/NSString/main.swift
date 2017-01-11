//
//  main.swift
//  NSString
//
//  Created by 조성윤 on 2017. 1. 11..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

// NSString 인 경우
// isEqulToString 을 사용하는 경우
let a: NSString = "Apple"
let b = "Orange"

if(a.isEqual(to: b)){
    print("Equal")
} else {
    print("Not Equal")
}
// Not Equal
// 이 메소드는 문자열의 길이와 각 문자의 코드 유닛을 모두 비교. 코드 유닛 비교하므로 대소문자도 구분

let c = "apple"

if(a.isEqual(to: c)){
    print("Equal")
} else {
    print("Not Equal")
}
// Not Equal


// compare를 사용하는 경우. return 결과는 NSComparisionResult 열거형 이다. 두 문자의 동일성 뿐만아니라 사전 정렬순서를 표현 가능.
let result = a.compare(b)

switch result {
case .orderedAscending:
    print("ASC")
case .orderedSame:
    print("SAME")
case .orderedDescending:
    print("DESC")
}
// ASC

let d = "Banana"
let result2 = c.compare(d)

switch result2 {
case .orderedAscending:
    print("ASC")
case .orderedSame:
    print("SAME")
case .orderedDescending:
    print("DESC")
}
// DESC
// 사전순은 apple이 먼저인게 맞으나 코드로 본다면 a가 B보다 코드값이 크다.


// caseInsensitiveCompare(_:)를 사용하는 경우, 두 문자열간에 대소문자 구분이 필요없을때 사용
let result3 = a.caseInsensitiveCompare(c)
if (result3 == ComparisonResult.orderedSame){
    print("Equal")
} else {
    print("Not Equal")
}
// Equal



// String 인 경우
let m = "Apple"
let n = "apple"

if m < n {
    print("ASC")
} else if m == n {
    print("SAME")
} else {
    print("DESC")
}
// ASC

