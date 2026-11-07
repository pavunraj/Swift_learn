//
//  APIEndPoints.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation

enum APIEndPoints {
    
    var url: URL? {
        URL(string: "")
    }
    case productlist
    
    var path: String {
        switch self {
        case .productlist:
            "productlist"
        }
    }
    var httpMethod: HTTPMethod {
        switch self {
        case .productlist:
                .get
        }
    }
}
