//
//  LoginPresenter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {

    // MARK: Properties
    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    func redirectToRegister() {
        router?.redirectToRegister(on: view!)
    }
    
    func redirectToRecover() {
        router?.redirectToRecover(on: view!)
    }
    
    func redirectToMain() {
        router?.redirectToMain(on: view!)
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    
}
