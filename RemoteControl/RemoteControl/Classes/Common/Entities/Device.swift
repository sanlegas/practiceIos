//
//  Device.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 22/06/22.
//

import FirebaseFirestoreSwift
import Foundation

public struct Device : Codable {
    @DocumentID var uid:String?
    var ip:String?
    var name:String?
    var online:Bool?
    
    init(doc: NSDictionary){
        self.uid = doc["uid"] as? String
        self.ip = doc["ip"] as? String
        self.name = doc["name"] as? String
        //self.online = doc["online"] as? DarwinBoolean
    }
    
    
}
