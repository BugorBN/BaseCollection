//
//  SectionView.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

class SectionView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.frame = bounds
        addSubview(collectionView)
    }
    
    private(set) var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private var sections: [BaseSection] = []
    
    public func set(sections: [BaseSection], append: Bool) {
        sections.forEach {
            $0.registrate(collectionView: collectionView)
        }
        
        if append {
            self.sections.append(contentsOf: sections)
        } else {
            self.sections = sections
        }
        
        collectionView.reloadData()
    }
    
    public func set(itemSpacing: CGFloat) {
        flowLayout.minimumInteritemSpacing = itemSpacing
    }
    
    public func set(lineSpacing: CGFloat) {
        flowLayout.minimumLineSpacing = lineSpacing
    }
    
    public func set(contentInset: UIEdgeInsets) {
        collectionView.contentInset = contentInset
    }
}

extension SectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfElements
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].cell(for: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        kind == UICollectionView.elementKindSectionHeader
            ? sections[indexPath.section].header(for: collectionView, indexPath: indexPath)
            : sections[indexPath.section].footer(for: collectionView, indexPath: indexPath)
    }
}

extension SectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].select(row: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sections[indexPath.section].cellSize(
            for: collectionView,
            layout: flowLayout,
            indexPath: indexPath
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        sections[section].headerSize(for: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        sections[section].footerSize(for: collectionView)
    }
}
