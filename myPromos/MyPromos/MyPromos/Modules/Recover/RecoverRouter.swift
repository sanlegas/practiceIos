//
//  RecoverRouter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation
import UIKit

class RecoverRouter: PresenterToRouterRecoverProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = RecoverViewController()
        
        let presenter: ViewToPresenterRecoverProtocol & InteractorToPresenterRecoverProtocol = RecoverPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RecoverRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RecoverInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
