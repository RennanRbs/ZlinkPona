//
//  RegisterCollectionViewController.swift
//  RegisterTutorial
//
//  Created by Jamile Loureiro on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

class RegisterCollectionViewController: UIViewController {
    
    // MARK: Properties
    let charCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension UIView {
    func addSubViews(_ views : [UIView]){
        views.forEach { (view) in
            addSubview(view)
        }
    }
}
