//
//  CharCollectionViewCell.swift
//  RegisterTutorial
//
//  Created by Gabriel Palhares on 08/10/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    


//    \\ MARK: Properties
    lazy var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
//    \\ MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponentsInCell()
        self.configCollectionCell()
        
    }
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not benn implemented")
    }
    

//    \\ MARK: Functions
        func setupComponentsInCell() {
        self.contentView.addSubview(self.charImageView)
        self.contentView.addSubview(self.nameLabel)
        setupCellAdjustment()
        self.setupImageViewConstraints()
        self.setupNameLabelConstraints()
    }
    
    func setupCellAdjustment(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    private func configCollectionCell(){
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    public func setupCell(char: Character) {
        nameLabel.text = char.name
        charImageView.image = char.image
    }
}


extension CharactersCollectionViewCell {
    

    func setupNameLabelConstraints() {
//        self.nameLabel.leadingAnchor.constraint(equalTo: self.blurView.leadingAnchor, constant: 12).isActive = true
//        self.nameLabel.trailingAnchor.constraint(equalTo: self.blurView.trailingAnchor, constant: -12).isActive = true
//        self.nameLabel.centerYAnchor.constraint(equalTo: self.blurView.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
        ])
    }
    
    func setupImageViewConstraints() {
        self.charImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.charImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.charImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.charImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func setupNameLabelConstraints() {
        self.nameLabel.topAnchor.constraint(equalTo: self.charImageView.bottomAnchor, constant: 6).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 6).isActive = true
    }
    
}
