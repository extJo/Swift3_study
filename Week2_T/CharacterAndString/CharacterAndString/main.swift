//
//  main.swift
//  CharacterAndString
//
//  Created by 조성윤 on 2017. 1. 11..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

// 문자열 리터럴을 통해서 새로운 문자열 생성
let emptyString = ""
let str = "Swift String"

// 메소드와 생성자를 통해서 생성
let empty = String()
let string = String(stringLiteral: "Swift String")
let nsstr = NSString(string: "Swift String")

// 다양한 자료형의 값으로부터 문자열을 쉽게 생성할 수 있도록 다양한 생성자를 제공
let intValue = 7
let intString = String(intValue)
debugPrint(intString)
// "7"

let doubleValue = 14.44
let douvleString = String(doubleValue)
debugPrint(douvleString)
// "14.44"

let unicode = "\u{2665}"
let unicodeString = String(unicode)
debugPrint(unicodeString)
// Optional("v")

let charList: [Character] = ["S", "w", "i", "f", "t"]
let strFromChar = String(charList)
debugPrint(strFromChar)
// "Swift"

// 문자 생성할때는 반드시 Character로 선언해주어야 함
let char: Character = "A"
debugPrint(char)
// "A"

// 문자의 공백을 처리할때는 반드시 " " 로 처리해야한다. 문자열과는 개념이 다르다
let emptyChar: Character = " "
debugPrint(emptyChar)
// " "

// 문자열 길이를 확인하는 방법 (NSString)
let s: NSString = "Swift String"
print(s.length)     // length 속성은 문자열에 포함된 UTF-16 코드 유닛 수를 리턴합니다.
// 12

// 문자열 길이를 확인하는 방법 (String)
let st: String = "Swift String!!!!"
print(st.characters.count)
// 16



