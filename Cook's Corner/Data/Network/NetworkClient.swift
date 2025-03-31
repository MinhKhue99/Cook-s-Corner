//
//  MealServiceProtocol.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

struct NetworkClient {
    private let apiService: APIService

    init(apiService: APIService) {
        self.apiService = apiService
    }

    func getAllCategories() -> AnyPublisher<[CategoryEntity], Error> {
        apiService.request(MealEndpoint.getCategories)
            .map {(response: CategoryResponse) in response.categories.map {MealMapper.toDoMain($0)}}
            .eraseToAnyPublisher()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<[MealEntity], Error> {
        apiService.request(MealEndpoint.getMealsByCategory(category: category))
            .map {(response: MealResponse) in response.meals.map {MealMapper.toDoMain($0)}}
            .eraseToAnyPublisher()
    }

    func searchMeal(name: String) -> AnyPublisher<[MealEntity], Error> {
        apiService.request(MealEndpoint.searchMealByName(name: name))
            .map {(response: MealResponse) in response.meals.map {MealMapper.toDoMain($0)}}
            .eraseToAnyPublisher()
    }
}
