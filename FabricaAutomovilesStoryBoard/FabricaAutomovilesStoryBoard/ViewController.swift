//
//  ViewController.swift
//  FabricaAutomovilesStoryBoard
//
//  Created by ISAAC DAVID SANTIAGO on 15/05/22.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func crearAutomovilSencillo(_ sender: Any) {
        performSegue(withIdentifier:"segueCar", sender: 1)
    }
    
    @IBAction func crearAutomovilMazda(_ sender: Any) {
        performSegue(withIdentifier:"segueCar", sender: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerCoche = segue.destination as? ViewControllerCoche {
            viewControllerCoche.tipoAutomovil = sender as? Int
        }
    }
}

