//
//  Extension Decodable.swift
//  WeatherLA
//
//  Created by Vladislav on 24.12.2021.
//

import Foundation
import SwiftyJSON
import Alamofire

extension Decodable {
static func from(json: JSON) -> Self? {
do {
let decoded = try JSONDecoder().decode(Self.self, from: json.rawData())
return decoded
} catch {
print("Deserialize error: \(error.localizedDescription)")
return nil
}
}
}
