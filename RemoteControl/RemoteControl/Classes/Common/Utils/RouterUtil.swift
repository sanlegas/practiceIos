//
//  RouterUtil.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 27/06/22.
//

import FirebaseAuth
import Foundation
import UIKit

class RouterUtil{
    weak var viewController: UIViewController?
    
    static func getMainModule() -> UIViewController{
        if Auth.auth().currentUser?.uid != nil {
            print("usuario logueado")
            return DevicesRouter.createModule()
        }else{
            print("usuario NO logueado")
            return LoginRouter.createModule()
        }
    }
    
}
