//
//  RegisterContract.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewRegisterProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterRegisterProtocol {
    
    var view: PresenterToViewRegisterProtocol? { get set }
    var interactor: PresenterToInteractorRegisterProtocol? { get set }
    var router: PresenterToRouterRegisterProtocol? { get set }
    
    func redirectToMain()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorRegisterProtocol {
    
    var presenter: InteractorToPresenterRegisterProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterRegisterProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterRegisterProtocol {
    func redirectToMain(on view: PresenterToViewRegisterProtocol)
}
