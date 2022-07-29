//
//  RecoverViewController.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import UIKit

class RecoverViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterRecoverProtocol?
    
}

extension RecoverViewController: PresenterToViewRecoverProtocol{
    // TODO: Implement View Output Methods
}
