//
//  ViewController.swift
//  BaseCollection
//
//  Created by Boris Bugor on 19/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let sectionView = SectionView()
    
    override func loadView() {
        view = sectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sectionView.backgroundColor = .white
        sectionView.set(itemSpacing: 16)
        sectionView.set(lineSpacing: 16)
        sectionView.set(
            sections: [
                SectionWithoutHeaderFooter<DynamicCollectionCell>(
                    items: [
                        .init(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                        .init(text: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
                        .init(text: "It was popularised"),
                        .init(text: "the 1960s with the release of Letraset sheets containing"),
                        .init(text: "Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    ]
                ),
                SectionWithoutHeaderFooter<ColorCollectionCell>(
                    items: [
                        .init(color: .blue) {
                            print(#function)
                        },
                        .init(color: .red) {
                            print(#function)
                        },
                        .init(color: .yellow) {
                            print(#function)
                        },
                        .init(color: .green) {
                            print(#function)
                        },
                        .init(color: .blue) {
                            print(#function)
                        }
                    ]
                )
            ],
            append: false
        )
    }
}

class ColorCollectionCell: UICollectionViewCell, SectionCell {
    func setup(with data: ColorCollectionCellData) -> Self {
        contentView.backgroundColor = data.color
        
        return self
    }

    static func size(for data: ColorCollectionCellData, width: CGFloat) -> CGSize {
        .init(width: width / 2, height: width / 2)
    }
}

class ColorCollectionCellData: SectionCellData {
    let onSelect: VoidClosure?
    let color: UIColor
    
    init(color: UIColor, onSelect: VoidClosure? = nil) {
        self.onSelect = onSelect
        self.color = color
    }
}

class DynamicCollectionCell: UICollectionViewCell, DynamicSectionCell {
    let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(textLabel)
        textLabel.numberOfLines = .zero
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }

    func setup(with data: DynamicCollectionCellData) -> Self {
        textLabel.text = data.text
        
        return self
    }
}

class DynamicCollectionCellData: SectionCellData {
    let text: String
    var onSelect: VoidClosure?
    
    init(text: String) {
        self.text = text
    }
}
