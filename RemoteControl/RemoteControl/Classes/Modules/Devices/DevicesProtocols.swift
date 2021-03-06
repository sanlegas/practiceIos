//
//  devicesProtocols.swift
//  RemoteControl
//
//  Created ISAAC DAVID SANTIAGO on 21/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

protocol ViewToPresenterDevicesProtocol: AnyObject{
    var view:PresenterToViewDevicesProtocol? {get set}
    var interactor: PresenterToInteractorDevicesProtocol? {get set}
    var router: PresenterToRouterDevicesProtocol? {get set}
    func redirectScrenDisplay(with device: Device)
    func getDevicesByCurrentUser(success: @escaping (_ devices: [Device]) -> (), failure:@escaping() -> () )
}

protocol PresenterToViewDevicesProtocol:AnyObject {
    
}

protocol InteractorToPresenterDevicesProtocol: AnyObject {
    
}

protocol PresenterToInteractorDevicesProtocol: AnyObject{
    func getDevicesByCurrentUser(success: @escaping (_ devices: [Device]) -> (), failure:@escaping() -> () ) 
}

protocol PresenterToRouterDevicesProtocol: AnyObject{
    func redirecScreenView(on view: PresenterToViewDevicesProtocol,with device: Device)

}
