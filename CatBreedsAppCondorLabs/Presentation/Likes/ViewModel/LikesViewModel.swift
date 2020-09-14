//
//  LikesViewModel.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

protocol LikesViewModelDelegate {
    func showImage(url: String)
}


class LikesViewModel {
    
    private var fetchBreedImagesRandomUseCase: FetchBreedImagesRandomUseCase
    private var saveVoteUseCase: SaveVoteUseCase
    
    var errorManager: ErrorManagerProtocol?
    var delegate: LikesViewModelDelegate?
    
    var imageId: String?
    
    init(fetchBreedImagesRandomUseCase: FetchBreedImagesRandomUseCase, saveVoteUseCase: SaveVoteUseCase) {
        self.fetchBreedImagesRandomUseCase = fetchBreedImagesRandomUseCase
        self.saveVoteUseCase = saveVoteUseCase
    }
}

extension LikesViewModel {
    
    func getImagesRandom() {
        didFetchImagesRandom { [weak self] (result) in
            
            guard let strongSelf = self else { self?.errorManager?.manageError(error: ApplicationError.appError); return}
            
            switch result {
            case .success(let breedsImages):
                strongSelf.imageId = breedsImages.first?.id
                strongSelf.delegate?.showImage(url: breedsImages.first!.imageUrl)
                break
            case .failure(let error):
                strongSelf.errorManager?.manageError(error: error)
                break
            }
        }
    }
    
    func didFetchImagesRandom(completion: @escaping ((Response<[BreedImage]>)-> Void)) {
        fetchBreedImagesRandomUseCase.execute(completion: completion)
    }
    
    private func saveVote(id: String, vote: VoteEnum, completion: @escaping ((Response<VoteResponse>)-> Void)) {
        saveVoteUseCase.imageId = id
        saveVoteUseCase.vote = vote
        
        saveVoteUseCase.execute(completion: completion)
    }
    
    func vote( vote: VoteEnum) {
        saveVote(id: self.imageId!, vote: vote) {[weak self] (result) in
            
            guard let strongSelf = self else { self?.errorManager?.manageError(error: ApplicationError.appError); return}
            switch result {
                
            case .success(_):
                strongSelf.getImagesRandom()
            case .failure(let error):
                strongSelf.errorManager?.manageError(error: error)
                
                
            }
        }
    }
    
}
