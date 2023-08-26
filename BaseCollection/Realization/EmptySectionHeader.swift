//
//  EmptySectionHeader.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

class EmptySectionHeader: UICollectionReusableView, SectionHeader {
    func setup(with data: String?) -> Self {
        self
    }

    static func size(for data: String?, width: CGFloat) -> CGSize {
        .zero
    }
}
