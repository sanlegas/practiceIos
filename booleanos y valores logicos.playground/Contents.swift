import UIKit


var mayorEdad = false;

if mayorEdad {
    print("Puedes entrar porque eres mayor de edad")
}else{
    print("No puedes entrar porque eres menor de edad")
}


//case control con cadenas

var country = "MX"

switch country{
case "ES":
    print("ESpaña")
case "MX":
    print("México")
default:
    print("No reconocido")
}


//switch con enteros y rangos

var edad:Int = 100
var resultado:String = "";
switch edad{
case 0,1,2:
    resultado = "Eres un bebé"
case 3...10:
    resultado = "Eres un niño"
case 11..<16:
    resultado = "Eres un adolescente"
case 16..<70:
    resultado = "Eres un adulto"
case 70..<100:
    resultado = "Eres anciano"
default:
    resultado = "😟"
}
    
print(resultado)

//switch con enums

enum PersonalData{
    case name
    case surname
    case address
    case phone
}

let userData:PersonalData = .phone

switch userData{
case .name:
    print("Estamos editando el nombre")
case .surname:
    print("Estamos editando el apellido")
case .address:
    print("Estamos editando la direccion")

case .phone:
    print("Estamos editando el número de telefono")

}
