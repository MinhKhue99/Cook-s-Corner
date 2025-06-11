//
//  Endpoint.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation

public enum HTTPMethodType: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
