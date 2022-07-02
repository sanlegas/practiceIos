//
//  sanlegasRouter.swift
//  VIPERSTORYBOARD
//
//  Created ISAAC DAVID SANTIAGO on 14/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class sanlegasRouter: sanlegasWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        //let view = sanlegasViewController(nibName: nil, bundle: nil)
        let view = sanlegasViewController(nibName: "sanlegasViewController", bundle: Bundle(for: sanlegasRouter.self))
        
        let interactor = sanlegasInteractor()
        
        let router = sanlegasRouter()
        let presenter = sanlegasPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
