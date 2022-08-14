//
//  LoginRouter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterLoginProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = LoginViewController(nibName:
                                                    "LoginView", bundle: nil)
        
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LoginInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    func redirectToRegister(on view: PresenterToViewLoginProtocol){
        let registerModule = RegisterRouter.createModule()
        let vc = view as! LoginViewController
        //vc.navigationController?.navigationController(registerModule, animated: true)
        //vc.navigationController?.setViewControllers([registerModule], animated: true)
        vc.navigationController?.show(registerModule, sender: vc)
    }
    
    func redirectToRecover(on view: PresenterToViewLoginProtocol){
        let recoverModule = RecoverRouter.createModule()
        let vc = view as! LoginViewController
        vc.navigationController?.pushViewController(recoverModule, animated: true)
    }
    
    func redirectToMain(on view: PresenterToViewLoginProtocol){
        let mainModule = MainRouter.createModule()
        let vc = view as! LoginViewController
        vc.navigationController?.setViewControllers([mainModule], animated: true)
    }
    
}
