//
//  Routing.swift
//  VIPER
//
//  Created by ISAAC DAVID SANTIAGO on 14/06/22.
//

import Foundation
import UIKit

class Routing {
    
    let vc:TableViewController = TableViewController()
    let presenter = Presenter()
    let interactor = Interactor()
    var navigationController: UINavigationController?
    
    init() {
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        navigationController = UINavigationController(rootViewController: vc)
    }
}
