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
            .tryMap { output in
                // Check for a valid HTTP response
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: CategoryResponse.self, decoder: JSONDecoder())
            .map(\.categories) // Extract the categories array
            .eraseToAnyPublisher()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], any Error> {
        var request = URLRequest(url: Endpoints.getMealsByCategory(category: category).url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .map(\.meals)
            .eraseToAnyPublisher()
    }
    
    func searchMeal(name: String) -> AnyPublisher<[Meal], any Error> {
        var request = URLRequest(url: Endpoints.searchMealByName(name: name).url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .map(\.meals)
            .eraseToAnyPublisher()
    }
}
