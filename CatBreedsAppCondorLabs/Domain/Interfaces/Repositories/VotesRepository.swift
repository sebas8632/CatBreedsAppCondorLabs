//
//  VotesRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

protocol VotesRepository {
    
    func postVote(imageId: String, vote: VoteEnum, completion: @escaping ((NetworkResponse<VoteResponse
        >) -> Void))
}
