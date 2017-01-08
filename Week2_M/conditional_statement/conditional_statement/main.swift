//
//  main.swift
//  conditional_statement
//
//  Created by 조성윤 on 2017. 1. 9..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

// if 문은 여타 언어와 동일하기때문에 생략
// switch 문도 이하동문.



/// guard (swift only)

// if statement
let priceOfIce = 5000

if priceOfIce > 4000 {
    print("it's too expensive")
} else {
    print("Yam Yam")
}

// guard statement
func ice(x:Int){
    guard x > 4000 else {
        print("Yam Yam")
        return
    }
    print("It's too expensive!!!!")
}

ice(x: priceOfIce)
// It's too expensive!!!!
// guard가 익숙하게 사용된다면, 가독성이 영향을 많이 줄 것 이다.


//label statements
OUTER: for i in 0..<3 {
    for j in 0...10 {
        if j > 2 {
            break OUTER
        }
        print("inner \(j)")
    }
    print("OUTER \(i)")
}
// label을 사용함으로써 좀 더 직관적으로 코드 작성이 가능하다.
