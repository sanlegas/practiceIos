//
//  ThreadManually.swift
//  Threads
//
//  Created by ISAAC DAVID SANTIAGO on 22/07/22.
//

import Foundation

class ThreadManually{
    func createThread(){
        Thread.detachNewThreadSelector(#selector(print), toTarget: self, with: nil)
    }
    
    @objc func print(){
        Swift.print("ThreadManually")
    }
}

