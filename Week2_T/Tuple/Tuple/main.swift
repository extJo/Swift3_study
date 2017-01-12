//
//  main.swift
//  Tuple
//
//  Created by 조성윤 on 2017. 1. 12..
//  Copyright © 2017년 조성윤. All rights reserved.
//

import Foundation

let member = (1, "James", "Seoul", "000-0000-0000")
var result = (true, "1 record(s) fetched successfully")

print(member.1)

// 튜플 분해과정에서 모든값을 분해할 필요가 없다면 불필요한 값을 _ 로 제외할수 있다.

let (memberId, name, address, tel) = member
print(memberId)

var (_, message) = result
print(message)

// 항상 갯수를 맞추어 주어야한다

// Named tuple
let drink = (coffe: "latte", tea: "herb", diary: "milk")

let Coffe = drink.coffe
let Tea = drink.tea
