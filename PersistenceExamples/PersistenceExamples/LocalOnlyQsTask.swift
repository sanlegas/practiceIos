//
//  LocalOnlyQsTask.swift
//  PersistenceExamples
//
//  Created by ISAAC DAVID SANTIAGO on 14/08/22.
//

import Foundation
import RealmSwift
// LocalOnlyQsTask is the Task model for this QuickStart
class LocalOnlyQsTask: Object {
    @Persisted var name: String = ""
    @Persisted var owner: String?
    @Persisted var status: String = ""
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
