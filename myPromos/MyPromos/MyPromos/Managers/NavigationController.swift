//
//  NavigationController.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 29/07/22.
//

import UIKit
import WebKit

class NavigationController: UIViewController, WKNavigationDelegate {
    var initialized: Bool?
    var webView: WKWebView?
    var action: ActionWebView?
    var loadCompleted : (() -> (Void))?
    
    enum ActionWebView {
        case none
        case login
    }
    
    
    func initialice(){
        initialized = true
        webView = WKWebView()
        webView!.navigationDelegate = self
        action = .none
    }
    
    
    init(nibName: String , bundle: Bundle){
        super.init(nibName: nil, bundle: nil)
        initialice()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func login(_ user: String, _ password: String){
        //self.loadCompleted = loadCompleted
        let url = URL(string: "https://www.promodescuentos.com/login")!
       // webView!.load(URLRequest(url: url))
        //waitLoad()
        //loadCompleted()
    }
    
    func waitLoad(){
        let concurrentQueue = DispatchQueue(label: "concurrent Queue", attributes: .concurrent)
        DispatchQueue.global(qos: .default).async {
            while ( !self.webView!.isLoading ){
                print("Esta cargando")
                sleep(1)
            }
            print("termino de cargar")
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished", webView.url)
        self.loadCompleted?()
    }
    
}
