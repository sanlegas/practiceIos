//
//  FirebaseClient.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 26/06/22.
//

import Foundation
import Firebase

class FirebaseClient{
    var ref: DatabaseReference!
    
    init(){
        print("inicializando clase FirebaseClient")
        ref = Database.database().reference()
    }

    func login(user:String ,
                    password:String ,
                    success: @escaping() -> () ,
                    failure: @escaping() -> ()){
        
        Auth.auth().signIn(withEmail: user, password: password) { [weak self] authResult, error in
            if let error = error {
                failure()
            }
            success()
        }
    }
                                    
    
    func getDeviceById( id:String ,
                        success: @escaping (_ device: Device) -> () ,
                        failure: @escaping () -> ()) {
        ref.child(FirebaseManager.shared.deviceById(id)).observeSingleEvent(of: .value, with:  { (snapshot)  in
            guard let value = snapshot.value as? NSDictionary else {
                failure()
                return
            }
            value.setValue(id, forKey: "uid")
            success(Device(doc:value))
        })
        
    }
    
    func getDevicesByCurrentUser(
                          success: @escaping (_ devices: [Device]) -> (),
                          failure: @escaping () -> ()) {
                              var currentUser:String?
                              if Auth.auth().currentUser?.uid != nil {
                                  currentUser = Auth.auth().currentUser?.uid
                                  getDevicesByUser(user: currentUser!) { devices in
                                      success(devices)
                                  } failure: {
                                      failure()
                                  }
                          }else{
                                 failure()
                          }

    }
    
    func getDevicesByUser(user: String,
                          success: @escaping (_ devices: [Device]) -> (),
                          failure: @escaping () -> ()) {
        ref.child(FirebaseManager.shared.devicesByUser(user)).observeSingleEvent(of: .value, with: { (snapshot) in
            var devices = [Device]()
            guard let value = snapshot.value as? [String:String] else {
                failure()
                return
            }
            let group = DispatchGroup()
            let devicesKey = value as? NSDictionary
            
            for item in devicesKey ?? [:] {
                group.enter()
                let idDevice : String = item.key as? String ?? ""
                self.getDeviceById(id: idDevice) { device in
                    devices.append(device)
                    group.leave()
                } failure: {
                    failure()
                }
            }
            group.notify(queue: .main){
                success(devices)
            }
        })
        
    }
}


