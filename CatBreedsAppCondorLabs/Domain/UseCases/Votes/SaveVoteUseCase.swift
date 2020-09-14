//
//  SaveVoteUseCase.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class SaveVoteUseCase {
    
    private let votesRepository: VotesRepository
    
    var imageId: String?
    var vote: VoteEnum?
    
    init(votesRepository: VotesRepository) {
        self.votesRepository = votesRepository
    }
    
}

extension SaveVoteUseCase: UseCase {
    
    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        votesRepository.postVote(imageId: self.imageId!, vote: self.vote!) { (result) in
            switch result {
            case .success(let voteResponse):
                completion(.success(voteResponse as! T))
            case .failure(let networkError):
                completion(.failure(ApplicationError.networkError(networkError: networkError.rawValue)))
            }
        }
    }
}
