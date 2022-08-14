//
//  MainPresenter.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 09/08/22.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    

}

extension MainPresenter: InteractorToPresenterMainProtocol {
    
}
