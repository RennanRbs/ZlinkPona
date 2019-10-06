//
//  ViewController.swift
//  RegisterTutorial
//
//  Created by Rennan Rebouças on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    let tableViewRegister = TableViewRegister()
    var mockResult: [MockCell] = [MockCell(image: #imageLiteral(resourceName: "zelda"), name: "Zelda"),MockCell(image: #imageLiteral(resourceName: "epona"), name: "Epona"),MockCell(image: #imageLiteral(resourceName: "link"), name: "Link")]
    
    // MARK: Inicialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupNavigation()
    }
    
    private func setupTable() {
        tableViewRegister.tableviewR.delegate = self as? UITableViewDelegate
        tableViewRegister.tableviewR.dataSource = self
        tableViewRegister.tableviewR.register(TableViewCellRegister.self, forCellReuseIdentifier: "Cell")
        self.view = self.tableViewRegister
    }
    
    private func setupNavigation() {
        self.title = "Table View"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCellRegister
        cell?.mockField = mockResult[indexPath.row]
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

