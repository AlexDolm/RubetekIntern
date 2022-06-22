//
//  ExtensionsForCollectionViewDataSource.swift
//  RubetekIntern
//
//  Created by mac on 22.06.2022.
//

import Foundation
import UIKit
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ExCell
        //cell?.update(by: <#T##DataDoors#>)
        return cell!
    }



}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 70.0, height: 80.0)
    }


}


