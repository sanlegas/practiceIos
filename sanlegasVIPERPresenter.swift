//
//  sanlegasVIPERPresenter.swift
//  
//
//  Created by ISAAC DAVID SANTIAGO on 16/06/22.
//  
//

import Foundation

class sanlegasVIPERPresenter: ViewToPresentersanlegasVIPERProtocol {

    // MARK: Properties
    var view: PresenterToViewsanlegasVIPERProtocol?
    var interactor: PresenterToInteractorsanlegasVIPERProtocol?
    var router: PresenterToRoutersanlegasVIPERProtocol?
}

extension sanlegasVIPERPresenter: InteractorToPresentersanlegasVIPERProtocol {
    
}
