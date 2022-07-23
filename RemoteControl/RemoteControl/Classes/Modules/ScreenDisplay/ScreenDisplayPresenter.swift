//
//  ScreenDisplayPresenter.swift
//  RemoteControl
//
//  Created ISAAC DAVID SANTIAGO on 11/07/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ScreenDisplayPresenter: ViewToPresenterScreenDisplayProtocol {



    var view: PresenterToViewScreenDisplayProtocol?
    var interactor: PresenterToInteractorScreenDisplayProtocol?
    var router: PresenterToRouterScreenDisplayProtocol?
    
    func getScreenFromIdDevice(idDevice:String,
                               success: @escaping(_ screen: Data) -> () ,
                               failure: @escaping() -> ()){
        interactor?.getScreenFromIdDevice(idDevice: idDevice, success: { Data in
            success(Data)
        }, failure: {
            failure()
        })
    }
    
    func updatePointByDevice(idDevice: String, x: Int, y: Int, success: @escaping () -> (), failure: @escaping () -> ()) {
        interactor?.updatePointByDevice(idDevice: idDevice, x: x, y: y, success: {
            success()
        }, failure: {
            failure()
        })
    }
    
    
    func handleScreenDevice(deviceId: String, lastUpdated: Any, success: @escaping (Data) -> (), failure: @escaping () -> ()) {
        interactor?.handleScreenDevice(deviceId: deviceId, lastUpdated: lastUpdated, success: { screenCapture in
            success(screenCapture)
        }, failure: {
            failure()
        })
    }
    
}

extension ScreenDisplayPresenter: InteractorToPresenterScreenDisplayProtocol {
    
}
