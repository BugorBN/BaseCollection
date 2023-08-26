//
//  SectionCell.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

protocol DynamicSectionCell: SectionCell {
    
}

extension DynamicSectionCell {
    static func size(for data: CellData, width: CGFloat) -> CGSize {
        let cell = Self().setup(with: data)
        let size = cell.contentView.systemLayoutSizeFitting(
            .init(width: width, height: .greatestFiniteMagnitude),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return .init(width: width, height: size.height)
    }
}

protocol SectionCell: UICollectionViewCell {
    associatedtype CellData: SectionCellData

    func setup(with data: CellData) -> Self
    static func size(for data: CellData, width: CGFloat) -> CGSize
}

protocol SectionCellData {
    var onSelect: VoidClosure? { get }
}

typealias VoidClosure = () -> Void
