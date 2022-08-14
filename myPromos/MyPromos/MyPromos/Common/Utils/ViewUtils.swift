//
//  viewUtils.swift
//  Contranalisis
//
//  Created by ISAAC DAVID SANTIAGO on 11/08/22.
//

import Foundation
import UIKit

class ViewUtils{
    static func showMessageError(title:String, body: String, viewControllerToPresent: UIViewController){
        let uialert = UIAlertController(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
            uialert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            viewControllerToPresent.present(uialert, animated: true, completion: nil)
    }
}
