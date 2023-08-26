//
//  SectionHeader.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

protocol SectionHeader: UICollectionReusableView {
    associatedtype HeaderData
    
    func setup(with data: HeaderData?) -> Self
    static func size(for data: HeaderData?, width: CGFloat) -> CGSize
}
