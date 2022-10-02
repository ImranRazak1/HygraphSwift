//
//  ListCell.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import Foundation
import UIKit

class ListCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseIdentifier: String = "ListCell"
    
    let name = UILabel()
    let price = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        name.font = UIFont.preferredFont(forTextStyle: .title2)
        name.textColor =  .label
        
        price.font = UIFont.preferredFont(forTextStyle: .caption1)
        price.textColor = .blue
        
        
        let stackView = UIStackView(arrangedSubviews: [name, price])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment =  .leading
        stackView.spacing =  20
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        
        ])
    }
    
    func configure(with product: Product) {
        name.text = product.name
        price.text = String(product.price)
    }
    
    required init?(coder: NSCoder) {
        fatalError("This isnt working")
    }
    
}
