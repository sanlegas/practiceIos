//
//  MainViewController.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 09/08/22.
//  
//

import UIKit
import WebKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://leonardo.fm/perfil/miperfil")!
        webView.load(URLRequest(url: url))
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMainProtocol?
    
}

extension MainViewController: PresenterToViewMainProtocol{
    // TODO: Implement View Output Methods
}
