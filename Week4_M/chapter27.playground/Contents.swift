/***********************************************************
                        chapter27 : 익스텐션
 ************************************************************/
//objective-C == 카테고리, swift는 따로 명명하는것은 없음
/*
 상속과 비슷한 개념이지만 이미 존재하는 클래스에 새로운 기능을 직접 추가할수 있는 기능
 */
import Darwin
/*
extension typename : protocol1, protocol2 {//extension 확장할 형식 이름 : 프로토콜1, 프로토콜n..
    //...
}
 */
//계산 속성 추가가능
public let Pi = M_PI
extension Double {
    var radianValue : Double{
        return (Pi * self) / 180.0
    }
    var degreeValue : Double{
        return self * 180.0 / Pi
    }
}

let degreeValue = 45.0
print("\(degreeValue) degree = \(degreeValue.radianValue) radian")

//method
/* extension이 왜 안되는지 잘 모르겠음...
extension Date {
    func toString(format : String = "yyyyMMdd") -> String{
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

let today = Date()
print(today.toString())
 */