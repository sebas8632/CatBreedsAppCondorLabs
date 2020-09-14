//
//  DefaultVotesRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class DefaultVotesRepository: VotesRepository {
    
    let sessionProvider: URLSessionProvider
    
    init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }
    
    func postVote(imageId: String, vote: VoteEnum, completion: @escaping ((NetworkResponse<VoteResponse>) -> Void)) {
        sessionProvider.request(type: VoteResponse.self, service: PostVoteService.vote(id: imageId, vote: vote), completion: completion)
    }
}



