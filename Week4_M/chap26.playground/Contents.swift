//: Playground - noun: a place where people can play

import UIKit

/***********************************************************
                    chapter26 : 프로토콜
************************************************************/

//프로토콜 : 특정 업무를 처리하기 위해 따르는 공통규약
//        넓은 범위 : 제조사의 제품을 혼합사용 가능

//======================================================================================
//        좁은 범위 : 공통적으로 제공하는 기능목록 -> java, c# 인터페이스와 같은것
//                  프로토콜을 채용한 클래스, 구조체, 열거형이 공통적으로 구현해야할 메소드, 속성을 선언
//======================================================================================

//        선    언 : 메소드와 속성의 선언만 포함 -> 반드시 구현해야 하는 필수요소, 선택의 옵션 요소를 구분 가능


//책의 예시 : 미디어 재생, 리모컨 조작-> 프로토콜 ===> TV클래스를 구현하는 방법 제시
//          미디어 재생기능 : 재생,   일시중지,   정지, 이전,다음 트랙
//          리모컨 조작기능 : power on,off, 음량조절, 이전,다음 채널

class Device : NSObject{
    var modelName : String;
    
    init(name : String){        //constructor
        modelName = name;
    }
}

protocol protoname{
    //속성 선언
    //메소드 선언
    //생성자 선언
}
//inheritance


/* 프로토콜은 다중상속이 가능합니다, protocol => ADT, protocol안에 세부기능을 쓰는것이 불가(일종의 pure virtual 개념)
protocol protoname1 : protoname, protonameN..{
    //...
}
*/

protocol temp{
}

protocol temp2{
}

protocol inher : temp, temp2{
}
//protocol은 기본적으로 필수요소에 대한 포함된 요소를 나타냄
//선택적 선언을 해 주고 싶을시,optional키워드를 추가, 그 프로토콜선언 + 요소 선언 앞 @objc 속성 추가

@objc protocol protoname2{
    @objc optional //attirbute  declaration
    @objc optional //   method  declaration
}

//======================================================================================
//책의 예시
//          미디어 재생기능 : 재생,   일시중지,   정지  (requirement)  //   이전,다음 트랙(optional)
//          리모컨 조작기능 : power on,off, 음량조절  (requirement)  //   이전,다음 채널(optional)
@objc protocol MediaPlayable{
    func play()
    func pause()
    func stop()
    
    @objc optional func nextChannel() //C++ virtual 함수
    @objc optional func prevChannel()
}
@objc protocol RemoteControllable: MediaPlayable{
    func on()
    func off()
    func volumeUp()
    func volumeDown()
    
    @objc optional func nextChannel()
    @objc optional func prevChannel()
}
//======================================================================================


// 프로토콜 속성 선언 : 반드시 var 선언
//    형식 속성 선언 : static var
//    읽기/쓰기 특성 : get, set

//======================================================================================
//책의 예시
//          미디어 재생기능 : 재생,   일시중지,   정지  (requirement)  //   이전,다음 트랙(optional)
//          리모컨 조작기능 : power on,off, 음량조절  (requirement)  //   이전,다음 채널(optional)

@objc protocol RemoteControllable1: MediaPlayable{
    static var firmwareVersion : String {get}               //프로토콜 버전에 대한 형식
    var isOn : Bool { get set }                             //전원 상태를 나타내는 인스턴트 속성
        
    
}
//======================================================================================


//2.1 protocol setting declaration
// static var 속성 이름 : 자료형 {읽기/쓰기 특성}
// var 속성 이름 : 자료형 {읽기/쓰기 특성}

//=====================예시======================
@objc protocol RemoteControllable: MediaPlayable{
    static var firmwareVersion : String { get}
    var inOn : Bool{get set}

}
//==============================================


//2.2 Method declaration
//static func funcname(parameter) -> return
//       func funcname(parameter) -> return
//mutatic func funcname(parameter) -> return : 값 형식을 프로토콜로 채용하는데 형식 속성을 변경할 가능성이 있을 경우


//Develope doc ==> Mutating methods can assign and entirely new instance to the implicit self property.
//             ==> 바꾸려는 인자에 대해서 암시적으로 선언된 self(본인)에 적용할수 있다(할당할 수 있다)

/*
 struct Point{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = Point(x: x + deltaX, y : y + deltaY)
    }
 }
*/

//protocol constructor declaration
//init(parameter)
//init?(parameter)
//init!(parameter)
//protocol에 init가 있을때 protocol를 받는 class -> 생성자 선언 앞 required 추가(클래스가 final이면 생략가능)
//                       하위 class에서 재정의시 -> required override


//프로토콜 채용한 클래스 (struct, enum 동일)
//class name : 상위 클래스, 프로토콜 이름 목록 { -->목록 : 다중상속이 가능함을 의미
    //....
//}

//예제 p.578~579 , @objc class DVDPlayer : Device, MdeiaPlable, RemoteControllable
//예제 주의 : get,set을 이용할떄
//protocol 선언 get ==> class :  get,set (O)
//protocol 선언 get,set ==> class : get (X)


//프로토콜 형식 : Remotecontroller에 대해서
//자료형을 들고올때 다른 인스턴스에 대해서 들고오지 못한다(당연한 소리// swift는 컴파일 애러 처리)
//DVDPlayer : Device, MediaPlayable, RemoteControllable => play ,pause, stop, on, off, volumeUP, volumeDown, eject
//MP3Player : Device, MediaPlayable                     => play, pause, stop,          nextMedia, prevMedia
//SmartTV   : Device,              , RemoteControllable => play, pause, stop, on, off, volumeUp, volumeDown,                      
//                                                                                     nextMedia, prevMedia

@objc class RemoteController : Device {
    var pairedDevice : Device //DVDPlayer, Mp3player, SmartTV 모두 공통된 것으로 들고와야함
                              //Device는 MediaPlayable, RemoteControllable를 들고 있지 않음 ==> RemoteControllable!!
    var pariedDevice : RemoteControllable? //연동 디바이스는 아직 없음으로 optional선언
}
let r = RemoteController()
r.pairedDevice = SmartTV()
//p.589~591

//Swift 프로토콜 적합성 검사 : 상속을 제대로 받았는지 확인 하는 목적이나, swift는 이를 컴파일 애러로 처리하므로 굳히 필요하지 않음
//구문 : instance is protocolname












