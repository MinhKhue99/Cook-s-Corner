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

    func saveMeal(meal: any MealRepresentable) -> AnyPublisher<Void, any Error> {
        return Future<Void, Error> { promise in
            do {
                try self.realm.write {
                    let entity = MealEntity()
                    entity.id = meal.idMeal ?? UUID().uuidString // Ensure a unique ID
                    entity.meal = meal.strMeal
                    entity.mealThumbURL = meal.strMealThumb
                    entity.category = meal.strCategory
                    entity.instructions = meal.strInstructions
                    entity.stringYoutube = meal.strYoutube
                    for i in 1..<10 {
                        entity.setValue(meal.ingredient(at: i), forKey: "ingredient\(i)")
                        entity.setValue(meal.measure(at: i), forKey: "measure\(i)")
                    }
                    self.realm.add(entity, update: .modified)
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }

    func deleteMeal(meal: MealEntity) -> AnyPublisher<Void, any Error> {
        return Future<Void, Error> { promise in
            do {
                try self.realm.write {
                    if !meal.isInvalidated {
                        self.realm.delete(meal)
                    }
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }

    func getAllSavedMeals() -> AnyPublisher<[MealEntity], any Error> {
        return Future<[MealEntity], Error> { promise in
            let meals = Array(self.realm.objects(MealEntity.self))
            promise(.success(meals))
        }
        .eraseToAnyPublisher()
    }
}
