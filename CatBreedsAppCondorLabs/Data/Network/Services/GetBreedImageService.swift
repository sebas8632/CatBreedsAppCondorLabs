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
    
    //https://api.thecatapi.com/v1/images/search?breed_id=beng
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        switch self {
      
        case .images:
            return "/images/search"
    
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case  let .images(id):
            let parameters = ["breed_id": id]
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
