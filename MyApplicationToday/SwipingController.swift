//
//  SwipingController.swift
//  MyApplicationToday
//
//  Created by Дмитрий on 17/11/2019.
//  Copyright © 2019 Дмитрий. All rights reserved.
//

import Foundation
import UIKit





class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

//    let imageNames = ["visa_goldcard", "platinum", "classic", "rio"]
//    let headerStrings = ["Фора голд", "Фора платина", "Классик", "РИО"]
    
    
    let pages = [
    Page(imageName: "visa_goldcard", headerText: "Фора голд", bodyText: "Лучшая карта"),
    Page(imageName: "platinum", headerText: "Фора платинa", bodyText: "Лучшая карта"),
    Page(imageName: "classic", headerText: "Классик", bodyText: "Лучшая карта"),
    Page(imageName: "rio", headerText: "РИО",bodyText: "Лучшая карта")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView.register( PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
//        let imageName = pages[indexPath.item]
//        cell.imageView.image = UIImage(named:  imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.imageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
