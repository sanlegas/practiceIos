import Foundation

var count = 0;

for numero in 1...4{
    count += 1
    print(numero)
}

var paises = ["MX","EUA","JP"]

for pais in paises{
    print(pais)
}

//for con diccionarios o duplas
var paisesDiccionario = ["MX":"México","EUA":"Estados Unidos","JP":"Japon"]


for (pais,desc) in paisesDiccionario{
    print("\(pais) --- \(desc)")
}

//ciclo while
var countWhile = 0

while countWhile < 10{
    print("Contando del 0 al 9 \(countWhile)")
    countWhile+=1
}
