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
        
        addSubview(breedImage)
        addSubview(imageInfoView)
        imageInfoView.addSubview(breedNameLabel)
        imageInfoView.addSubview(breedOriginLabel)
        addSubview(infoView)
        infoView.addSubview(descriptionLabel)
        infoView.addSubview(wikiPediaLabel)
        
    }
    
    private func constraintConfig() {
        breedImageConstraint()
        imageInfoViewConstraint()
        breedNameConstraint()
        breedOriginConstraint()
        infoViewConstraint()
        descriptionLabelConstraint()
        wikipediaLabelConstraint()
    }
    
    //MARK: - Constraints
    
    private func breedNameConstraint() {
        breedNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedNameLabel.topAnchor.constraint(equalTo: imageInfoView.topAnchor, constant: 16),
            breedNameLabel.leadingAnchor.constraint(equalTo: imageInfoView.leadingAnchor, constant: 16),
            breedNameLabel.trailingAnchor.constraint(equalTo: imageInfoView.trailingAnchor, constant: -16)
        ])
    }
    
    private func breedOriginConstraint() {
        breedOriginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedOriginLabel.topAnchor.constraint(equalTo: breedNameLabel.bottomAnchor, constant: 4),
            breedOriginLabel.leadingAnchor.constraint(equalTo: imageInfoView.leadingAnchor, constant: 16),
            breedOriginLabel.trailingAnchor.constraint(equalTo: imageInfoView.trailingAnchor, constant: -16)
        ])
    }
    
    private func breedImageConstraint() {
        breedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            breedImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            breedImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            breedImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func imageInfoViewConstraint() {
        imageInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageInfoView.leadingAnchor.constraint(equalTo: breedImage.leadingAnchor, constant: 0),
            imageInfoView.trailingAnchor.constraint(equalTo: breedImage.trailingAnchor, constant: 0),
            imageInfoView.bottomAnchor.constraint(equalTo: breedImage.bottomAnchor, constant: 0),
            imageInfoView.heightAnchor.constraint(equalToConstant: 85)
            
            
        ])
    }
    
    private func infoViewConstraint() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: breedImage.bottomAnchor, constant: 8),
            infoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            infoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            infoView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    private func descriptionLabelConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -8)
        ])
    }
    
    private func wikipediaLabelConstraint() {
        wikiPediaLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wikiPediaLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor, constant: 0),
            wikiPediaLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -8)
        ])
    }
    
    //MARK: - Components
    
    lazy var breedNameLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.text = "BREED NAME"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var breedOriginLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.text = "Colombia"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        
        
        return label
    }()
    
    lazy var breedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .checkmark
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var imageInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
        return view
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.text = "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it."
        
        return label
    }()
    
    lazy var wikiPediaLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.textColor = .systemBlue
        label.text = "More info on Wikipedia..."
        
        return label
    }()
    
    
    
}
