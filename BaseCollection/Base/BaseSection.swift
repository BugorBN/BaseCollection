//
//  BaseSection.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

protocol BaseSection {
    var numberOfElements: Int { get }

    func registrate(collectionView: UICollectionView)
    func cell(for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func cellSize(
        for collectionView: UICollectionView,
        layout: UICollectionViewFlowLayout,
        indexPath: IndexPath
    ) -> CGSize
    func header(for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView
    func headerSize(for collectionView: UICollectionView) -> CGSize
    func footer(for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView
    func footerSize(for collectionView: UICollectionView) -> CGSize
    func select(row: Int)
}
