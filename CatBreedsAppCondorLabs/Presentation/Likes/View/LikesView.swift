//
//  LikesView.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import UIKit

class LikesView: UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewConfig()
        constraintConfig()
    }
    
    
    private func viewConfig() {
        self.backgroundColor = .white
        addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(unlikeImage)
        stackView.addArrangedSubview(likeImage)
        
    }
    
    private func constraintConfig() {
        contentViewConstraint()
        imageViewConstraint()
        stackViewConstraint()
    }
    
    //MARK: Constraints
    
    private func contentViewConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    private func imageViewConstraint() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func stackViewConstraint() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:-16)
            
            
        ])
    }
    
    //MARK: Components
    
    lazy var contentView: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .lightGray
        return view
        
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .strokedCheckmark
        
        
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var unlikeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "unlikeFilled")
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.tintColor = .orange
        imageView.isUserInteractionEnabled = true
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
     
        return imageView
    }()
    
    lazy var likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "likeFilled")
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.tintColor = .orange
        imageView.isUserInteractionEnabled = true
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
}
