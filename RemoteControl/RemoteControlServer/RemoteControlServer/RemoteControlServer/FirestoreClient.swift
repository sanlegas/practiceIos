//
//  FirestoreClient.swift
//  RemoteControlServer
//
//  Created by ISAAC DAVID SANTIAGO on 18/07/22.
//

import Foundation
import Firebase
import FirebaseStorage

class FirestoreClient {
    let ref : Firestore!
    var storageRef: StorageReference

    init(){
        ref = Firestore.firestore()
        storageRef = Storage.storage().reference()

    }

    
    func uploadScreen(idImage: String,
                                    imageData: Any,
                                    success: @escaping() -> (),
                                    failure: @escaping() -> ()){
        let imageRef = storageRef.child("\(idImage).jpg")
        let uploadTask = imageRef.putData(imageData as! Data) { metadata, error in
            if error != nil{
                failure()
            }else{
                success()
            }
            
        }
        
    }
    
    func getDevicesByUser(idUser: String,
                          success: @escaping(_ devices: [String]) -> (),
                          failure: @escaping() -> ()){
        
        let docRef = ref.collection("users").document(idUser)
        docRef.getDocument() { (document, err) in
            if let err = err {
                failure()
            }
            if let document = document, document.exists {
                let value = document.data() as? NSDictionary
                let devicesKeys = value!["devices"] as? NSArray
                let objCArray = NSMutableArray(array: devicesKeys!)
                if let swiftArray = objCArray as NSArray as? [String] {
                    success(swiftArray)
                }
            }else if !document!.exists {
                success([])
            }
            
        }
    }
    
    
    func updateLastUpdate(idDevice:String,
                                            success: @escaping() -> (),
                                            failure: @escaping() -> ()){
        self.ref.collection("devices").document(idDevice)
            .setData(["lastUpdate": Timestamp()], merge: true) {
                err in
                if let err = err {
                    print("Error al actualizar la fecha de actualizacion")
                    failure()
                }else{
                    success()
                }
        }
    }
    
    func registerDeviceToUser(idDevice: String,idUser: String, success: @escaping () -> (), failure: @escaping () -> ()){
        self.getDevicesByUser(idUser: idUser) { devices in
            if !devices.contains(idDevice){
                var devicesAdded = devices
                devicesAdded.append(idDevice)
                print(devicesAdded)
                self.ref.collection("users").document(idUser).setData([ "devices": devicesAdded], merge: true) { err in
                    if let err = err {
                        print("Error al actualizar datos")
                        failure()
                    }else{
                        success()
                    }
                }
            }else{
                print("El dispositivo ya esta registrado en el usuario")
                success()
            }

        } failure: {
            
        }
    }
    
    func updatePoint(idDevice: String,
                                success: @escaping () -> (),
                                failure: @escaping () -> ()){
        
        ref.collection("devices").document(idDevice).setData([
            "point": ["x":-1, "y":-1]
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
                failure()
            } else {
                print("Document successfully written!")
                success()
            }
        }
    }
    
    func registerDevice(idDevice: String, name: String,
                        success: @escaping () -> (), failure: @escaping () -> ()){
        
        ref.collection("devices").document(idDevice).setData([
            "lastUpdate": Timestamp(),
            "name": name,
            "online": true,
            "point": ["x":-1, "y":-1]
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
                failure()
            } else {
                print("Document successfully written!")
                success()
            }
        }
    }

    func getIdDocument(id: String,
                          success: @escaping () -> (),
                          failure: @escaping () -> ()) {
        
        let docRef = ref.collection("devices").document(id)
        docRef.getDocument() { (document, err) in
            if let document = document, document.exists {
                success()
            }else{
                failure()
            }
        }
    }
    
    func handlePointDevice(deviceId: String,
                           success: @escaping ( _ x: Int, _ y: Int) -> (),
                            failure: @escaping () -> ()){
        ref!.collection("devices").document(deviceId)
            .parent.whereField("point", isNotEqualTo: ["x":-1, "y": -1])
            .addSnapshotListener { documentSnapshot, error in
                print("posibles cambios en el point \(deviceId)")
                guard let documents = documentSnapshot else {
                            print("Error fetching snapshots: \(error!)")
                            return
                }
                documents.documentChanges.forEach { diff in
                       if (diff.type == .modified) {
                           print("Modified city: \(diff.document.data())")
                           let value = diff.document.data() as? NSDictionary
                           let point = value!["point"] as? NSDictionary
                           success(point!["x"] as! Int, point!["y"] as! Int)
                       }
                }
                
            }
    }
    
}
