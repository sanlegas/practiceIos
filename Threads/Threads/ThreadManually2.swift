//
//  ThreadManually2.swift
//  Threads
//
//  Created by ISAAC DAVID SANTIAGO on 23/07/22.
//

import Foundation
class ThreadManually2{
        
    func createThread(){
        let thread = Thread(target: self, selector: #selector(print), object: nil)
        thread.start()
    }
    @objc func print(){
        Swift.print("ThreadManually2")
    }
    
}
