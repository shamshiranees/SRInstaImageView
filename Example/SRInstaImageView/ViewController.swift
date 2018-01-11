//
//  ViewController.swift
//  instagramView
//
//  Created by Shamshir on 10/01/18.
//  Copyright © 2018 shamshir. All rights reserved.
//

import UIKit
import SRInstaImageView


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        if indexPath.row > 8{
            cell.photoImageView.image = UIImage(named: "\(indexPath.row-8)")
            cell.photoImageView.iconImage = UIImage(named: "\(indexPath.row-8)")!
        }else{
            cell.photoImageView.image = UIImage(named: "\(indexPath.row+1)")
            cell.photoImageView.iconImage = UIImage(named: "\(indexPath.row+1)")!
        }
        
        cell.photoImageView.mainTitle = "Image Title \(indexPath.row+1)"
        cell.photoImageView.subTitle = "Image Subtitle \(indexPath.row+1)"
        cell.photoImageView.collectionView = collectionView
        cell.photoImageView.indexPathOFCell = indexPath
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: (collectionView.frame.size.width-2)/3, height: (collectionView.frame.size.width-2)/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
}

