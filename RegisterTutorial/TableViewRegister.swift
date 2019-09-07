//
//  TableViewRegister.swift
//  RegisterTutorial
//
//  Created by Rennan Rebouças on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

class TableViewRegister: UIView {
    
    
    // MARK: Properties
    let tableviewR: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupTableView()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Functions
    func setupTableView()  {
        addSubViews([tableviewR])
        addConstraintsRegisterView()
        tableviewR.register(TableViewCellRegister.self, forCellReuseIdentifier: "cell")
    }
    func addConstraintsRegisterView()  {
        NSLayoutConstraint.activate([
            tableviewR.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableviewR.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableviewR.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableviewR.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        
    }
    
}


extension UIView {
    func addSubViews(_ views : [UIView]){
        views.forEach { (view) in
            addSubview(view)
        }
    }
}
