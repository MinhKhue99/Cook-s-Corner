//
//  RepositoryProtocol.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

protocol RepositoryProtocol {
    //Remote
    func getAllCategories() -> AnyPublisher<[Category], Error>
    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], Error>
    func searchMeal(name: String) -> AnyPublisher<[Meal], Error>

    //Local
    func saveMeal(meal: any MealRepresentable) -> AnyPublisher<Void, Error>
    func deleteMeal(meal: MealEntity) -> AnyPublisher<Void, Error>
    func getAllSavedMeals() -> AnyPublisher<[MealEntity], Error>
}
