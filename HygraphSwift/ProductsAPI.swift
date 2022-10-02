//
//  ProductsAPI.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import Foundation

extension GraphQLOperation {
    static var LIST_PRODUCTS: Self {
        GraphQLOperation(
                    """
                        {
                            products {
                                id
                                name
                                description
                                price
                            }
                        }
                    """
        )
    }
}
