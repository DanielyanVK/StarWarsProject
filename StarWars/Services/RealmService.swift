//
//  RealmService.swift
//  StarWars
//
//  Created by Vladislav on 27.12.2021.
//

import Foundation
import RealmSwift

class RealmService {
    // Function to cache data
    func save (_ object: Object) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(object, update: .modified)
        }
    }
    // Function to cache multiple objects
    func save (_ objects: [Object]) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(objects, update: .modified)
        }
    }
    // Function to retrieve objects
    func retriveObjects<T: Object>(by type: T.Type) -> [T]{
        let realm = try! Realm()
        return Array(realm.objects(type))
    }
    
    
}
