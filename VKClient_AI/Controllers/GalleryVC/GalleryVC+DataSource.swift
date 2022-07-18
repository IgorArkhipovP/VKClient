//
//  GalleryVC+DataSource.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.11.2021.
//

import UIKit

extension GalleryVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoFriendsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reUseIdentifier, for: indexPath) as? GalleryCell else {return UICollectionViewCell()}
        cell.configure(image: UIImage(named: photoFriendsArray[indexPath.item]), index: indexPath.item)
        return cell
    }
    

}
