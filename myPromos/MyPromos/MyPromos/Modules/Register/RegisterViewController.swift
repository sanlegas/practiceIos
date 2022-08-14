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
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var paisesPicker: UIPickerView!
    @IBOutlet weak var generoPicker: UIPickerView!
    @IBOutlet weak var nombresText: UITextField!
    @IBOutlet weak var apellidosText: UITextField!
    @IBOutlet weak var telefonoText: UITextField!
    @IBOutlet weak var nacimientoPicker: UIDatePicker!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var submited : Bool!
    var pickerPaisesDataSource = ["México", "Estados Unidos", "Argentina", "Perú", "Venezuela"];
    var pickerGeneroDataSource = ["Masculino", "Femenino"];
    private let manager = CoreDataManager()
    
    private var paisSelected = 0;
    private var generoSelected = 0;
    
    func initialice(){
        webView = WKWebView()
        webView!.navigationDelegate = self
        webView!.uiDelegate = self
        submited = false
        paisesPicker.dataSource = self
        paisesPicker.delegate   = self
        generoPicker.dataSource  = self
        generoPicker.delegate = self
        emailText.delegate = self
        passwordText.delegate = self
        nombresText.delegate = self
        apellidosText.delegate = self
        telefonoText.delegate = self
        
        //presenter?.redirectToMain()
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialice()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterRegisterProtocol?
    
    
    @IBAction func creaCuenta(_ sender: Any) {
        indicatorView.startAnimating()
        submited = false
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == paisesPicker{
            paisSelected = row
        }else{
            generoSelected = row
        }
    }
    
}

extension RegisterViewController: WKNavigationDelegate{
    
    func getJavaScript(scripts: String ...) -> String{
        return scripts.joined(separator: ";")
    }
    
    private func getJavaScriptTest() -> String{
        let nombreField = "document.querySelector('#register_form_name').value = 'Juanito perez'"
        let apellidosField  = "document.querySelector('#register_form_lastname').value = 'perez'"
        let correoField = "document.querySelector('#register_form_email').value = 'juanitoPrueba12@superrito.com'"
        let telefono = "document.querySelector('#register_form_phone').value = '55726499'"
        let password = "document.querySelector('#register_form_password').value = '1q2w3e4r'"
        let fechaNacimiento = "document.querySelector('#date-mask').value = '10.10.1993'"
        let pais = "document.querySelector('#register_form_country').value = 'México'"
        let genero = "document.querySelector('#register_form > div:nth-child(10) > div > label > input[type=radio]:nth-child(1)').setAttribute('checked',true)"
        let submit = "document.querySelector('#register_form > div.row > div:nth-child(3) > button').click()"
        return getJavaScript(scripts:nombreField,
                             apellidosField,
                             correoField,
                             telefono,
                             password,
                             fechaNacimiento,
                             pais,
                             genero,
                             submit)
    }
    
    private func getDateFromDatePicker() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year: String = dateFormatter.string(from: self.nacimientoPicker.date)
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: self.nacimientoPicker.date)
        dateFormatter.dateFormat = "dd"
        let day: String = dateFormatter.string(from: self.nacimientoPicker.date)
        return "\(day).\(month).\(year)"
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url  = webView.url
        let urlAbsolute = webView.url?.absoluteString ?? ""
        print( urlAbsolute)
        
        self.takeScreenShot()
        if !submited {
            print("finished", url)
            let nombreField = "document.querySelector('#register_form_name').value = '\(nombresText.text!)'"
            let apellidosField  = "document.querySelector('#register_form_lastname').value = '\(apellidosText.text!)'"
            let correoField = "document.querySelector('#register_form_email').value = '\(emailText.text!)'"
            let telefono = "document.querySelector('#register_form_phone').value = '\(telefonoText.text!)'"
            let password = "document.querySelector('#register_form_password').value = '\(passwordText.text!)'"
            let fechaNacimiento = "document.querySelector('#date-mask').value = '\(getDateFromDatePicker())'"
            let pais = "document.querySelector('#register_form_country').value = '\(pickerPaisesDataSource[paisSelected])'"
            let genero = "document.querySelector('#register_form > div:nth-child(10) > div > label > input[type=radio]:nth-child(\(generoSelected + 1)').setAttribute('checked',true)"
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
            let ocurrence = urlAbsolute.contains("https://leonardo.fm/perfil/registro") as? Bool
            print(ocurrence)
            if  let oc = ocurrence, oc {
                let scriptMessageError = "document.querySelector('#register_form > div.alert.alert-danger.nobottommargin').innerText.trim()"
                
                webView.evaluateJavaScript(scriptMessageError) { [self]
                                            (result, error) in
                    if let result = result as? String {
                        print(result)
                        self.indicatorView.stopAnimating()
                        ViewUtils.showMessageError(title: "", body: result, viewControllerToPresent: self)
                    }
                }
            }else{
                let ocurrence = urlAbsolute.contains("https://leonardo.fm/perfil/payment/confirmacion?&bidhaa=73&kumbukumbu=curso&seminario=1") as? Bool
                print(ocurrence)
                if  let oc = ocurrence, oc {
                    
                    manager.insertUser(user: emailText.text!, password: passwordText.text!) {
                        self.indicatorView.stopAnimating()
                        self.presenter?.redirectToMain()
                    } failure: {
                        print("Error al guardar el usuario")
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

extension RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
}
