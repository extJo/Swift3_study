//상속
print("=============================")
print("상속")

import Cocoa

class Person {
    var name: String
    var age: Int
    var portrait: NSData?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Hello, World! I'm \(name)")
    }
}

class SuperHero: Person {
    var secretary: String?
    
    init(heroName: String, secretaryName: String? = nil) {
        secretary = secretaryName
        super.init(name: heroName, age: -1)
    }
    
    func callSecretary() {
        if let name = secretary {
            print("Hey, \(name)!")
        } else {
            print("\(name) is working alone.")
        }
    }
    
    func attack(weapon: String, target: String?) -> Bool {
        if let target = target {
            callSecretary()
            print("Attack \(target) with \(weapon)!!!")
            return true
        }
        
        return false
    }
}

let hero = SuperHero(heroName:"hero")
hero.callSecretary()
