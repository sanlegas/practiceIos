import UIKit


//arreglos
var arregloNumeros = [1,2,3]
let arregloNumerosInmutable = [1,2,3]


print(arregloNumeros)

print(arregloNumeros[2])

arregloNumeros.append(5)

print(arregloNumeros)

arregloNumeros.insert(4, at: 3)

print(arregloNumeros)

arregloNumeros.removeLast();
print(arregloNumeros)

arregloNumeros.removeAll();


var arregloVacioEntero:[Int] = []



//Diccionarios

let myClassicDictionary = Dictionary<Int, String>()
var myModernDictionary = [Int:String]()


//Añadir datos

myModernDictionary = [001:"Isaac",002:"David"]

//Añadir un solo dato

myModernDictionary[003] = "Santiago"

print(myModernDictionary)

myModernDictionary[004] = "Legaspi"

print(myModernDictionary)

print(myModernDictionary[002])

myModernDictionary[002] = nil;

print(myModernDictionary)

print(myModernDictionary[002])



//Duplas
    //Nombre, apellido, edad, estatura
var persona = ("Isaac","Santiago",28,1.83)

persona.0

var (nombre, apellido, edad, estatura) = persona


apellido


var personaNamedTuples = (nombre:"Isaac", apellido: "Santiago",edad:28, estatura: 1.83)


personaNamedTuples.nombre


//Enumeración
enum PersonalData{
    case name
    case surname
    case address
    case phone
    
}


var currentData:PersonalData = .name
var input = "Isaac"

currentData = .phone
input = "1111"

//Enumeraciones con valores asociados

enum ComplexPersonalData{
    case name(String)
    case surname(String)
    case address(String, Int)
    case phone(Int)
}

var complexCurrentData : ComplexPersonalData = .name("ISaac")

complexCurrentData = .address("Isaac",5)

//Enumeraciones con el mismo tipo de valor

enum RawPersonalData: String{
    case name = "Nombre"
    case surname = "Apellidos"
    case address = "Direccion"
    case phone = "Número de teléfono"
}

RawPersonalData.name.rawValue



