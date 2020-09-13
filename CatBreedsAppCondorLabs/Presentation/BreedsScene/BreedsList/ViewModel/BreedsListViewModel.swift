//
//  BreedsListViewModel.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

protocol BreedsListViewModelDelegate {
    func reloadData()
    func manageError(error: ApplicationError)
}

class BreedsListViewModel {
    
    var fetchBreedsUseCase: FetchBreedsUseCase
    var delegate: BreedsListViewModelDelegate?
    
    var breeds: [Breed] = []
    init(fetchBreedsUseCase: FetchBreedsUseCase) {
        self.fetchBreedsUseCase = fetchBreedsUseCase
    }
}

extension BreedsListViewModel {
    
    func getBreeds() {
        self.didFetchBreeds { [weak self] (result) in
            guard let strongSelf = self, let delegate = strongSelf.delegate else { self?.delegate?.manageError(error: ApplicationError.appError); return}
            
            switch result {
            case .success(let breeds):
                strongSelf.breeds = breeds
                delegate.reloadData()
            case .failure(let error):
                delegate.manageError(error: ApplicationError.networkError(networkError: error.localizedDescription))
            }
        }
    }
    
   private func didFetchBreeds(completion: @escaping ((Response<[Breed]>)-> Void)) {
        fetchBreedsUseCase.execute(completion: completion)
    }
}
