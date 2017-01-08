//
//  main.swift
//  optional_binding
//
//  Created by 조성윤 on 2017. 1. 2..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

var optionalStr: String?

if optionalStr != nil {
    print(optionalStr!)
} else {
    print("empty")
}

// empty
// 위와같은 if문으로 변수에 유효한 값이 있는지 확인 할 수 있지만 여전히 ! 연산자를 통해서 값을 추출하는 과정이 필요하다


var optionalS: String? = "hello"

// 임시 상수 선언
if let str = optionalS {
    print(str)
}
// hello

// 임시 변수 선언
if var str = optionalS {
    str += " swift!"
    print(str)
}
// hello swift


var firstname: String? = "Steve"
var lastname: String? = "Jobs"

if let first = firstname {
    if let last = lastname {
        if last == "Jobs"{
            print(first, last)
        }
    }
}
// Steve Jobs
// 위와같이 옵셔널 바인딩 구문은 두 개 이상의 바인딩을 처리 할 수 있다. (1.2 버전 이후)

var deposit: Int? = 3000
var iceCream: Int? = 5000

if let d = deposit, let i = iceCream {
    if i > d {
        print("you can't eat Ice Cream")
    }
    else {
        print("you can eat very delicious Ice Cream")
    }
}
// you can't eat Ice Cream
// 두 개 이상의 바인딩을 더 간략하게 처리할 수 있도록 한 라인에 처리할 수 있다

if let d = deposit, let i = iceCream, i > d{
    print("you can't eat Ice Cream!!!")
}
// you can't eat Ice Cream!!!




