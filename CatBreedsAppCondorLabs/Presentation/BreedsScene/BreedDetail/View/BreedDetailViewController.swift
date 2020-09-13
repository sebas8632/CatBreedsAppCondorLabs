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
    
    func cerrar() {
        coordinator?.backToBreedsList()
    }
    
        override func loadView() {
            self.view = BreedDetailView(frame: UIScreen.main.bounds)
        }
        
        private func setUpView() {
            self.title = "Breed Detail"
        }
    
    

}
