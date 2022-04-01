import UIKit



class Student{
    var name:String?
    var book: Book?
}

class Book{
    var pages: Int?
}

let myStudent = Student()


print(myStudent.name)
print(myStudent.book?.pages)

let myBook = Book()
myStudent.name = "Isaac"

myBook.pages = 50

myStudent.book = myBook


//Enlace opcional encadenado
if let pages = myStudent.book?.pages, let name = myStudent.name{
    print("El libro de \(name) tiene \(pages) pages")
}else{
    print("El libro no tiene paginas")
}

var myOptionalString:String?


func myFunction() {
    guard let myString = myOptionalString else{
        print("myString es nulo")
        return
    }
    
    print("El valor de myString es \(myString)")
}

myOptionalString = "Ahora si tiene un valor"
myFunction()
