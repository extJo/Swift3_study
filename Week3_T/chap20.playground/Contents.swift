//1. 인스턴스 메소드
print("=============================")
print("1. 인스턴스 메소드")



class SuperHero {
    var name: String
    var secretary: String?
    
    init(heroName: String, secretaryName: String? = nil) {
        name = heroName
        secretary = secretaryName
    }
    
    func callSecretary() {
        if let name = secretary {
            print("Hey, \(name)!")
        } else {
            print("\(name) is working alone.")
        }
    }
    
    func attack(weapon: String, target: String?) -> Bool{
        if let target = target{
            callSecretary()
            print("Attack \(target) with \(weapon)!!!")
            
            return true
        }
        
        return false
    }
    
    
}

var out = SuperHero(heroName:"Iron Man", secretaryName: "Jarvis")
out.callSecretary()
let out2 = SuperHero(heroName: "solo")
out2.callSecretary()
out2.name="withOutMyself"
out2.callSecretary()
out2.self.name="withMyself"
out2.callSecretary()
out2.self.callSecretary()
out2.secretary="not Javis"
out2.callSecretary()
//추가 : 파라미터 추가
print("=============================")
print("추가 : 파라미터 추가")
out2.attack(weapon: "withWeapon", target: "withTarget")



//추가 : self
print("=============================")
print("추가 : self")
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"


//3. 값 형식의 인스턴스 메소드
print("=============================")
print("3. 값 형식의 인스턴스 메소드")


struct Weapon {
    var name: String
    var durability: Int
    
    mutating func use() {
        if durability > 0 {
            durability -= 1 // Error
        }
    }
}

var repulsorBeam = Weapon(name: "Repulsor Beam", durability: 10)
repulsorBeam.use()
print(repulsorBeam.durability)
// 9
repulsorBeam.use()
print(repulsorBeam.durability)
// 8

//3. 추가 : 값 형식은 인스턴스 변수 내에서 인스턴스 자체를 환전히 교체할 수 있음
// mutating으로 선언한 인스턴스 함수 내에서 self에 새로운 인스턴스를 할당
print("=============================")
print("3. 추가 : self로 인스턴스 교체")
import Foundation

struct Weapon2 {
    var name: String
    var durability: Int
    
    mutating func use() {
        
        if durability > 0 {
            durability -= 1
        }
    }
    
    mutating func switchWeapon(_ name: String, durability: Int = 10) {
        self = Weapon2(name: name, durability: durability)
    }
}

var myWeapon = Weapon2(name: "Repulsor Beam", durability: 10)
print(myWeapon.name, myWeapon.durability)
// Repulsor Beam 10
myWeapon.switchWeapon("Mjölnir", durability: 10000)
print(myWeapon.name, myWeapon.durability)
// Mjölnir 10000



