//
//  VoteResponse.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

struct VoteResponse: Codable {
    var id: Int
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}
