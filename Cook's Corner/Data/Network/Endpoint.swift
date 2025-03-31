//
//  Endpoints.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation

enum HTTPMethods: String {
    case GET, POST, PUT, DELETE
}

protocol Endpoint {
    var path: String { get }
    var method: String { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.themealdb.com"
        components.path = "/api/json/v1/1" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            fatalError("Failed to construct URL from components: \(components)")
        }
        return url
    }
}

enum MealEndpoint: Endpoint {
    case searchMealByName(name: String)
    case getCategories
    case getMealsByCategory(category: String)

    var path: String {
        switch self {
        case .searchMealByName:
            return "/search.php"
        case .getCategories:
            return "/categories.php"
        case .getMealsByCategory:
            return "/filter.php"
        }
    }

    var method: String { HTTPMethods.GET.rawValue }
    var headers: [String: String] { ["Content-Type": "application/json"] }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .searchMealByName(let name):
            return [URLQueryItem(name: "s", value: name)]
        case .getMealsByCategory(let category):
            return [URLQueryItem(name: "c", value: category)]
        default:
            return nil
        }
    }

    var body: Data? { nil }
}
