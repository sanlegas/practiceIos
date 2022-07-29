//
//  RecoverPresenter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import Foundation

class RecoverPresenter: ViewToPresenterRecoverProtocol {

    // MARK: Properties
    var view: PresenterToViewRecoverProtocol?
    var interactor: PresenterToInteractorRecoverProtocol?
    var router: PresenterToRouterRecoverProtocol?
}

extension RecoverPresenter: InteractorToPresenterRecoverProtocol {
    
}
