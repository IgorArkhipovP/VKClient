//
//  GalleryVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.11.2021.
//

import UIKit

class GalleryVC: UIViewController{
    
    @IBOutlet var collectionGalleryView: UICollectionView!
    
    var photoFriendsArray = ["robin", "robin2", "robin3", "robin4"]
    let reUseIdentifier = "reUseIdentifier"
    let toPhotoVC = "toPhotoVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionGalleryView.dataSource = self
        collectionGalleryView.delegate = self
        collectionGalleryView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: reUseIdentifier)
    }
    
}



