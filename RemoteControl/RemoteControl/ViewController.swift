//
//  ViewController.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 16/06/22.
//

import UIKit
import Starscream
import FirebaseAuth

class ViewController: UIViewController, WebSocketDelegate {
    var socket: WebSocket!
    var isConnected : Bool = false
    var auth = AuthFireBase()
    
    let email = "isaacsanlegas@gmail.com"
    let password = "1234556553"
    

    
    func initilizeSocket(){
        var request = URLRequest(url: URL(string: "http://c7b1-2806-2f0-9261-e22e-89d1-2a52-1cfa-77fb.ngrok.io")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }

    func authtn(){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          print(" usuario creado")
        }
    }
    
    @IBAction func createUserAction(_ sender: Any) {
        print("Creando usuario")
        authtn()
    }
    
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
            case .connected(let headers):
                isConnected = true
                print("websocket is connected: \(headers)")
                socket.write(string:"HOLA MUNDO")
            case .disconnected(let reason, let code):
                isConnected = false
                print("websocket is disconnected: \(reason) with code: \(code)")
            case .text(let string):
                print("Received text: \(string)")
            case .binary(let data):
                print("Received data: \(data.count)")
            case .ping(_):
                break
            case .pong(_):
                break
            case .viabilityChanged(_):
                break
            case .reconnectSuggested(_):
                break
            case .cancelled:
                isConnected = false
            case .error(let error):
                isConnected = false
                
            }
    }
    

}

