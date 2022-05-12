//
//  ViewController.swift
//  Navegacion
//
//  Created by ISAAC DAVID SANTIAGO on 09/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func botonNegro(_ sender: Any) {
        performSegue(withIdentifier: "VCNegro", sender: self)
        
    }
    
    
    @IBAction func botonRosa(_ sender: Any) {
        performSegue(withIdentifier: "VCRosa", sender: self)
    }
    
    @IBAction func botonAzul(_ sender: Any) {
        performSegue(withIdentifier: "VCAzul", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "VCNegro"{
            if let destino = segue.destination as? ViewControllerNegro{
                destino.titulo = "negro"
            }
        }
        
        if segue.identifier == "VCRosa"{
            if let destino = segue.destination as? ViewControllerRosa{
                destino.titulo = "rosa"
            }
        }
        
        if segue.identifier == "VCAzul"{
            if let destino = segue.destination as? ViewControllerAzul{
                destino.titulo = "azul"
            }
        }
    }
    
}

