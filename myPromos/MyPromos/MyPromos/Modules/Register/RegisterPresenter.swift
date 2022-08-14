//
//  RegisterPresenter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation

class RegisterPresenter: ViewToPresenterRegisterProtocol {

    // MARK: Properties
    var view: PresenterToViewRegisterProtocol?
    var interactor: PresenterToInteractorRegisterProtocol?
    var router: PresenterToRouterRegisterProtocol?
    
    func redirectToMain() {
        router?.redirectToMain(on: view!)
    }
}

extension RegisterPresenter: InteractorToPresenterRegisterProtocol {
    
}
