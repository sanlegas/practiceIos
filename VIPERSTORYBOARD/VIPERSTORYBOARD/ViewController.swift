//
//  ViewController.swift
//  VIPERSTORYBOARD
//
//  Created by ISAAC DAVID SANTIAGO on 14/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myButtonAction(_ sender: Any) {
        print("Action")
        let vc = sanlegasRouter.createModule()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

