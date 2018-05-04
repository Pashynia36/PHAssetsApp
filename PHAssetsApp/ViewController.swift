//
//  ViewController.swift
//  PHAssetsApp
//
//  Created by Pavlo Novak on 4/19/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var assets: PHFetchResult<PHAsset>? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchMyAssets()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return assets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
        cell?.prepareCell(asset: assets![indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func fetchMyAssets() {
        
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        assets = PHAsset.fetchAssets(with: options)
    }
}

