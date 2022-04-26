//
//  ViewController.swift
//  EjemploProyecto
//
//  Created by ISAAC DAVID SANTIAGO on 19/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = "Cambiado desde viewDidLoad"
    }

    @IBAction func cambiarTexto(_ sender: Any) {
        etiqueta.text = "Texto cambiado desde el botón"
    }
    

}

