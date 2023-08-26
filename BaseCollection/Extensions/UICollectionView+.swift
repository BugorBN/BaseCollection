//
//  UICollectionView+.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeue<T: UICollectionViewCell>(_ cellClass: T.Type, indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as? T
    }
    
    func registerHeader<T: UICollectionReusableView>(_ headerClass: T.Type) {
        register(headerClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: headerClass))
    }
    
    func registerFooter<T: UICollectionReusableView>(_ footerClass: T.Type) {
        register(footerClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: footerClass))
    }
    
    func dequeueHeader<T: UICollectionReusableView>(_ headerClass: T.Type, indexPath: IndexPath) -> T? {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: headerClass), for: indexPath) as? T
    }
    
    func dequeueFooter<T: UICollectionReusableView>(_ footerClass: T.Type, indexPath: IndexPath) -> T? {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: footerClass), for: indexPath) as? T
    }
}
