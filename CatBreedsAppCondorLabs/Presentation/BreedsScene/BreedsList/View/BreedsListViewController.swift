//
//  BreedsListViewController.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

class BreedsListViewController: UIViewController {
    
    unowned  var breedsListView: BreedsListView { return self.view as! BreedsListView }
    unowned var tableView: UITableView {return breedsListView.tableView}
   
    var coordinator: BreedsListCoordinator?
    var viewModel: BreedsListViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.breedsListView.tableView.dataSource = self
        self.breedsListView.tableView.delegate = self
        viewModel?.delegate = self
        fetchBreeds()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true

    }
    
    override func loadView() {
        self.view = BreedsListView(frame: UIScreen.main.bounds)
    }
    
    private func setupUI() {
        self.title = "Breeds list"
    }
    
    private func fetchBreeds() {
        showLoading()
        viewModel?.getBreeds()
    }
}

extension BreedsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.breeds.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedTableViewCell", for: indexPath) as! BreedTableViewCell
       
        
        if  let breed = viewModel?.breeds[indexPath.row] {
        cell.breed = Breed(id: breed.id, name: breed.name, origin: breed.origin, wikipediaUrl: breed.wikipediaUrl, description: breed.description)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension BreedsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let breeds = viewModel?.breeds else {errorManager(error: ApplicationError.appError); return }
        let breed = breeds[indexPath.row]
        showLoading()
        coordinator?.coordinateToBreedDetail(breed: breed)
    }
}

extension BreedsListViewController: BreedsListViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.hideLoading()
        }
    }
    
    func manageError(error: ApplicationError) {
        errorManager(error: error)
    }
    
    
}
