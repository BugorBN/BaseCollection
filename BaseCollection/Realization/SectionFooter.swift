//
//  SectionFooter.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

protocol SectionFooter: UICollectionReusableView {
    associatedtype FooterData
    
    func setup(with data: FooterData?) -> Self
    static func size(for data: FooterData?, width: CGFloat) -> CGSize
}
