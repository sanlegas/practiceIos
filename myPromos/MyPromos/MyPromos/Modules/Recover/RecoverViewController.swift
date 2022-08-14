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
    
    
    func recoverCuenta(){
        let scriptEmail = "document.querySelector('#emailrest')"
        let scriptButton = "document.querySelector('#forgot > div > div > div.modal-body > table > tbody > tr > td:nth-child(3) > button')"
        
    }
}

extension RecoverViewController: PresenterToViewRecoverProtocol{
    // TODO: Implement View Output Methods
}
