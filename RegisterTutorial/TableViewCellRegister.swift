//
//  TableViewCellRegister.swift
//  RegisterTutorial
//
//  Created by Rennan Rebouças on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

class TableViewCellRegister: UITableViewCell {
    
    // MARK: Properties
    let imageIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    let labelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var mockField: MockCell? {
        didSet {
            if let mock = mockField {
                labelCell.text = mock.name
                imageIcon.image = mock.image
            }
        }}
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    convenience init(name: String, image: UIImage){
        self.init()
        self.labelCell.text = name
        self.imageIcon.image = image
    }
    
    
    // MARK: Functions
    func setup(){
        addItensOnCell()
    }
    
    func addItensOnCell(){
        addSubViews([labelCell,imageIcon])
        
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageIcon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageIcon.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageIcon.heightAnchor.constraint(equalToConstant: 50),
            imageIcon.widthAnchor.constraint(equalToConstant: 50),
            
            labelCell.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor),
            labelCell.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            labelCell.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            ])
    }
}
