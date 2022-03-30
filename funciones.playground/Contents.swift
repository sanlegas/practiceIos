import UIKit

func helloWorld(){
    print("Hello world")
}

func withOneParam(x:Int){8
    let numeroCuadrado:Int = Int(x) * x
    print(numeroCuadrado)
}

func cuboDe(numero:Int) -> Int{
    let numeroCubo = numero * numero * numero
    return numeroCubo
}

helloWorld()

withOneParam(x: 5)


let resultado = cuboDe(numero:10)
print("El resultado es \(resultado)")

//Si queremos llamar a la funcion pero no queremos almacenar el resultado
_ = cuboDe(numero:10)


func saludarAlumno(nombre:String, mensaje:String){
    print("Hola \(nombre) \(mensaje)")
}

func saludarAlumnoConDiferentesParametros(nombre:String){
    print("Este metodo solo muestra tu nombre \(nombre)")
}

func saludarAlumno(nombre:String, edad:Int){
    print("\(nombre) tiene \(edad) de edad")
}

func saludarAlumnoDefault(nombre:String, mensaje:String = "Te damos la bienvenida al curso de iOS con Swift"){
    print("Hola \(nombre) \(mensaje)")
}

func listaNombres() -> [String]{
    let arregloNombres = ["Isaac","David","Santiago"]
    return arregloNombres
}

saludarAlumno(nombre:"Isaac", mensaje: "Te damos la bienvenida")
saludarAlumnoConDiferentesParametros(nombre: "David")
saludarAlumno(nombre: "Isaac", edad:20)
saludarAlumnoDefault(nombre: "Isaac")

var nombres = listaNombres()


//Nombre de parametros internos y externos

func calificacionPromedio(materiaUno:Double,materiaDos:Double,materiaTres:Double) -> Double{
    return (materiaUno + materiaDos + materiaTres) / 3
}

let calificacionPromedioMaterias = calificacionPromedio(materiaUno: 81, materiaDos: 45, materiaTres: 60)
print (calificacionPromedioMaterias)



/*
 
 {
    (parametros) -> tipo-valor-retorno in
    codigo
    
 }
 
 */

let miPrimerClosure = {
    (materiaUno:Double, materiaDos:Double, materiaTres:Double) -> Double in
    return (materiaUno + materiaDos + materiaTres) / 3
}

miPrimerClosure(100,22,88)

