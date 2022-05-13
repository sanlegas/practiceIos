//
//  ViewControllerDynamic.swift
//  DynamicNavegation
//
//  Created by ISAAC DAVID SANTIAGO on 12/05/22.
//

import UIKit

class ViewControllerDynamic: UIViewController {

    var color:String?
    var colores:[String:Any] = ["negro": UIColor.black, "rosa": UIColor.systemPink, "azul": UIColor.blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let colorUi = colores[color!] {
            print("el color leido es " + color!)
            self.view.backgroundColor = colorUi as? UIColor
        }
        
    }


}
