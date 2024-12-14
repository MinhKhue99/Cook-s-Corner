//
//  MealService.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

final class MealService: MealServiceProtocol {
    func getAllCategories() -> AnyPublisher<[Category], any Error> {
        var request = URLRequest(url: Endpoints.getCategories.url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Category].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], any Error> {
        var request = URLRequest(url: Endpoints.getMealsByCategory(category: category).url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Meal].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func searchMeal(name: String) -> AnyPublisher<[Meal], any Error> {
        var request = URLRequest(url: Endpoints.searchMealByName(name: name).url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Meal].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
