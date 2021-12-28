//
//  WeatherManagerClass.swift
//  StarWars
//
//  Created by Vladislav on 25.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift
import Realm

// creating class to manage request outside of view controllet
class SwManager {
    private let realmService = RealmService()
    // Creating static constant to call anywhere
    static let shared = SwManager()
    // empty variable to store data inside class
    var swData: [SwCharacter] = []
    // completion block  to get a request first and then transfer data to table so app won't crash
    func getSW(completion: @escaping ([SwCharacter]) -> ()) {
        RequestHandler(path: "/people/")
            .newBaseURL("https://swapi.dev/api/")
            // Entering "folder" we need to get data from
            .jsonKey("results")
            .response { (model: [SwCharacter]?) in
                print(model!)
                // getting data to our variable
                self.swData = try! model ?? []
                // setting up constant for transfering data outside
                let finalData = model
                // Trying to cache data and use it (no success)
                self.realmService.save(finalData!)
                let savedCharacters = self.realmService.retriveObjects(by: SwCharacter.self)
                print(self.swData.count)
                // completion block, after that done, it moves to character view controller
                completion(savedCharacters)
            }
    }
}

