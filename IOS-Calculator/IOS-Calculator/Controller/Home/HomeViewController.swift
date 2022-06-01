//
//  HomeViewController.swift
//  IOS-Calculator
//
//  Created by ISAAC DAVID SANTIAGO on 21/05/22.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var number0: UIButton!
    
    @IBOutlet weak var number1: UIButton!
    
    @IBOutlet weak var number2: UIButton!
    
    @IBOutlet weak var number3: UIButton!
    
    @IBOutlet weak var number4: UIButton!
    
    @IBOutlet weak var number5: UIButton!
    
    @IBOutlet weak var number6: UIButton!
    
    @IBOutlet weak var number7: UIButton!
    
    @IBOutlet weak var number8: UIButton!
    
    @IBOutlet weak var number9: UIButton!
    
    @IBOutlet weak var numberDecimal: UIButton!
        
    @IBOutlet weak var operatorPlusMinus: UIButton!
    
    @IBOutlet weak var operatorPercent: UIButton!
    
    @IBOutlet weak var operatorResult: UIButton!
    
    @IBOutlet weak var operatorAddition: UIButton!
    
    @IBOutlet weak var operatorSubstraction: UIButton!
    
    @IBOutlet weak var operatorMultiplication: UIButton!
    
    @IBOutlet weak var operatorDivision: UIButton!
    
    @IBOutlet weak var operatorAC: UIButton!
    
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation : OperationType = .none
    
    private let kDecimalSeparator = Locale.current.decimalSeparator;
    private let kMaxLength = 9

    
    
    private enum OperationType{
        case none, addiction, substraction, multiplication, division, percent
    }
    
    //Formateo de valores auxiliaries
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumSignificantDigits = 8
        return formatter
    }()
    
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        result()
    }
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        
        
        sender.shine()
    }
    

    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        print("operation \(operation)")
        if operation != .none {
            temp = temp * (-1)
            resultLabel.text = printFormatter.string(from: NSNumber(value:temp))
        }else{
            total = total * (-1)
            resultLabel.text = printFormatter.string(from: NSNumber(value:total))
        }

        sender.shine()
    }
    
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent{
            result()
        }
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = false
        operation = .none
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .addiction
        sender.selectOperation(true)
        sender.shine()
    }
    
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .substraction
        sender.selectOperation(true)
        sender.shine()
    }
    
    
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .multiplication
        sender.selectOperation(true)
        sender.shine()
    }
    
    
    @IBAction func operatorDisivisonAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .division
        sender.selectOperation(true)
        sender.shine()
    }
    
    
    @IBAction func operatorDecimalAction(_ sender: UIButton) {
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength{
            return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator!
        decimal = true
        selectVisualOperation()
        sender.shine()
    }
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        operatorAC.setTitle("C", for: .normal)
        //let numberTemp = operation != .none ?
        var currentMap = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if operation != .none && currentMap.count >= kMaxLength {
            return
        }
        
        
        //Hemos seleccionado una operacion
        if operation != .none {
            if total == 0 {
                total = temp
                resultLabel.text = ""
                currentMap = ""
            }else {
                if temp != Double(0) {
                    currentMap = auxFormatter.string(from: NSNumber(value: temp))!
                }

            }
        }else{
            currentMap = auxFormatter.string(from: NSNumber(value: temp))!

        }
        
        if decimal{
            currentMap = "\(currentMap)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentMap + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    
    private func clear(){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    private func result(){
        switch operation {
        case .none:
            break
        case .addiction:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        operating = false
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        }else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operation = .none
        temp = total
        total = 0
        selectVisualOperation()
        print("Total \(total)")
    }
    
    private func selectVisualOperation(){
        if !operating {
            operatorAddition.selectOperation(false)
            operatorSubstraction.selectOperation(false)
            operatorMultiplication.selectOperation(false)
            operatorDivision.selectOperation(false)
        } else {
            switch operation {
            case .none, .percent:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .addiction:
                operatorAddition.selectOperation(true)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .substraction:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(true)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .multiplication:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(true)
                operatorDivision.selectOperation(false)
                break
            case .division:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(true)
                break

            }
        }
    }
}
