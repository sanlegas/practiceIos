//
//  UIButtonExtension.swift
//  IOS-Calculator
//
//  Created by ISAAC DAVID SANTIAGO on 22/05/22.
//

import UIKit


private let orange = UIColor(red:254/255, green: 148/255, blue: 0/255, alpha: 1)
private  var selected:Bool = false

extension UIButton{
    
    func round(){
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    func shine(){
        print("Shine")
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate( withDuration: 0.1, animations:  {
                self.alpha = 1
            })
        }
        
    }
    
    //Apareciencia selección botón de operación
    func selectOperation(_ selected: Bool){
        //setTitleColor(selected ? orange : .white, for: .normal)
        tintColor = selected ? orange : .white
        backgroundColor = selected ? .white : orange
        print("\(tag) selected: \(selected)")
    }
}
