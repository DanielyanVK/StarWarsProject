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

class SwManager: CharactersTableViewController {
    
    static let shared = SwManager()
    
    func getSW(completion: @escaping () -> ()) {
        RequestHandler(path: "/people/")
            .newBaseURL("https://swapi.dev/api/")
            // Entering "folder" we need to get data from
            .jsonKey("results")
            .response { (model: [SwCharacter]?) in
                print(model!)
                // getting data to our variable
                self.swData = try! model ?? []
                print(self.swData.count)
                // always call that so results will show on table
                completion()
                
            }
    }
}

