//
//  main.swift
//  Nil_Coalescing_operator
//
//  Created by 조성윤 on 2017. 1. 9..
//  Copyright © 2017년 조성윤. All rights reserved.
//

// Nil Coalescing Operator

import Foundation

var name: String?

if let n = name {
    print(n)
} else {
    print("John Doe")
}
// John Doe


print(name != nil ? name! : "John Doe")
// John Doe
// 코드 길이가 짧아졌지만, name에서 강제로 값을 추출해야 하는 단점이 있다.


/* Nil Coalescing Operator */

var icecream: String?
print(icecream ?? "Merona")
// Merona

print(icecream ?? 5000)
// 5000

//var sub: String?
//let validName = name ?? 0
// error
// ??으로 리턴되는 값을 새로운 변수에 할당하는 경우에 양쪽의 자료형이 다른경우에는 에러가 발생한다. swift의 엄격한 자료형 구분 때문

var Vname: String?
let validNmae = Vname ?? "John"
print(validNmae)
// John

var num: Int?
let validNum = num ?? 0
debugPrint(validNum)
// 0
