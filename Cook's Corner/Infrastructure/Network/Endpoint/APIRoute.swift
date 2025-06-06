//
//  APIRoute.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation

public enum APIRoute: Endpoint {
    case searchMealByName(name: String)
    case getCategories
    case getMealsByCategory(category: String)

    public var baseURL: String {
        "https://www.themealdb.com/api/json/v1/1"
    }

    public var path: String {
        switch self {
        case .searchMealByName:
            return "/search.php"
        case .getCategories:
            return "/categories.php"
        case .getMealsByCategory:
            return "/filter.php"
        }
    }
    
    public var method: HTTPMethodType {
        switch self {
        case .getCategories, .getMealsByCategory , .searchMealByName: .get
        }
    }

    public var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }

    public var parameters: [String : Any]? {
        switch self {
        case .searchMealByName(let name):
            return ["s": name]
        case .getMealsByCategory(let category):
            return ["c": category]
        case .getCategories: return nil
        }
    }
}
