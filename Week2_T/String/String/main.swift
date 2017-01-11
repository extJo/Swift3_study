//
//  main.swift
//  String
//
//  Created by 조성윤 on 2017. 1. 11..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

let str = "Swift String"
let firstCh = str[str.startIndex]
print(firstCh)
// S
// startIndex 속성 사용

let lastCh = str[str.index(before: str.endIndex)]
print(lastCh)
// g
// 마지막 인덱스는 endIndex속성으로 얻을 수 있다. 하지만 마지막 인덱스와 마지막 문자는 다르다는 점이다.
// 마지막 인덱스는 마지막 문자의 다음 인덱스이다.
// 그래서 마지막 문자에 접근하려면 메소드를 통해서 이전 인덱스를 얻어야 한다.

let emptyString = ""
if emptyString.startIndex == emptyString.endIndex {
    print("Empty String")
}

// 이전 인덱스를 얻을때는 index(before:) 메소드를 사용하고, 다음 인덱스를 얻을때는 index(after:) 메소드 사용
let secondChar = str[str.index(after: str.startIndex)]
print(secondChar)
// w

// 전달된 횟수만큼 이동한 인덱스를 리턴하는 메소드 index(_:offset:)
let thirdChar = str[str.index(str.startIndex, offsetBy: 2)]
print(thirdChar)
// i

// 인덱스를 마이너스로 사용할 수도 있다.
let secondLastChar = str[str.index(str.index(before: str.endIndex), offsetBy: -1)]
print(secondLastChar)
// n

/// 인덱스를 사용할때는 항상 범위내의 인덱스여야한다.

let range = str.startIndex..<str.index(str.startIndex, offsetBy: 5)
let subStr = str[range]
print(subStr)
// Swift
// 주의할 점은 정수 범위는 사용이 불가능 하다.


// String 문자열은 Swift의 빠른 열거를 통해 쉽게 순회 할 수 있다. 주의할 점은 순회할 문자열의 뷰를 지정해주어야 함
let str2 = "Apple"
for ch in str2.characters {
    print(ch)
}




