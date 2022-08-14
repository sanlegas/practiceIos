//
//  User+CoreDataProperties.swift
//  MyPromos
//
//  Created by ISAAC DAVID SANTIAGO on 09/08/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
