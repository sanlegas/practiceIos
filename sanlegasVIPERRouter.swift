//
//  sanlegasVIPERRouter.swift
//  
//
//  Created by ISAAC DAVID SANTIAGO on 16/06/22.
//  
//

import Foundation
import UIKit

class sanlegasVIPERRouter: PresenterToRoutersanlegasVIPERProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = sanlegasVIPERViewController()
        
        let presenter: ViewToPresentersanlegasVIPERProtocol & InteractorToPresentersanlegasVIPERProtocol = sanlegasVIPERPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = sanlegasVIPERRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = sanlegasVIPERInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
