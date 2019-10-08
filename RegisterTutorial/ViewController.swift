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
    let mockResult = [(image: #imageLiteral(resourceName: "zelda"), name: "Zelda"), (image: #imageLiteral(resourceName: "epona"), name: "Epona"), (image: #imageLiteral(resourceName: "link"), name: "Link")]
    
    // MARK: Inicialization
    override func viewDidLoad() {
        super.viewDidLoad()
        charCollectionView.delegate = self
        charCollectionView.dataSource = self
        
        setupCollectionViewConstraints()
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CharactersCollectionViewCell
        cell.nameLabel.text = self.mockResult[indexPath.row].name
        cell.charImageView.image = self.mockResult[indexPath.row].image
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

