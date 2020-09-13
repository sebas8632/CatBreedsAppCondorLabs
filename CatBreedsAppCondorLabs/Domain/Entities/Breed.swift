//
//  Breed.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
struct Breed: Codable {
    
    var id: String
    var name: String
    var origin: String
    var wikipediaUrl: String?
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case origin = "origin"
        case wikipediaUrl = "wikipedia_url"
        case description = "description"
        
       }
}

