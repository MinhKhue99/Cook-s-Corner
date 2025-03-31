//
//  RepositoryProtocol.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

protocol MealRepository {
    //Remote
    func getAllCategories() -> AnyPublisher<[CategoryEntity], Error>
    func getMealsByCategory(category: String) -> AnyPublisher<[MealEntity], Error>
    func searchMeal(name: String) -> AnyPublisher<[MealEntity], Error>

    //Local
    func saveMeal(meal: MealEntity) -> AnyPublisher<Void, Error>
    func deleteMeal(meal: MealEntity) -> AnyPublisher<Void, Error>
    func getAllSavedMeals() -> AnyPublisher<[MealEntity], Error>
    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, Error>
}
