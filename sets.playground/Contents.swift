import UIKit



var mySet = Set<String>()
let mySet2: Set<String> = ["Isaac","David","Santiago"]
let mySet3: Set = ["Isaac","Santiago"]

mySet.insert("Isaac")
mySet.insert("David")
mySet.insert("Santiago")
print(mySet)

if mySet.contains("Isaac"){
    print("Existe")
}else{
    print("No existe")
}

mySet.remove("David")
print(mySet)

if let iSantiago = mySet.firstIndex(of:"Santiago"){
    mySet.remove(at:iSantiago)
}
print(mySet)


mySet.insert("Sanlegas")
mySet.insert("Bienvenidos al curso swift")

for myElement in mySet{
    print(myElement)
}

//Operaciones en conjunto


let myIntSet:Set = [1,2,3,4,5]
let myIntSet2:Set = [0,2,3,6,7]

//Intersección
print( myIntSet.intersection(myIntSet2))

//Diferencia simetrica

print (myIntSet.symmetricDifference(myIntSet2))

//Union

print (myIntSet.union(myIntSet2))

print(myIntSet.subtracting(myIntSet2))
print(myIntSet2.subtracting(myIntSet))




