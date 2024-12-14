//
//  Endpoints.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation

enum HTTPMethods: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum Endpoints {
    static let base = "https://www.themealdb.com/api/json/v1/1"
    static let searchMealEndPoint = "\(Endpoints.base)/search.php?s="
    static let getCategoriesEndpoint = "\(Endpoints.base)/categories"
    static let getMealsByCategoryEndpoint = "\(Endpoints.base)/filter.php?c="
    case searchMealByName(name: String)
    case getCategories
    case getMealsByCategory(category: String)

    var value: String {
        switch self {
        case .searchMealByName(let name):
            return "\(Endpoints.searchMealEndPoint)\(name)"
        case .getCategories:
            return "\(Endpoints.getCategoriesEndpoint).php"
        case .getMealsByCategory(let category):
            return "\(Endpoints.getMealsByCategoryEndpoint)\(category)"
        }
    }

    var url: URL {
        return URL(string: value)!
    }
}
