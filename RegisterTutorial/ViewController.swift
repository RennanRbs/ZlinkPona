//
//  ViewController.swift
//  RegisterTutorial
//
//  Created by Rennan Rebouças on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit
  
class ViewController: RegisterCollectionViewController {
    
    // MARK: Properties
    let searchController = UISearchController(searchResultsController: nil)
    let mockResult = [(image: #imageLiteral(resourceName: "zelda"), name: "Zelda"), (image: #imageLiteral(resourceName: "epona"), name: "Epona"), (image: #imageLiteral(resourceName: "link"), name: "Link")]
    var filteredMock: [(UIImage, String)] = []
    
    var isSearchControllerEmpty: Bool {
        return searchController.searchBar.text!.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchControllerEmpty
    }
    
    // MARK: Inicialization
    override func viewDidLoad() {
        super.viewDidLoad()
        charCollectionView.delegate = self
        charCollectionView.dataSource = self
        
        setupCollectionViewConstraints()
        setupSearchController()
    }
    
    private func setupSearchController() {
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Chars"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupNavigation() {
        self.title = "Table View"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }
    
    // MARK: - Private instance method
      
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredMock = mockResult.filter({ (image, name) -> Bool in
            return name.lowercased().contains(searchText.lowercased())
        })
        
        self.charCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredMock.count
        }
        return mockResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CharactersCollectionViewCell
        
        let mock: (image: UIImage, name: String)
        
        if isFiltering {
            mock = mockResult[indexPath.row]
        } else {
            mock = mockResult[indexPath.row]
        }
        
        cell.nameLabel.text = mock.name
        cell.charImageView.image = mock.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10))
        
        return CGSize(width: itemSize, height: itemSize)
    }
    
}

  
extension ViewController {
    
    func setupCollectionViewConstraints() {
        self.view.addSubview(self.charCollectionView)
    
        NSLayoutConstraint.activate([
            charCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            charCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            charCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            charCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
  }
}
