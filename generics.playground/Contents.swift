import UIKit



func swapTwoInts(a: inout Int, b: inout Int){
    let tempA = a
    a = b
    b = tempA
}


var myFirstInt = 5
var mySecondInt = 10

print("El primer valor antes del intercambio es \(myFirstInt) y el segundo es \(mySecondInt)")
swapTwoInts(a: &myFirstInt, b: &mySecondInt)

print("El primer valor despues del intercambio es \(myFirstInt) y el segundo es \(mySecondInt)")


//Con genéricos

func swapTwoGenerics<T>(a: inout T, b:inout T){
    let tempA = a
    a = b
    b = tempA
}

var myFirstGeneric = "Isaac"
var mySecondGeneric = "Santiago"

print("El primer valor generic antes del intercambio es \(myFirstGeneric) y el segundo es \(mySecondGeneric)")

swapTwoGenerics(a: &myFirstGeneric, b: &mySecondGeneric)

print("El primer valor generic despues del intercambio es \(myFirstGeneric) y el segundo es \(mySecondGeneric)")



