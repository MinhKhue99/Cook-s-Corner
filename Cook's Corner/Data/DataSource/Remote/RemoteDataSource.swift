//
//  RemoteDataSource.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation
import Combine

protocol RemoteDataSourceProtocol {
    func getAllCategories() -> AnyPublisher<[Category], Error>
    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], Error>
    func searchMeal(name: String) -> AnyPublisher<[Meal], Error>
}

class RemoteDataSource: RemoteDataSourceProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getAllCategories() -> AnyPublisher<[Category], any Error> {
        networkService.request(APIRoute.getCategories, responseType: CategoryResponse.self)
            .map { $0.categories.map { $0.toDoMain() } }
            .mapError { $0 as Error}
            .eraseToAnyPublisher()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], any Error> {
        networkService.request(APIRoute.getMealsByCategory(category: category), responseType: MealResponse.self)
            .map {$0.meals.map { $0.toDoMain() } }
            .mapError { $0 as Error}
            .eraseToAnyPublisher()
    }

    func searchMeal(name: String) -> AnyPublisher<[Meal], any Error> {
        networkService.request(APIRoute.searchMealByName(name: name), responseType: MealResponse.self)
            .map {$0.meals.map { $0.toDoMain() } }
            .mapError { $0 as Error}
            .eraseToAnyPublisher()
    }
}
