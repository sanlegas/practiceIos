//
//  ConcurrentAsync.swift
//  Threads
//
//  Created by ISAAC DAVID SANTIAGO on 23/07/22.
//

import Foundation
class ConcurrentAsync {
    
    init(){
        let concurrentQueue = DispatchQueue(label: "concurrent Queue", attributes: .concurrent)
        
        print("1st statment of concurrent queue")
        print("2nd statment of concurrent queue")
        
        concurrentQueue.async {
            for i in 0...5{
                print("concurrent queue sync statment \(i)")
            }
        }
        
        print("end of concurrent queue code")
    }
}
