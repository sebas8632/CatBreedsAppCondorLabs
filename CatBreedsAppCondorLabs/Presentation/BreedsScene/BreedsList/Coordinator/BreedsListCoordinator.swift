//
//  BreedsListCoordinator.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

protocol BreedsListFlow: class {
    func coordinateToBreedDetail(breed: Breed)
}

class BreedsListCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let diContainer: AppDIContainer
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let breedsListViewController = BreedsListViewController()
        breedsListViewController.coordinator = self
        breedsListViewController.viewModel = diContainer.makeBreedsListViewModel()
        
        navigationController.pushViewController(breedsListViewController, animated: false)
    }
 
}

extension BreedsListCoordinator: BreedsListFlow {
    func coordinateToBreedDetail(breed: Breed) {
 
    }
    
    
}
