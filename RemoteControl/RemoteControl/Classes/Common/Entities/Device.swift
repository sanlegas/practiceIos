//
//  Device.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 22/06/22.
//

import Foundation

struct Device {
    
    
    let uid:String?
    let ip:String?
    let name:String?
    let online:Bool
    
    init(doc: NSDictionary){
        self.uid = doc["uid"] as? String
        self.ip = doc["ip"] as? String
        self.name = doc["name"] as? String
        self.online = true
    }
    
    
}
