//3.1 Stored Property(저장 속성)
print("3.1 Stored Property(저장 속성)")
struct Contact {
    var email:String?
    var mobile:String?
    var fax:String?
}

var james = Contact()
james.email = "test@test.com"
print(james.email!)

class Contact2 {
    var email:String?
    var mobile:String?
}

var jane = Contact2()
jane.email = "jane@test.com"
print(jane.email!)

//3.2 Lazy Stored Properties(지연 저장 속성)
print("=============================")
print("3.2 Lazy Stored Property(지연 저장 속성)")
struct Contact3 {
    var email:String?
    var mobile:String?
    
    init(){
        print("new Contact3 instance")
    }
}

class Person{
    var name = ""
    var age=0
    
    lazy var contacts = Contact3()
    
    init() {
        print("new Peson instance")
    }
}

let james2 = Person()
print(james2.name)
print(james2.age)

james2.contacts.email = " test@test.com"

//3.3 Computed Properties(계산 속성)
print("=============================")
print("3.3 Computed Properties(계산 속성)")

import Foundation

class Person33{
    var name: String=""
    var birthDate: Date?
    var age: Int {
        get {
            if let date = birthDate{
                let calendar = NSCalendar.current
                let components = calendar.dateComponents([Calendar.Component.year], from: date, to: Date())
                return components.year ?? -1
            }
            return -1
        }
        set {
            let calendar = NSCalendar.current
            birthDate = calendar.date(byAdding: .year, value: newValue * -1, to: Date())
        }
    }
}

let calendar = NSCalendar.current
var componets = DateComponents()

componets.year = 1977
componets.month = 11
componets.day = 17

let james33 = Person33()
james33.birthDate = calendar.date(from: componets)
print(james33.age)

//3.4 Type Properties(형식 속성)
print("=============================")
print("3.4 Type Properties(형식 속성)")
import UIKit

enum Days: Int {
    static var targetLocale = "en"
    static var localizedWeekdayNames: [String] {
        switch Days.targetLocale {
        case "kr":
            return ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
        default:
            return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        }
    }
    
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

let today = Days.friday
let tomorrow = Days.saturday

Days.targetLocale = "us"
print(Days.localizedWeekdayNames[today.rawValue])
print(Days.localizedWeekdayNames[tomorrow.rawValue])
// Friday
// Saturday
Days.targetLocale = "kr"
print(Days.localizedWeekdayNames[today.rawValue])
print(Days.localizedWeekdayNames[tomorrow.rawValue])
// 금요일
// 토요일

//4. 속성 감시자
print("=============================")
print("4. 속성 감시자")
import UIKit
class Person4 {
    var name = "John doe" {
        willSet {
            print("Current name is \(name). New name is \(newValue).")
        }
        didSet {
            print("Current name is \(name). Old name is \(oldValue).")
        }
    }
}

let p = Person4()
p.name = "James"
// Current name is John doe. New name is James.
// Current name is James. Old name is John doe.

