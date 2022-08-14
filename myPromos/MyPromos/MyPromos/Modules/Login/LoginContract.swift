//
//  LoginContract.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewLoginProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLoginProtocol {
    
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
    
    func redirectToRegister()
    func redirectToRecover()
    func redirectToMain()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLoginProtocol {
    
    var presenter: InteractorToPresenterLoginProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLoginProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLoginProtocol {
    func redirectToRegister(on view: PresenterToViewLoginProtocol)
    func redirectToRecover(on view: PresenterToViewLoginProtocol)
    func redirectToMain(on view: PresenterToViewLoginProtocol)
}
