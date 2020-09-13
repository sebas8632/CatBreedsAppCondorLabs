//
//  BreedsListView.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

class BreedsListView: UIView {
    
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
            tableView.register(BreedTableViewCell.self, forCellReuseIdentifier: "BreedTableViewCell")
            self.addSubview(viewIntroduction)
            self.addSubview(tableView)
            viewIntroduction.addSubview(titleIntroductionLabel)
            viewIntroduction.addSubview(descriptionIntroductionLabel)
            
        }
        
        private func constraintConfig() {
            viewIntroductionConstraint()
            tableViewConstraint()
            titleIntroductionConstraint()
            descriptionIntroductionConstraint()
        }
        
        //MARK: Constraints
        
    private func viewIntroductionConstraint() {
        viewIntroduction.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewIntroduction.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            viewIntroduction.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            viewIntroduction.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewIntroduction.bottomAnchor.constraint(equalTo: descriptionIntroductionLabel.bottomAnchor, constant: 16)
        ])
    }
    
    private func titleIntroductionConstraint() {
        titleIntroductionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleIntroductionLabel.topAnchor.constraint(equalTo: viewIntroduction.topAnchor, constant: 16),
            titleIntroductionLabel.leadingAnchor.constraint(equalTo: viewIntroduction.leadingAnchor, constant: 16),
            titleIntroductionLabel.trailingAnchor.constraint(equalTo: viewIntroduction.trailingAnchor, constant: -16)
        ])
    }
    
    private func descriptionIntroductionConstraint() {
        descriptionIntroductionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionIntroductionLabel.topAnchor.constraint(equalTo: titleIntroductionLabel.bottomAnchor, constant: 8),
            descriptionIntroductionLabel.leadingAnchor.constraint(equalTo: viewIntroduction.leadingAnchor, constant: 16),
            descriptionIntroductionLabel.trailingAnchor.constraint(equalTo: viewIntroduction.trailingAnchor, constant: -16)
        ])
    }
    
    private func tableViewConstraint() {
    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: viewIntroduction.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    //MARK: Components
    
    lazy var viewIntroduction: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var titleIntroductionLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "¡WELCOME!"
        return label
    }()
    
    lazy var descriptionIntroductionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "This is an app where you can find a lot differents breeds and know them deeply."
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()

}

