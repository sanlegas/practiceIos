//
//  ViewController.swift
//  Threads
//
//  Created by ISAAC DAVID SANTIAGO on 22/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let threadClass = ThreadManually()
        //threadClass.createThread()
        
        let threadClass2 = ThreadManually2()
        //threadClass2.createThread()
        
        let concurrentAsyncQueue = ConcurrentAsync()
        //let concurrentSyncQueue = ConcurrentSync()
    }


}

