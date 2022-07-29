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
        
        DispatchQueue.global(qos: .background).async {
            
            for i in 0...5{
                DispatchQueue.main.async(execute: {
                    sleep(4)
                    print("concurrent queue async statment \(i)")
                })
            }
        }
        
        
        print("end of concurrent queue code")
    }
}
