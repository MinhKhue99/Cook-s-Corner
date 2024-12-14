//
//  MealsRepository.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine
import RealmSwift

final class MealsRepository: RepositoryProtocol {
    private let realm = try! Realm()
    private let api: MealServiceProtocol
    init(api: MealServiceProtocol) {
        self.api = api
    }

    func getAllCategories() -> AnyPublisher<[Category], any Error> {
        api.getAllCategories()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], any Error> {
        api.getMealsByCategory(category: category)
    }

    func searchMeal(name: String) -> AnyPublisher<[Meal], any Error> {
        api.searchMeal(name: name)
    }

    func saveMeal(_ meal: Meal) {
        do {
            try realm.write {
                let entity = MealEntity(meal: meal)
                realm.add(entity)
            }
        } catch let error {
            print("Failed to add meal: \(error.localizedDescription)")
        }
    }

    func deleteMeal(_ meal: MealEntity) {
        do {
            try realm.write {
                realm.delete(meal)
            }
        } catch let error {
            print("Failed to delete meal: \(error.localizedDescription)")
        }
    }
}
