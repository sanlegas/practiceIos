//
//  Device.swift
//  RemoteControlServer
//
//  Created by ISAAC DAVID SANTIAGO on 18/07/22.
//

import Foundation
import FirebaseFirestore

public struct Device : Codable, Hashable, Identifiable {
    @DocumentID var uid:String?
    var name:String?
    var online:Bool?
    var lastUpdate: Timestamp?
    //var point: Point

    
}
