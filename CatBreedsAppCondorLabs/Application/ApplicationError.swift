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
    
    
    var localizedDescription: String {
        switch self {
        case .appError:
            return "Has occurred an expected error, please try again!"
        case let .networkError(networkError):
            return networkError
        }
    }
}
