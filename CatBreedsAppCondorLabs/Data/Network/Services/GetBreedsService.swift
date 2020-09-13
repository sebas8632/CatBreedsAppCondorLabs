//
//  GetBreedsService.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

enum GetBreedsService: ServiceProtocol {
   
    case all
    case breed(name: String)
    
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/breeds"
        case .breed:
            return "breed"
    
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .all:
            return .requestPlain
        case let .breed(name):
            let parameters = ["": name]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers {
        let headers: [String: String] = [NetworkConstants.keyApiKey : NetworkConstants.apiKey]
        return headers
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
    

}
