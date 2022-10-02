//
//  APIService.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import Foundation

class APIService {
    let api: GraphQLAPI = GraphQLAPI()
    
    func listProducts() async -> [Product] {
        return (
            try? await self.api.performOperation(GraphQLOperation.LIST_PRODUCTS)
        ) ?? []
    }
}
