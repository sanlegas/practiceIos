//
//  FirebaseManager.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 26/06/22.
//

import Foundation
class FirebaseManager{
    
    static let shared = { FirebaseManager() }()
    
    let devicesByUser = {
        (user:String) -> String in
        return "users/\(user)/devices"
    }
    
    let deviceById = {
        (id:String) -> String in
        return "devices/\(id)"
    }
}
