//
//  RegisterViewController.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import UIKit
import WebKit

class RegisterViewController: UIViewController                           {
    var webView: WKWebView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMessages: UITextView!
    @IBOutlet weak var paisesPicker: UIPickerView!

    @IBOutlet weak var generoPicker: UIPickerView!
    
    @IBOutlet weak var messages: UITextView!
    
    var submited : Bool!
    
    var pickerPaisesDataSource = ["México", "Estados Unidos", "Argentina", "Perú", "Venezuela"];
    
    var pickerGeneroDataSource = ["Masculino", "Femenino"];
    
    func initialice(){
        webView = WKWebView()
        webView!.navigationDelegate = self
        webView!.uiDelegate = self
        submited = false
        
        paisesPicker.dataSource = self
        paisesPicker.delegate   = self
        generoPicker.dataSource  = self
        generoPicker.delegate = self
        
    }
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialice()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterRegisterProtocol?
    
    
    @IBAction func creaCuenta(_ sender: Any) {
        let url = URL(string: "https://leonardo.fm/perfil/registro")!
        webView.load(URLRequest(url: url))
    }
    
}

extension RegisterViewController: PresenterToViewRegisterProtocol{
    // TODO: Implement View Output Methods
}

extension RegisterViewController: WKUIDelegate{
    
    
}

extension RegisterViewController:       UIPickerViewDelegate,
                                        UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == paisesPicker{
            return pickerPaisesDataSource.count
        }
        return pickerGeneroDataSource.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == paisesPicker{
            return pickerPaisesDataSource[row] as String
        }
        return pickerGeneroDataSource[row] as String
    }
    
}

extension RegisterViewController: WKNavigationDelegate{
    
    func getJavaScript(scripts: String ...) -> String{
        var scriptReturn = "setTimeout(function() {"
        scriptReturn.append(scripts.joined(separator: ";"))
        scriptReturn.append("}, 1);")
        return scripts.joined(separator: ";")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url  = webView.url
        print(url)
        self.takeScreenShot()
        if !submited {
            print("finished", url)
            let nombreField = "document.querySelector('#register_form_name').value = 'juanito'"
            let apellidosField  = "document.querySelector('#register_form_lastname').value = 'perez'"
            let correoField = "document.querySelector('#register_form_email').value = 'juanitoPrueba5@superrito.com'"
            let telefono = "document.querySelector('#register_form_phone').value = '55726499'"
            let password = "document.querySelector('#register_form_password').value = '1q2w3e4r'"
            let fechaNacimiento = "document.querySelector('#date-mask').value = '10.10.1993'"
            let pais = "document.querySelector('#register_form_country').value = 'México'"
            let genero = "document.querySelector('#register_form > div:nth-child(10) > div > label > input[type=radio]:nth-child(1)').setAttribute('checked',true)"
            let submit = "document.querySelector('#register_form > div.row > div:nth-child(3) > button').click()"
            
            
            self.submited = true
            let scripts = getJavaScript(scripts:nombreField,
                                        apellidosField,
                                        correoField,
                                        telefono,
                                        password,
                                        fechaNacimiento,
                                        pais,
                                        genero,
                                        submit)
            webView.evaluateJavaScript(scripts) {
                                        (result, error) in
                if error == nil {
                    let source = webView
                    self.takeScreenShot()
                }
            }
        }else {
            let urlAbsolute = webView.url?.absoluteString
            let ocurrence = urlAbsolute?.contains("https://leonardo.fm/perfil/registro") as? Bool
            print(ocurrence)
            if  let oc = ocurrence, oc {
                let scriptMessageError = "document.querySelector('#register_form > div.alert.alert-danger.nobottommargin').innerText.trim()"
                
                webView.evaluateJavaScript(scriptMessageError) {
                                            (result, error) in
                    if let result = result as? String {
                        print(result)
                        self.messages.text = result
                    }
                }
            }
            
        }
    }
    
    func takeScreenShot(){
        let config = WKSnapshotConfiguration()

        config.rect = CGRect(x: 0, y: 0, width: 1150, height: 1150)
        webView!.takeSnapshot(with: config) { image, error in
            if let image = image {
                print(image.size)
            }
        }
    }
    
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
}
