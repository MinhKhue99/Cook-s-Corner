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

            }
        } catch let error {
            print("Failed to add meal: \(error.localizedDescription)")
        }
    }

    func saveMeal(meal: Meal) -> AnyPublisher<Void, any Error> {
        return Future<Void, Error> { promise in
            do {
                try self.realm.write {
                    let mealEntity = MealEntity()
                    mealEntity.id = meal.idMeal
                    mealEntity.meal = meal.strMeal
                    mealEntity.mealThumbURL = meal.strMealThumb
                    mealEntity.category = meal.strCategory
                    mealEntity.instructions = meal.strInstructions
                    mealEntity.stringYoutube = meal.strYoutube
                    mealEntity.ingredient1 = meal.strIngredient1
                    mealEntity.ingredient2 = meal.strIngredient2
                    mealEntity.ingredient3 = meal.strIngredient3
                    mealEntity.ingredient4 = meal.strIngredient4
                    mealEntity.ingredient5 = meal.strIngredient5
                    mealEntity.ingredient6 = meal.strIngredient6
                    mealEntity.ingredient7 = meal.strIngredient7
                    mealEntity.ingredient8 = meal.strIngredient8
                    mealEntity.ingredient9 = meal.strIngredient9
                    mealEntity.measure1 = meal.strMeasure1
                    mealEntity.measure2 = meal.strMeasure2
                    mealEntity.measure3 = meal.strMeasure3
                    mealEntity.measure4 = meal.strMeasure4
                    mealEntity.measure5 = meal.strMeasure5
                    mealEntity.measure6 = meal.strMeasure6
                    mealEntity.measure7 = meal.strMeasure7
                    mealEntity.measure8 = meal.strMeasure8
                    mealEntity.measure9 = meal.strMeasure9
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
