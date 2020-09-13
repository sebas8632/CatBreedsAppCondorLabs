//
//  BreedDetailViewController.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

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
        self.hideLoading()
        setUpView()
        configTargets()
        getBreedImage()
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
    
    fileprivate func getBreedImage() {
        guard let breed = self.breed else {self.manageError(error: ApplicationError.appError); return}
        viewModel?.breed = breed
        self.showLoading()
        
        viewModel?.getBreedImageURL(completion: { [weak self] (urlImage) in
            DispatchQueue.main.async {
                self?.bindComponents(breed: breed, urlImage: urlImage)

            }

        })
    }
    
    fileprivate func bindComponents(breed: Breed, urlImage: String) {
        breedNameLabel.text = breed.name
        breedOriginLabel.text = breed.origin
        breedDescriptionLabel.text = breed.description
        let url = URL(string: urlImage)
        breedImage.kf.setImage(with: url, placeholder: UIImage(named: ""), options: nil, progressBlock: nil) { (_) in }
        self.hideLoading()
    }

    private func configTargets() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFuncion))
        wikipediaLabel.addGestureRecognizer(tap)
    }
    
    @objc func tapFuncion() {
        guard let breed = self.breed, let url = breed.wikipediaUrl else { self.manageError(error: ApplicationError.appError); return}

        coordinator?.coordinateToWebView(url: url)
    }
}
