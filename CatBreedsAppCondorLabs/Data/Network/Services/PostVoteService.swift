//
//  PostVoteService.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//https://api.thecatapi.com/v1/votes

import Foundation


enum PostVoteService: ServiceProtocol {
    
    case vote(id: String, vote: VoteEnum)
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        return "/votes"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .vote(id, vote):
            let parameters: [String: Any] = ["image_id": id, "sub_id": "tatan86", "value": vote.rawValue]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers{
        let headers: [String: String] = [NetworkConstants.keyApiKey : NetworkConstants.apiKey]
        return headers
    }
    
    var parametersEncoding: ParametersEncoding {
        return .json
    }
    
    
}
