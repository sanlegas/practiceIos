//
//  MyViewController2ViewController.swift
//  LyfeCicle
//
//  Created by ISAAC DAVID SANTIAGO on 17/05/22.
//

import UIKit

class MyViewController2ViewController: ViewController {
    
    @IBOutlet weak var greenView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Estamos en la funcion ViewController2 \(#function)")
        
        //Modificacion de constraint por codigo
        //heightConstraint.constant = 400
        
        
        //Constraints de tamańo por código
        
        greenView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        greenView.widthAnchor.constraint(equalToConstant:  200).isActive = true
        
        //Constraints de posición programaticamente
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: greenView!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1000, constant: 16))
        
        greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Estamos en la funcion ViewController2 \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Estamos en la funcion ViewController2 \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Estamos en la funcion ViewController2 \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Estamos en la funcion ViewController2 \(#function)")
    }

}
