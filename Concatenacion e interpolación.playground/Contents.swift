import Foundation


//Concatenación
let myString = "Bienvenidos " + " " + " al curso de Swift"
//myString += "Les está gustando la clase?"  , da error no se puede cambiar una constante


var myStringVar = "Bienvenidos " + " " + " al curso de Swift"
myStringVar += "Les está gustando la clase?"

var name = "Isaac"
var country = "México"

let personalInfo = "Mi nombre es: " + name + " y vivo en " + country

// Interpolación

let personalInfoInterpolacion = "Mi nombre es \(name) y vivo en \(country)"


//Comparacion

let name1 = "Isaac"
let name2 = "David"
let name3 = "Isaac"

name1 == name2

name1 == name3

let myContent = "Mi nombre es Isaac"

myContent.contains(name1)

let emptyString = "";

emptyString.isEmpty


for valor in myContent{
    print(valor)
}
