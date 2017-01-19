//3. 서브스크립트 구현
print("=============================")
print("3. 서브스크립트 구현")

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
    
    func attack(weapon: String, target: String?) -> Bool {
        if let target = target {
            callSecretary()
            print("Attack \(target) with \(weapon)!!!")
            return true
        }
        
        return false
    }
}

class Headquarters {
    private var squad: [SuperHero]
    
    init(heroes: [SuperHero]) {
        squad = heroes
    }
    
    subscript(index: Int) -> SuperHero? {
        get {
            if index < squad.count {
                return squad[index]
            }
            
            return nil
        }
        set {
            if let hero = newValue {
                if index < squad.count {
                    squad[index] = hero
                } else {
                    squad.append(hero)
                }
            } else {
                if index < squad.count {
                    #if swift(>=3.0)
                        squad.remove(at: index)
                    #else
                        squad.removeAtIndex(index)
                    #endif
                }
            }
        }
    }
    
    subscript(key: String) -> SuperHero? {
        get {
            for hero in squad {
                if hero.name == key {
                    return hero
                }
            }
            
            return nil
        }
        set {
            #if swift(>=3.0)
                if let index = squad.index(where: { $0.name == key }) {
                    if let hero = newValue {
                        squad[index] = hero
                    } else {
                        squad.remove(at: index)
                    }
                } else {
                    if let hero = newValue {
                        squad.append(hero)
                    }
                }
            #else
                if let index = squad.indexOf({ $0.name == key }) {
                if let hero = newValue {
                squad[index] = hero
                } else {
                squad.removeAtIndex(index)
                }
                } else {
                if let hero = newValue {
                squad.append(hero)
                }
                }
            #endif
        }
    }
    
    func printSquad() {
        var list = [String]()
        for hero in squad {
            list.append(hero.name)
        }
        
        #if swift(>=3.0)
            print(list.joined(separator: ", "))
        #else
            print(list.joinWithSeparator(", "))
        #endif
    }
}

let ironMan = SuperHero(heroName: "Iron Man", secretaryName: "Jarvis")
let thor = SuperHero(heroName: "Thor")
let captainAmerica = SuperHero(heroName: "Captain America")

let shield = Headquarters(heroes: [ironMan, thor])
shield.printSquad()
// Iron Man, Thor
var firstHero = shield[0]
print(firstHero?.name as Any)
// Iron Man
shield[0] = captainAmerica
firstHero = shield[0]
print(firstHero?.name as Any)
// Captain America
var hero = shield["Iron Man"]
print(hero?.name as Any)
// nil
shield["Iron Man"] = ironMan
hero = shield["Iron Man"]
print(hero?.name as Any)
// Iron Man
shield.printSquad()
// Captain America, Thor, Iron Man
shield[0] = nil
shield.printSquad()
// Thor, Iron Man
shield["Thor"] = nil
shield.printSquad()
// Iron Man