//
//  BreedImage.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

struct BreedImage: Codable {
    var id: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageUrl = "url"
    }
}
