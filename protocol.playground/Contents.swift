import UIKit

protocol PersonProtocol{
    var name:String {get set}
    var age:Int {get set}
    func fullName() -> String
}


struct Programmer:PersonProtocol{
    var name: String
    var age: Int
    var languaje: String
    
    func fullName() -> String {
        return "soy un programador y me especializo en el lenguaje \(languaje)"
    }
}


struct Teacher:PersonProtocol{
    var name:String
    var age: Int
    var subject: String
    
    func fullName() -> String {
        "soy un profesor y enseño la asignatura de \(subject)"
    }
}


let myProgrammer = Programmer(name:"Isaac",age:28,languaje: "Swift")

let myTeacher = Teacher(name:"David",age: 30,subject: "Matematicas")

print(myProgrammer.fullName())
print(myTeacher.fullName())


//Protocolo delegado

class FirstClass : SecondClassProtocol{
    func callSecond(){
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
    
    func call(){
        print("Estoy de vuelta")
    }
}

protocol SecondClassProtocol{
    func call()
}

class SecondClass{
    var delegate : SecondClassProtocol?

    func callFirst(){
        sleep (5)
        delegate?.call()
        
    }
    
}

let firstClass = FirstClass()
firstClass.callSecond()

