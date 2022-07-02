//
//  InputOutput.swift
//  VIPER
//
//  Created by ISAAC DAVID SANTIAGO on 14/06/22.
//

import Foundation

protocol InteractorProtocolInput {
 
    func addNewPersonWithData(nombre:String, apellido:String)
}
 
protocol InteractorProtocolOutput {
 
    func updateObjects(objects:[String])
}
