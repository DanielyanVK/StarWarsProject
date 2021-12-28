//
//  DataModel.swift
//  StarWars
//
//  Created by Vladislav on 24.12.2021.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class SwCharacter: Object, Codable {
    @objc dynamic var name: String
    @objc dynamic var height: String
    @objc dynamic var mass: String
    @objc dynamic var hair_color: String
    @objc dynamic var skin_color: String
    @objc dynamic var eye_color: String
    @objc dynamic var birth_year: String
    @objc dynamic var gender: String
    @objc dynamic var homeworld: String
    var films: List<String>? = List()
    var species: List<String>? = List()
    var vehicles: List<String>? = List()
    var starships: List<String>? = List()
    @objc dynamic var created: String
    @objc dynamic var edited: String
    @objc dynamic var url: String
    
    convenience init(films: List<String>, species: List<String>, vehicles: List<String>, starships: List<String>) {
        self.init()
        self.films = films
        for film in films {
            films.append(film)
        }
        self.vehicles = vehicles
        for vehicle in vehicles {
            vehicles.append(vehicle)
        }
        self.species = species
        for specie in species {
            species.append(specie)
        }
        self.starships = starships
        for starship in starships {
            starships.append(starship)
        }
      }
}
