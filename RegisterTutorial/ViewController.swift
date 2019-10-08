//
//  ViewController.swift
//  RegisterTutorial
//
//  Created by Rennan Rebouças on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: Properties
    let tableViewRegister = TableViewRegister()
    var mockResult: [MockCell] = [MockCell(image: #imageLiteral(resourceName: "zelda"), name: "Zelda"),MockCell(image: #imageLiteral(resourceName: "epona"), name: "Epona"),MockCell(image: #imageLiteral(resourceName: "link"), name: "Link")]
    var filteredsMock: [MockCell] = []
    
    // MARK: Inicialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupNavigation()
        setupSearchController()
    }
    
    private func setupTable() {
        tableViewRegister.tableviewR.delegate = self as? UITableViewDelegate
        tableViewRegister.tableviewR.dataSource = self
        tableViewRegister.tableviewR.register(TableViewCellRegister.self, forCellReuseIdentifier: "Cell")
        self.view = self.tableViewRegister
    }
    
    private func setupSearchController() {
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupNavigation() {
        self.title = "Table View"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }
    
    // MARK: - Private instance methods
      
    func searchBarIsEmpty() -> Bool {
      // Returns true if the text is empty or nil
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
      return searchController.isActive && !searchBarIsEmpty()
    }
      
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
      filteredsMock = mockResult.filter({( mock : MockCell) -> Bool in
        return mock.name.lowercased().contains(searchText.lowercased())
      })

      tableViewRegister.tableviewR.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
          return filteredsMock.count
        }
        
        return mockResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCellRegister
        let mock: MockCell
        if isFiltering() {
            mock = filteredsMock[indexPath.row]
        } else {
            mock = mockResult[indexPath.row]
        }
        cell?.mockField = mock
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.mockResult.remove(at: indexPath.row)
            self.tableViewRegister.tableviewR.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension ViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
  }
}
