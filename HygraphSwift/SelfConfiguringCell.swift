//
//  SelfConfiguringCell.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifier: String {get}
    func configure(with product: Product)
}
