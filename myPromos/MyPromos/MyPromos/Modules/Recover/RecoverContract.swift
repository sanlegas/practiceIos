//
//  RecoverContract.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewRecoverProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterRecoverProtocol {
    
    var view: PresenterToViewRecoverProtocol? { get set }
    var interactor: PresenterToInteractorRecoverProtocol? { get set }
    var router: PresenterToRouterRecoverProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorRecoverProtocol {
    
    var presenter: InteractorToPresenterRecoverProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterRecoverProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterRecoverProtocol {
    
}
