//
//  ViewController.swift
//  LyfeCicle
//
//  Created by ISAAC DAVID SANTIAGO on 16/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Estamos en la funcion ViewController1 \(#function)")
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Estamos en la funcion ViewController1 \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Estamos en la funcion ViewController1 \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Estamos en la funcion ViewController1 \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Estamos en la funcion ViewController1 \(#function)")
    }
    
    
}

