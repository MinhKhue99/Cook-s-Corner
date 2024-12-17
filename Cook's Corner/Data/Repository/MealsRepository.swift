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

    func saveMeal(meal: Meal) {
        do {
            try realm.write {
                let entity = MealEntity(meal: meal)
                realm.add(entity)
            }
        } catch let error {
            print("Failed to add meal: \(error.localizedDescription)")
        }
    }

    func saveMeal(meal: Meal) -> AnyPublisher<Void, any Error> {
        return Future<Void, Error> { promise in
            do {
                try self.realm.write {
                    let mealEntity = MealEntity(meal: meal)
                    self.realm.add(mealEntity, update: .modified)
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
                    if let objectToDelete = self.realm.object(ofType: MealEntity.self, forPrimaryKey: meal.id) {
                        self.realm.delete(objectToDelete)
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
