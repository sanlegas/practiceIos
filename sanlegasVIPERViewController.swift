//
//  sanlegasVIPERViewController.swift
//  
//
//  Created by ISAAC DAVID SANTIAGO on 16/06/22.
//  
//

import UIKit

class sanlegasVIPERViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresentersanlegasVIPERProtocol?
    
}

extension sanlegasVIPERViewController: PresenterToViewsanlegasVIPERProtocol{
    // TODO: Implement View Output Methods
}
