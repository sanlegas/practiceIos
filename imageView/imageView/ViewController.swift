//
//  ViewController.swift
//  imageView
//
//  Created by ISAAC DAVID SANTIAGO on 04/05/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var myImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.load(URLRequest(url: URL(string:"https://google.es")!))
        title = "My view controller"
        
    }

    
    @IBAction func myButtonAction(_ sender: Any) {
        myView.isHidden = true
        
    }
    
}

