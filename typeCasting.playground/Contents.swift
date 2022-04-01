import UIKit



let myString = "Isaac"
let myInt = 32

class MyClass{
    var name: String!
    var age:Int!
}

let myClass = MyClass()
myClass.name = "Isaac Santiago"
myClass.age = myInt

let myArray:[Any] = [myString, myInt, myClass]

for item in myArray{
    if item is String{
        //Downcasting
        let myItemString = item as! String
        print("Item es de tipo Int y tiene el valor \(myItemString)")

    }else if item is Int{
        let myItemInt = item as! Int
        print("Item es de tipo Int y tiene el valor \(myItemInt)")
    }else if item is MyClass{
        let myItemClass = item as! MyClass
        print("Item es de tipo MyClass y tiene el valor \(myItemClass.name!)")
    }
}


for item in myArray{
    if let myItemString = item as? String{
        print("Item es de tipo Int y tiene el valor \(myItemString)")
        
    }else if let myItemInt = item as? Int{
        print("Item es de tipo Int y tiene el valor \(myItemInt)")
    }else if let myItemClass = item as? MyClass{
        print("Item es de tipo MyClass y tiene el valor \(myItemClass.name!)")
    }
}
