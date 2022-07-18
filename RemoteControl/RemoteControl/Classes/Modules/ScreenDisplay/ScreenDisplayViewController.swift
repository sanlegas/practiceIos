//
//  ScreenDisplayViewController.swift
//  RemoteControl
//
//  Created ISAAC DAVID SANTIAGO on 11/07/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ScreenDisplayViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageScreen: UIImageView!
    var presenter: ViewToPresenterScreenDisplayProtocol?
    var deviceId:   String?
    var lastUpdated: Any?
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        presenter?.getScreenFromIdDevice(idDevice: deviceId!, success: { screen in
            self.imageScreen.image = UIImage(data: screen)
            
            self.presenter?.handleScreenDevice(deviceId: self.deviceId!, lastUpdated: self.lastUpdated, success: { Data in
                self.imageScreen.image = UIImage(data: Data)
            }, failure: {
                print("failure")
            })
        }, failure: {
            print("Error al obtener la pantalla del dispositivo")
        })
    
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    @objc func swipedUp(){
        //print("swipedUp")
    }
    
}

extension ScreenDisplayViewController: PresenterToViewScreenDisplayProtocol{
    
}
