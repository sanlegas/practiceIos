//
//  ViewController.swift
//  userDefaults
//
//  Created by ISAAC DAVID SANTIAGO on 27/05/22.
//

import UIKit

class ViewController: UIViewController {

    private let myKey = "54NL3645"
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: myKey){
            print("Valor leido: \(value)")
            showAlert(message: value)
        }else{
            showAlert(message: "No hay un valor para esta clave")
        }
    }
    
    
    
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("SUSCRIBETE",forKey: myKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: myKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }
    
    
    private func showAlert(message:String){
        let alert = UIAlertController(title:"My UserDefaults", message: message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
        present(alert, animated: true,completion: nil)
    }
    
}
