//
//  ApplicationError.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

enum ApplicationError: Error {
    case networkError(networkError: String)
    case appError
    case infraestructureError(descriptionError: String)
    case domainError(description: String)
    
    var localizedDescription: String {
        switch self {
        case .appError:
            return "Has occurred an expected error, please try again!"
        case let .networkError(networkError):
            return networkError
        case let .infraestructureError(descriptionError):
            return descriptionError
        case .domainError(description: let description):
            return description
        }
    }
}
