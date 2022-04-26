import UIKit

var myEmptyArray = [Int]()
var myArray = [5,8,1,0,3,9,7,2,4,6]


let myDictionary = [ 5:"Cinco", 8:"Ocho",1:"Uno",0:"Cero",3:"Tres",9:"Nueve",
                     7:"Siete",2:"Dos",4:"Cuatro",6:"Seis"]


let mySet:Set = [5,8,1,0,3,9,7,2,4,6]


//Count

print(myArray.count)
print(myDictionary.count)
print(mySet.count)

//isEmpty

print(myEmptyArray.isEmpty)
print(myArray.isEmpty)
print(myDictionary.isEmpty)
print(mySet.isEmpty)

//reverse
print(myArray.reversed() as [Int])
print(myDictionary.reversed())
print(mySet.reversed())


//first last
print(myArray.last!)
print(myDictionary.first)
print(mySet.first)
