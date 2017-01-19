//옵셔널 체이닝
print("=============================")
print("옵셔널 체이닝")

class Person {
    var contact: Contact?
    /*
     init() {
     contact = Contact()
     }
     */
}

class Contact {
    var address: String?
    var tel: String?
    var email: String? = "N/A"
}

//값이 nil이라 에러 발생
let p = Person()
var email = p.contact?.email
//var email = p.contact!.email!
print(email as Any)

//if를 통해 예외처리
if let contact = p.contact{
    if let email = contact.email {
        print(email)
    }
    else {
        print("nil email")
    }
    
}
else {
    print("nil email")
}

// 옵셔널 체이닝
let p2 = Person()
var email2 = p.contact?.email
print(email2 as Any)


// 옵셔널 체이닝 값쓰기
print("=============================")
print("옵셔널 체이닝 값쓰기")
p.contact?.email? = "test@test.com"
let email3 = p.contact?.email
print(email3 as Any)
