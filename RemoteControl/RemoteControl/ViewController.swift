//
//  ViewController.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 16/06/22.
//

import UIKit
import Starscream
import FirebaseAuth

class ViewController: UIViewController {
    var isConnected : Bool = false
    var auth = AuthFireBase()
    
    let email = "isaacsanlegas@gmail.com"
    let password = "1234556553"

    func authtn(){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          print(" usuario creado")
        }
    }
    
    @IBAction func createUserAction(_ sender: Any) {
        print("Creando usuario")
        authtn()
    }
    

}

