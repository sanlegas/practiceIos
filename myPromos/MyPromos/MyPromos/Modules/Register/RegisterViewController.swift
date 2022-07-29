//
//  RegisterViewController.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 27/07/22.
//  
//

import UIKit
import WebKit

class RegisterViewController: UIViewController {
    var webView: WKWebView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var submited : Bool!
    @IBOutlet weak var errorMessages: UITextView!
    
    func initialice(){
        webView = WKWebView()
        webView!.navigationDelegate = self
        webView!.uiDelegate = self
        submited = false
    }
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialice()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterRegisterProtocol?
    
    
    @IBAction func creaCuenta(_ sender: Any) {
        let url = URL(string: "https://www.promodescuentos.com/register")!
        webView.load(URLRequest(url: url))
    }
    
}

extension RegisterViewController: PresenterToViewRegisterProtocol{
    // TODO: Implement View Output Methods
}

extension RegisterViewController: WKUIDelegate{
    
    
}

extension RegisterViewController: WKNavigationDelegate{
    
    func getJavaScript(scripts: String ...) -> String{
        return scripts.joined(separator: ";")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if !submited {
            print("finished", webView.url)
            //#registerForm-email
            
            let email = "document.querySelector('#registerForm-email').value = '\(emailText.text!)'"
            let selectorUser = "document.querySelector('#registerForm-username').value = '\(userText.text!)'"
            let selectorPassword = "document.querySelector('#registerForm-password').value = '\(passwordText.text)'"
            let acceptTerm = "$('#registerForm > ul > li:nth-child(5) > div > label > span.checkbox-text.tGrid-cell.space--l-2.space--t-0.vAlign--all-m.mute--text')[0].click()"
            let clickSubmit = "document.querySelector(\"[type='submit']\").click()"
            self.submited = true
            let scripts = getJavaScript(scripts:acceptTerm)
            /*
            webView.evaluateJavaScript(scripts) {
                                                        (result, error) in
                if error == nil {
                    let source = webView
                    self.takeScreenShot()
                }
            }
             */
            webView.evaluateJavaScript("document.body.innerHTML", completionHandler: { (value: Any!, error: Error!) -> Void in
                if error == nil {
                    print(value)
                    //Error logic
                    return
                }

                //let result = value as? String
                //Main logic
            })
        }else{
            print("Se ha mandado el submit antes, probablemente existan errores")
            let scriptMessages = "[... document.getElementsByClassName(\"formList-info formList-info--error\")].map( (alerta) => alerta.innerText).join(\"\n\")"
            let errorMessages = webView.evaluateJavaScript(scriptMessages) as! String?
            print(errorMessages)
            
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
