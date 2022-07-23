//
//  ViewController.swift
//  RemoteControlServer
//
//  Created by ISAAC DAVID SANTIAGO on 17/07/22.
//

import Cocoa
import Firebase

class ViewController: NSViewController {

    @IBOutlet weak var idDispositivo: NSTextField!
    @IBOutlet weak var usuarioTxt: NSTextField!
    @IBOutlet weak var nombreDispositivoTxt: NSTextField!
    let firebaseClient = FirestoreClient()
    let osUtilities = OsUtilities()
    
    func hardwareUUID() -> String?
    {
        let matchingDict = IOServiceMatching("IOPlatformExpertDevice")
        let platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, matchingDict)
        defer{ IOObjectRelease(platformExpert) }

        guard platformExpert != 0 else { return nil }
        return IORegistryEntryCreateCFProperty(platformExpert, kIOPlatformUUIDKey as CFString, kCFAllocatorDefault, 0).takeRetainedValue() as? String
    }
    

    func captureScreenAndUpload(){
        
        firebaseClient.uploadScreen(idImage: hardwareUUID()!,
                                    imageData: osUtilities.screenCapture()) {
            print("Se subio exitosamente")
            self.firebaseClient.updateLastUpdate(idDevice: self.hardwareUUID()!) {
                self.captureScreenAndUpload()
            } failure: {
                
            }
        } failure: {
            print("Error al subir la captura de pantalla")
        }
    }
    
    func showInformation(){
        usuarioTxt.stringValue = Auth.auth().currentUser?.email ?? ""
        self.view.window?.title = usuarioTxt.stringValue
        idDispositivo.stringValue = hardwareUUID() ??  ""
        print(hardwareUUID())
        nombreDispositivoTxt.stringValue = Host.current().name ?? ""
    }
    
    func handlePointDevice(){
        firebaseClient.handlePointDevice(deviceId: hardwareUUID()!) { x, y in
            print("\(x)  \(y)")
            if x != -1 && y != -1{
                self.osUtilities.moveMouseClick(x: x, y: y)
                self.firebaseClient.updatePoint(idDevice: self.hardwareUUID()!) {
                    print("Se actualizo correctamente las coordenadas")
                } failure: {
                    print("hubo un error al actualizar las coordenadas")
                }

            }
            
        } failure: {
            print("Error al obtener las coordenadas para mandar un click")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureScreenAndUpload()
        
        if Auth.auth().currentUser?.uid != nil {
            firebaseClient.getIdDocument(id: hardwareUUID()!) {
                self.firebaseClient
                    .registerDeviceToUser(idDevice: self.hardwareUUID()!, idUser: Auth.auth().currentUser?.uid ?? "") {
                        print("Se agrego correctamente el dispositivo al usuario")
                        self.handlePointDevice()
                    } failure: {
                        print("error al agregar el dispositivo al usuario")
                    }
                
            } failure: {
                print("se va a registrar el dispositivo")
                self.firebaseClient.registerDevice(idDevice: self.hardwareUUID()!, name: Host.current().name ?? "") {
                    print("Se registro el dispositivo")
                    self.handlePointDevice()
                } failure: {
                    
                }
            }
            
            showInformation()
        }
 
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

