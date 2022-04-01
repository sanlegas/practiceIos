import UIKit

//Optional

let myStringNumber = "100"
let myIntNumber = Int(myStringNumber)


let myWrongNumber = "Sanlegas"
let myWrongIntNumber:Int? = Int(myWrongNumber)


var myOptionalString: String?

print(myOptionalString)

myOptionalString = "ahora tiene un valor"

if myOptionalString != nil{
    print("Nuestra variable tiene un valor distinto de nulo")
}else{
    print("Nuestra variable es nula")
}


//Optional binding

var myOptionalStringBinding: String?
//myOptionalStringBinding = "Isaac"

if let myString = myOptionalStringBinding{
   print(myString)
}else{
    print(myOptionalStringBinding)
}

//Desempaquetado forzado

print(myOptionalStringBinding!)
