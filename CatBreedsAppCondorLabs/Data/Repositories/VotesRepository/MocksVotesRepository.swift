//
//  MocksVotesRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
#if MOCKS
class MocksVotesRepository: VotesRepository {
    
    func postVote(imageId: String, vote: VoteEnum, completion: @escaping ((NetworkResponse<VoteResponse>) -> Void)) {
        if imageId != "qqaqaqaqa" {
            let voteResponse = VoteResponse(id: 1)
            completion(.success(voteResponse))
        } else {
            completion(.failure(NetworkError.serverError))
        }
    }
    
    
}

#endif
