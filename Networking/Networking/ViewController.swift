//
//  ViewController.swift
//  Networking
//
//  Created by ISAAC DAVID SANTIAGO on 03/06/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var downloadImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreLabel.text = ""
        idLabel.text = ""
        emailLabel.text = ""
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    

    @IBAction func getUserAction(_ sender: Any) {
       print("getUserAction")
        
        activityIndicator.startAnimating()
        NetWorkingProvider.shared.getUser(id: 1234){
            (user) in
            self.activityIndicator.stopAnimating()
            self.nombreLabel.text = user.name
            self.emailLabel.text  = user.email
            self.idLabel.text = user.id?.description
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nombreLabel.text = error.debugDescription
        }
    }
    
    
    @IBAction func addUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser =
        NewUser(name: "sanlegaas", email: "sanlegas@test.com", gender: "Male", status: "Active")
        
        NetWorkingProvider.shared.addUser (user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.nombreLabel.text = user.name
            self.emailLabel.text  = user.email
            self.idLabel.text = user.id?.description
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nombreLabel.text = error.debugDescription
        }

    }
    
    
    @IBAction func downloadImage(_ sender: Any) {
        downloadImageButton.isHidden = true
        logoImageView.kf.setImage(with: URL(string:"https://www.apple.com/v/swift/c/images/overview/icon_swift_hero_large_2x.png"))
    }
}

