//
//  Device.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 22/06/22.
//

import FirebaseFirestoreSwift
import Foundation
import FirebaseFirestore

public struct Device : Codable {
    @DocumentID var uid:String?
    var ip:String?
    var name:String?
    var online:Bool?
    var lastUpdate: Timestamp?
    var point: Point

    
    
}
