//
//  sanlegasVIPERContract.swift
//  
//
//  Created by ISAAC DAVID SANTIAGO on 16/06/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewsanlegasVIPERProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresentersanlegasVIPERProtocol {
    
    var view: PresenterToViewsanlegasVIPERProtocol? { get set }
    var interactor: PresenterToInteractorsanlegasVIPERProtocol? { get set }
    var router: PresenterToRoutersanlegasVIPERProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorsanlegasVIPERProtocol {
    
    var presenter: InteractorToPresentersanlegasVIPERProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresentersanlegasVIPERProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRoutersanlegasVIPERProtocol {
    
}
