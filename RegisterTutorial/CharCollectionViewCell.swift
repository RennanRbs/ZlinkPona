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
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var blurView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Char Name"
        label.textColor = .white
        label.textAlignment = .left
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
        self.addSubview(self.charImageView)
        self.charImageView.addSubview(self.blurView)
        self.blurView.addSubview(self.nameLabel)
        setupCellAdjustment()
        self.setupImageViewConstraints()
        self.setupBlurViewConstraints()
        self.setupNameLabelConstraints()
    }
    
    func setupCellAdjustment(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    private func configCollectionCell(){
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
    
    func setupBlurViewConstraints() {
        self.blurView.leadingAnchor.constraint(equalTo: self.charImageView.leadingAnchor).isActive = true
        self.blurView.trailingAnchor.constraint(equalTo: self.charImageView.trailingAnchor).isActive = true
        self.blurView.bottomAnchor.constraint(equalTo: self.charImageView.bottomAnchor).isActive = true
    }
    
    func setupImageViewConstraints() {
        self.charImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.charImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28).isActive = true
        self.charImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.charImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
