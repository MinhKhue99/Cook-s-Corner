//
//  RepositoryProtocol.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

protocol MealRepositoryProtocol {
    //Remote
    func getAllCategories() -> AnyPublisher<[Category], Error>
    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], Error>
    func searchMeal(name: String) -> AnyPublisher<[Meal], Error>

    //Local
    func saveMeal(meal: Meal) -> AnyPublisher<Void, Error>
    func deleteMeal(meal: Meal) -> AnyPublisher<Void, Error>
    func getAllSavedMeals() -> AnyPublisher<[Meal], Error>
    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, Error>
}
