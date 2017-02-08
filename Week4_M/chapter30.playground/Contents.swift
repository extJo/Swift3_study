//: Playground - noun: a place where people can play

import UIKit
/***********************************************************
                    chapter30. 전처리기
 ************************************************************/
//swift와 전처리 지시어
//Swift는 전처리기가 없습니다!!

//if 조건식
//   조건식이 참일 때 컴파일 대상에 포함시킬 코드
//#endif

#if os(OSX) || os(macOS)
    print("macOS")
#elseif os(iOS)
    print("iOS")
#elseif os(tvOS)
    print("tvOS")
#elseif os(watchOS)
    print("watchOS")
#elseif os(Linux)
    print("Linux")
#else
    print("UnKnown OS")
#endif

//3.swift()
#if swift(>=3.0)
//swift 3.0 버전 코드
#else
//swift 3.0 이저 버전 코드
#endif