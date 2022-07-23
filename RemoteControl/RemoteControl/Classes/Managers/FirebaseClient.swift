//
//  FirebaseClient.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 26/06/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class FirebaseClient{
    let ref : Firestore!
    let storageRef: StorageReference
    
    
    
    init(){
        print("inicializando clase FirebaseClient")
        ref = Firestore.firestore()
        storageRef = Storage.storage().reference()
    }

    func updatePointByDevice(idDevice: String,
                                                 x: Int,
                                                 y: Int,
                                                success: @escaping() -> (),
                                                failure: @escaping() -> ()){
        self.ref.collection("devices").document(idDevice)
            .setData(["point": ["x": x,"y":y]], merge: true) {
                err in
                if let err = err {
                    print("Error al actualizar las coordenadas")
                    failure()
                }else{
                    print("coordenadas actualizadas correctamente")
                    success()
                }
        }
    }
    
    func getScreenFromIdDevice(idDevice:String,
                               success: @escaping(_ screen: Data) -> () ,
                               failure: @escaping() -> ()
    ){
        let pathReference = storageRef.child( "\(idDevice).jpg")
        pathReference.getData(maxSize: 3 * 1024 * 1024) { data, error in
            if let error = error {
                print("Hubo un error", error)
                failure()
            }else {
                success(data!)
            }
        }
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
        let docRef = ref.collection("devices").document(id)
        docRef.getDocument(as: Device.self) { (result) in
            switch result {
            case .success(let device):
                success(device)
            case .failure(let error):
                failure()
            }
        }
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
        var devices = [Device]()
        let group = DispatchGroup()

        let docRef = ref.collection("users").document(user)
        docRef.getDocument() { (document, err) in
                if let document = document, document.exists {
                    let value = document.data() as? NSDictionary
                    let devicesKeys = value!["devices"] as? NSArray
                    let objCArray = NSMutableArray(array: devicesKeys!)
                    if let swiftArray = objCArray as NSArray as? [String] {
                        for itemDeviceKey in swiftArray {
                            group.enter()
                            self.getDeviceById(id: itemDeviceKey) { device in
                                devices.append(device)
                                group.leave()
                            } failure: {
                                failure()
                            }
                        }
                        group.notify(queue: .main){
                            success(devices)
                        }
                    }else{
                        failure()
                    }
                } else {
                    print("Document does not exist")
                    failure()
                }
        }
    }
    
    func handleScreenDevice(deviceId: String,
                            lastUpdated: Any,
                            success: @escaping (_ screenCapture: Data) -> (),
                            failure: @escaping () -> ()){
        ref!.collection("devices").document(deviceId)
            .parent.whereField("lastUpdate", isGreaterThanOrEqualTo: Timestamp())
            .addSnapshotListener { documentSnapshot, error in
                print("posibles cambios en el screen \(deviceId) \(lastUpdated)")
                guard let snapshot = documentSnapshot else {
                            print("Error fetching snapshots: \(error!)")
                            return
                }
                self.getScreenFromIdDevice(idDevice: deviceId) { screen in
                    success(screen)
                } failure: {
                    failure()
                }
            }
    }
    
}


