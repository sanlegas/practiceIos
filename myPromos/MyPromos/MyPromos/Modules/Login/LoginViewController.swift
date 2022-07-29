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


    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialice()
        //let url = URL(string: "https://www.promodescuentos.com/login")!

        //webView.load(URLRequest(url: url))

        //webView.allowsBackForwardNavigationGestures = true
    }
    
    func initialice(){
        webView = WKWebView()
        webView!.navigationDelegate = self
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
        let url = URL(string: "https://www.promodescuentos.com/login")!
        webView.load(URLRequest(url: url))
    }
    
}

extension LoginViewController: PresenterToViewLoginProtocol{
    // TODO: Implement View Output Methods
}

extension LoginViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished", webView.url)
        //let scriptCode = "document.querySelector('##login_form-password').value = 'ISAAC'"
        let selectorUser = "document.querySelector('#login_form-identity').value = 'ISAAC'"
        let selectorPassword = "#login_form-password"
        
        webView.evaluateJavaScript(selectorUser) { (result, error) in
            if error == nil {
                print(result)
                self.takeScreenShot()
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

