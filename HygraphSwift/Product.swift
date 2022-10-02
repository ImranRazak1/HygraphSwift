//
//  Product.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    let name: String
    let description: String
    let price: Int
}
