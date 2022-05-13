//
//  ViewControllerBlue.swift
//  DynamicNavegation
//
//  Created by ISAAC DAVID SANTIAGO on 12/05/22.
//

import UIKit

class ViewControllerBlue: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NegroAction(_ sender: Any){
        performSegue(withIdentifier: "DynamicSegue", sender: "negro")
    }

    @IBAction func RosaAction(_ sender: Any) {
        performSegue(withIdentifier: "DynamicSegue", sender: "rosa")
    }
    
    @IBAction func AzulAction(_ sender: Any) {
        performSegue(withIdentifier: "DynamicSegue", sender: "azul")
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        if let destino = segue.destination as? ViewControllerDynamic{
            destino.color = sender as? String
        }
    }
}
