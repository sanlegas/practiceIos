//
//  RegisterRouter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation
import UIKit

class RegisterRouter: PresenterToRouterRegisterProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = RegisterViewController()
        
        let presenter: ViewToPresenterRegisterProtocol & InteractorToPresenterRegisterProtocol = RegisterPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RegisterRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RegisterInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func redirectToMain(on view: PresenterToViewRegisterProtocol){
        let mainModule = MainRouter.createModule()
        let vc = view as! RegisterViewController
        vc.navigationController?.setViewControllers([mainModule], animated: true)
    }
    
}
