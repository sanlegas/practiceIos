//
//  UserEntity+CoreDataProperties.swift
//  Contranalisis
//
//  Created by ISAAC DAVID SANTIAGO on 10/08/22.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension UserEntity : Identifiable {

}
