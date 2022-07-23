//
//  LoginViewController.swift
//  RemoteControlServer
//
//  Created by ISAAC DAVID SANTIAGO on 17/07/22.
//

import Foundation
import Firebase
import AppKit

class LoginViewController: NSViewController{

    @IBOutlet weak var usuarioTxt: NSTextField!
    
    @IBOutlet weak var passwordTxt: NSSecureTextField!
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loginViewController")
    }
    
    func redirecMainWindow(){
        performSegue(withIdentifier: "showMainWindow",sender:self)
        self.view.window?.close()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: usuarioTxt.stringValue, password: passwordTxt.stringValue) { [weak self] authResult, error in
            if let error = error {
                print("error al loguearse con las credenciales proporcionadas")
                return
            }else{
                self?.redirecMainWindow()
            }
           
        }
    }
}
