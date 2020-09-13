//
//  BreedTableViewCell.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

class BreedTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var breed: Breed? {
        didSet {
            breedTitle.text = breed?.name
            breedOrigin.text = breed?.origin
        }
    }
    
    private lazy var breedTitle: UILabel = {
        let label = UILabel()
        
        label.text = "PRUEBA"
        return label
    }()
    
    private lazy var breedOrigin: UILabel = {
        let label = UILabel()
        label.text = "Colombia"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
}

extension BreedTableViewCell {
    
    private func setUpUI() {
        addSubview(breedTitle)
        addSubview(breedOrigin)
    }
    
    private func setUpConstraints() {
        breedTitleConstraint()
        breedOriginConstraint()
    }
    
    private func breedTitleConstraint() {
        breedTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            breedTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            breedTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
    
    private func breedOriginConstraint() {
        breedOrigin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedOrigin.topAnchor.constraint(equalTo: breedTitle.bottomAnchor, constant: 8),
            breedOrigin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            breedOrigin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
}

