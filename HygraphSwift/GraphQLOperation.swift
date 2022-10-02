//
//  GraphQLOperation.swift
//  HygraphSwift
//
//  Created by Imran razak on 29/09/2022.
//

import Foundation

struct GraphQLOperation : Encodable {
    var operationString: String
    
    private let url = URL(string: "https://api-eu-central-1.hygraph.com/v2/ck8sn5tnf01gc01z89dbc7s0o/master")!
    
    enum CodingKeys: String, CodingKey {
        case variables
        case query
    }
    
    init(_ operationString: String) {
        self.operationString = operationString
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(operationString, forKey: .query)
    }
    
    func getURLRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(self)
    
        return request
    }
}
