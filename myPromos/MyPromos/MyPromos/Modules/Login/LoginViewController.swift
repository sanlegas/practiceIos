//
//  LoginViewController.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import UIKit
import WebKit


class LoginViewController: UIViewController {
    var webView: WKWebView!
    private let manager = CoreDataManager()
    private var usuarioFound = false
    private var usuarioLogin = false
    private var usuarioLogueado = false
    private var usuarioLocal: UserE?
    @IBOutlet weak var usuarioText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var iniciarButton: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialice()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    func initialice(){
        webView = WKWebView()
        webView!.navigationDelegate = self
        usuarioText.delegate = self
        passwordText.delegate = self
        validaUsuario()
    }
    
    func validaUsuario(){
        if let usuario = manager.obtieneUsuario() {
            showLoader()
            print("Se ha encontrado el usuario \(usuario.email) \(usuario.password)")
            usuarioLocal = usuario
            usuarioFound = true
            let url = URL(string: "https://leonardo.fm/perfil")!
            webView.load(URLRequest(url: url))
        }else{
            usuarioFound = false
        }
    }
    


    // MARK: - Properties
    var presenter: ViewToPresenterLoginProtocol?
    
    @IBAction func crearCuenta(_ sender: Any) {
        presenter?.redirectToRegister()
    }
    
    @IBAction func recuperaCuenta(_ sender: Any) {
        presenter?.redirectToRecover()
    }
    
    @IBAction func login(_ sender: Any) {
        usuarioLogin = true
        showLoader()
        let url = URL(string: "https://leonardo.fm/perfil/login")!
        webView.load(URLRequest(url: url))
    }
    
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: PresenterToViewLoginProtocol{
    // TODO: Implement View Output Methods
}

extension LoginViewController: WKNavigationDelegate{
    
    func hideLoader(){
        loader.stopAnimating()
        usuarioText.isEnabled = true
        passwordText.isEnabled = true
        iniciarButton.isEnabled = true
    }
    
    func showLoader(){
        loader.startAnimating()
        usuarioText.isEnabled = false
        passwordText.isEnabled = false
        iniciarButton.isEnabled = false
    }
    
    func getJavaScript(scripts: String ...) -> String{
        return scripts.joined(separator: ";")
    }
    
    func logueaDefaultUser(){
        let usuarioScript = "document.querySelector('#login_form > div:nth-child(1) > input.form-control').value = '\(usuarioLocal!.email!)'"
        let passwordScript = "document.querySelector('#login_form > div:nth-child(2) > input.form-control').value = '\(usuarioLocal!.password!)'"
        let buttonSubmit = "document.querySelector('#login_form > div.row > div.col-xs-4 > button').click()"
        let scripts = getJavaScript(scripts: usuarioScript,passwordScript,buttonSubmit)
        webView.evaluateJavaScript(scripts)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error")
        print(error)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = webView.url?.absoluteString
        print("url", url)
        if usuarioLogueado {
            if url! == "https://leonardo.fm/perfil/login"{
                hideLoader()
                ViewUtils.showMessageError(title: "Datos incorrectos", body: "Verifica la informacion e intenta de nuevo", viewControllerToPresent: self)
                print("Verifica la informacion e intenta de nuevo")
                usuarioLogueado = false
            }else{
                usuarioLocal?.email = usuarioText.text!
                usuarioLocal?.password = passwordText.text!
                manager.saveChanges()
                presenter?.redirectToMain()
            }
        } else if url! == "https://leonardo.fm/perfil" {
            if usuarioFound {
                logueaDefaultUser()
            }
        }else if url! == "https://leonardo.fm/perfil/miperfil"{
            presenter?.redirectToMain()
        }else if url! == "https://leonardo.fm/perfil/login"{
            if usuarioFound && !usuarioLogin{
                hideLoader()
            }else if usuarioLogin{
                logueaUsuario()
            }
        }
    }
    
    func logueaUsuario(){
        let scriptUser = "document.querySelector('#login_form > div:nth-child(1) > input.form-control').value = '\(usuarioText.text!)'"
        let scriptPassword = "document.querySelector('#login_form > div:nth-child(2) > input').value = '\(passwordText.text!)'"
        let scriptButton = "document.querySelector('#login_form > div.row > div.col-xs-4 > button').click()"
        let scriptLogin = getJavaScript(scripts: scriptUser,scriptPassword,scriptButton)
        takeScreenShot()
        webView.evaluateJavaScript(scriptLogin) { (result, error) in
            self.usuarioLogueado = true
            if error == nil{
                
            }
        }
    }
    
    func takeScreenShot(){
        let config = WKSnapshotConfiguration()

        config.rect = CGRect(x: 0, y: 0, width: 1150, height: 1150)
        webView.takeSnapshot(with: config) { image, error in
            if let image = image {
                print(image.size)
            }
        }
    }
    
    
}

