//
//  main.swift
//  hello
//
//  Created by 조성윤 on 2016. 12. 29..
//  Copyright © 2016년 조성윤. All rights reserved.
//

import Foundation   // 외부 라이브러리나 프레임워크를 사용하기 위해서 import를 사용


let name = "Steve Jobs"
let firstName = "Steve"
let lastName = "Jobs"

let yearString = "2015"

enum TextAlignment {case Left, Right, Center}
enum ViewAlignment {case Left, Right, Center}

print(name)
// Steve Jobs

print(firstName, terminator:"")
print(lastName)
// SteveJobs

print(firstName, lastName)
// Steve Jobs

print(firstName, lastName, separator:"#")
// Steve#Jobs

print(yearString)
debugPrint(yearString)
// 2015
// "2015"

print(TextAlignment.Center)
print(ViewAlignment.Center)
// Center
// Center

debugPrint(TextAlignment.Center)
debugPrint(ViewAlignment.Center)
// TextAlignment.Center
// ViewAlignment.Center




