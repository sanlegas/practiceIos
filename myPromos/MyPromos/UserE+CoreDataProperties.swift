//
//  UserE+CoreDataProperties.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 09/08/22.
//
//

import Foundation
import CoreData


extension UserE {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserE> {
        return NSFetchRequest<UserE>(entityName: "UserE")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension UserE : Identifiable {

}
