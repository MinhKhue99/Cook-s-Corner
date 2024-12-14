//
//  MealServiceProtocol.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

protocol MealServiceProtocol {
    func getAllCategories() -> AnyPublisher<[Category], Error>
    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], Error>
    func searchMeal(name: String) -> AnyPublisher<[Meal], Error>
}
