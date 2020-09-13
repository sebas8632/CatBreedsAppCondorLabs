//
//  BreedDetailCoordinator.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit
protocol BackToBreedsListFlow {
    func backToBreedsList()
}

class BreedDetailCoordinator: Coordinator {

    let navigationController: UINavigationController?
    let diContainer: AppDIContainer
    
    var breed: Breed?
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
        
    }

    func start() {
        let breedDetailViewController = BreedDetailViewController()
        
        breedDetailViewController.breed = self.breed
        breedDetailViewController.coordinator = self
        breedDetailViewController.viewModel = diContainer.makeBreedDetailViewModel()
        
        navigationController?.pushViewController(breedDetailViewController, animated: false)
    }
}

extension BreedDetailCoordinator: BackToBreedsListFlow {
    
    func backToBreedsList() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
