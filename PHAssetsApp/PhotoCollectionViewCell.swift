//
//  PhotoCollectionViewCell.swift
//  PHAssetsApp
//
//  Created by Pavlo Novak on 4/19/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit
import Photos

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func prepareCell(asset: PHAsset) {
        print(asset.localIdentifier)
        
        PHImageManager.default().requestImage(
            for: asset,
            targetSize: imageView.frame.size,
            contentMode: .aspectFill,
            options: nil) { (image, _) -> Void in
                self.imageView.image = image
        }
    }
}
