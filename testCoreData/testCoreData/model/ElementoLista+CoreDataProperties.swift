//
//  ElementoLista+CoreDataProperties.swift
//  testCoreData
//
//  Created by ISAAC DAVID SANTIAGO on 01/06/22.
//
//

import Foundation
import CoreData


extension ElementoLista {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementoLista> {
        return NSFetchRequest<ElementoLista>(entityName: "ElementoLista")
    }

    @NSManaged public var nombre: String?

}

extension ElementoLista : Identifiable {

}
