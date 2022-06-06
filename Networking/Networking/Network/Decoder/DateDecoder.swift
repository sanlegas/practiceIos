//
//  DateDecoder.swift
//  Networking
//
//  Created by ISAAC DAVID SANTIAGO on 03/06/22.
//

import Foundation

final class DateDecoder: JSONDecoder{
    let dateFormatter = DateFormatter()
    
    override init(){
        super.init()
        dateFormatter.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSXXX"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}
