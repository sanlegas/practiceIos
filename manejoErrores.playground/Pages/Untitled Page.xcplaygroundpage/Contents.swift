import UIKit

func sum(firstNumber: Int?, secondNumber: Int?) throws -> Int{
    if firstNumber == nil{
        throw SumError.firstNumberNil
    }else if secondNumber == nil{
        throw SumError.secondNumberNil
    }else if firstNumber! < 0 || secondNumber! < 0{
        throw SumError.numberNegative(firstNumber: firstNumber!, secondNumber: secondNumber!)
    }
    
    return firstNumber! + secondNumber!
}


enum SumError: Error{
    case firstNumberNil
    case secondNumberNil
    case numberNegative(firstNumber: Int, secondNumber: Int)
}

//Propagación de errores
do{
    print(try sum(firstNumber: -50, secondNumber: 50))
} catch SumError.firstNumberNil{
    
} catch SumError.secondNumberNil{
    
}catch SumError.numberNegative(let firstNumber, let secondNumber){
    print("Hay algún número negativo. firstNumber\(firstNumber) secondNumber\(secondNumber)")
}
