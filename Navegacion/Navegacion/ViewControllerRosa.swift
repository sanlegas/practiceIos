//
//  ViewControllerRosa.swift
//  Navegacion
//
//  Created by ISAAC DAVID SANTIAGO on 10/05/22.
//

import UIKit

class ViewControllerRosa: UIViewController {
    var titulo:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let tituloFinal = titulo{
            self.title = tituloFinal
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
