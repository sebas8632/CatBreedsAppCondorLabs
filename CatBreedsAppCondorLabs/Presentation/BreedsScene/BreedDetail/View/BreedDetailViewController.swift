//
//  BreedDetailViewController.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

class BreedDetailViewController: UIViewController {

    unowned var breedDetailView: BreedDetailView { return self.view as! BreedDetailView }
    unowned var breedImage: UIImageView { return breedDetailView.breedImage }
    unowned var breedNameLabel: UILabel { return breedDetailView.breedNameLabel }
    unowned var breedOriginLabel: UILabel { return breedDetailView.breedOriginLabel }
    unowned var breedDescriptionLabel: UILabel { return breedDetailView.descriptionLabel }
    unowned var wikipediaLabel: UILabel { return breedDetailView.wikiPediaLabel }

    var coordinator: BreedDetailCoordinator?
    var viewModel: BreedDetailViewModel?
    
    var breed: Breed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false

    }
        override func loadView() {
            self.view = BreedDetailView(frame: UIScreen.main.bounds)
        }
        
        private func setUpView() {
            self.title = "Breed Detail"
            
        }
    
    

}
