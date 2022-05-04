//
//  ViewController.swift
//  AdaptiveLayout
//
//  Created by ISAAC DAVID SANTIAGO on 04/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.titleLabel?.adjustsFontSizeToFitWidth = true

        button.titleLabel?.minimumScaleFactor = 0.5
    }


}

