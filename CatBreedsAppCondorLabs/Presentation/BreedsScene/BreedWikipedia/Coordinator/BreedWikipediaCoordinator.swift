//
//  BreedWikipediaCoordinator.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit
class BreedWikipediaCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    var urlWikipedia: String?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let breedWikipediaViewController = BreedWikipediaViewController()
        breedWikipediaViewController.coordinator = self
        breedWikipediaViewController.urlWikipedia = self.urlWikipedia
        navigationController.pushViewController(breedWikipediaViewController, animated: false)
    }
    
    
}
