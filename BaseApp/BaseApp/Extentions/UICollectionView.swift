//
//  UICollectionView.swift
//  Guncha
//
//  Created by Shirin on 2/10/23.
//

import UIKit.UICollectionView

extension UICollectionView {
    convenience init( scrollDirection: ScrollDirection,
                      itemSize: CGSize? = nil,
                      estimatedItemSize: CGSize = CGSize(width: 200, height: 200),
                      minimumLineSpacing: CGFloat = 0,
                      minimumInteritemSpacing: CGFloat = 0,
                      contentInsets: UIEdgeInsets = .zero,
                      backgroundColor: UIColor = .clear,
                      isPagingEnabled: Bool = false) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.scrollDirection = scrollDirection
        layout.itemSize = itemSize ?? UICollectionViewFlowLayout.automaticSize
        if itemSize == nil {
            layout.estimatedItemSize = estimatedItemSize
        }
        
        self.init(frame: .zero, collectionViewLayout: layout)
        self.contentInset = contentInsets
        self.backgroundColor = backgroundColor
        self.isPagingEnabled = isPagingEnabled
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
}
