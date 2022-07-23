//
//  AppDelegate.swift
//  RemoteControlServer
//
//  Created by ISAAC DAVID SANTIAGO on 17/07/22.
//

import Cocoa
import FirebaseCore
import Firebase

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var main: NSWindowController!

    func application(_ application: NSApplication, open urls: [URL]) {
        

    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        FirebaseApp.configure()
        var controllerInitial = ""
        if let user = Auth.auth().currentUser?.uid {
                controllerInitial = "MainViewController"
        }else{
            controllerInitial = "LoginViewController"
        }
        
        main = NSStoryboard(name : "Main", bundle: nil).instantiateController(withIdentifier: "MainWindow") as! NSWindowController
                let mainVc = NSStoryboard(name:"Main", bundle: nil).instantiateController(withIdentifier: controllerInitial) as! NSViewController
                main.window?.contentViewController = mainVc
                main.window?.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

