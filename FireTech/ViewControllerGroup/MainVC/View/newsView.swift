//
//  newsView.swift
//  FireTech
//
//  Created by Павел Уланов on 09.02.2023.
//

import Foundation
import UIKit
//Класс с настройками UICollectionView
class newsCollectionClass: UICollectionView {
    init() {
        let layoutCollection = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layoutCollection)
        backgroundColor = .clear
        layoutCollection.scrollDirection = .vertical
        //-
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        //
        //        register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.cellID )
        //        translatesAutoresizingMaskIntoConstraints = false
        //        layautCollectionView.minimumLineSpacing = 20
        //        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//Класс с настройками UICollectionViewCell
class newsCellClass: UICollectionViewCell {
    
}
//Настройки UICollectionView на основном контроллере
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
