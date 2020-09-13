//
//  BreedDetailView.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

import UIKit

class BreedDetailView: UIView {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewConfig()
        constraintConfig()
    }
    
    private func viewConfig() {
        self.backgroundColor = UIColor.white
        addSubview(breedName)
        addSubview(breedImage)
        addSubview(infoView)
    }
    
    private func constraintConfig() {
        breedNameConstraint()
        breedImageConstraint()
        infoViewConstraint()
    }
    
    //MARK: - Constraints
    
    private func breedNameConstraint() {
        breedName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            breedName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            breedName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    private func breedImageConstraint() {
        breedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedImage.topAnchor.constraint(equalTo: breedName.bottomAnchor, constant: 16),
            breedImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            breedImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            breedImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func infoViewConstraint() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: breedImage.bottomAnchor, constant: 16),
            infoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            infoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            infoView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    //MARK: - Components
    
    lazy var breedName: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.text = "BREED NAME"
        
        return label
    }()
    
    lazy var breedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .checkmark
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

}
