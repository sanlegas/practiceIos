//
//  CoreDataManager.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 09/08/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    
    private let container: NSPersistentContainer
    
    
    init(){
        container = NSPersistentContainer(name: "Contranalisis")
        setupDatabase()
    }
    
    func obtieneUsuario() -> UserE?{
        let fetchRequest : NSFetchRequest<UserE> = UserE.fetchRequest()
        
        do{
            let result = try container.viewContext.fetch(fetchRequest)
            if result.isEmpty {
                return nil
            }
            if let usuarioRet = result[0] as? UserE{
                print(usuarioRet)
            }
            return result[0]
        }catch{
            print("Error al obtener usuarios")
        }
        return nil
    }
    
    func saveChanges(){
        let context = container.viewContext

        do{
            try context.save()
            print("cambios actualizados")
        } catch {
            print("Error guardando usuario")
        }
    }
    
    func insertUser(user: String, password: String, success: @escaping() -> (), failure:@escaping() ->()){
        let context = container.viewContext
        let userE = UserE (context: context)
        userE.email = user
        userE.password = password
        
        do{
            try context.save()
            print("usuario \(user) guardado")
            success()
        } catch {
            print("Error guardando usuario")
            failure()
        }
    }
    
    private func setupDatabase(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error loading store")
                return
            }
            
            print("Database Ready")
        }
    }
}


