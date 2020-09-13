//
//  GetBreedImageService.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

enum GetBreedImageService: ServiceProtocol {
   
    
    case images(id: String)
    case random
        
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        return "/images/search"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case  let .images(id):
            let parameters = ["breed_id": id]
            return .requestParameters(parameters)
            
        case .random:
            return .requestPlain
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
