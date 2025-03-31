//
//  MealRealmManager.swift
//  Cook's Corner
//
//  Created by KhuePM on 23/3/25.
//

import RealmSwift
import Combine
import Foundation

class MealRealmManager {
    private let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func saveMeal(meal: MealEntity) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            do {
                let realm = try Realm() // Ensure correct thread context

                try realm.write {
                    if let existingMeal = realm.object(ofType: RealmMeal.self, forPrimaryKey: meal.idMeal) {
                        // Update existing meal if needed
                        existingMeal.update(from: meal)
                    } else {
                        let newMeal = RealmMeal(meal: meal)
                        realm.add(newMeal, update: .modified)
                    }
                }
                promise(.success(()))
            } catch {
                promise(.failure(NSError(domain: "Save Meal Error", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to save meal: \(error.localizedDescription)"])))
            }
        }
        .eraseToAnyPublisher()
    }

    func deleteMeal(meal: MealEntity) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            do {
                guard let realmMeal = self.realm.object(ofType: RealmMeal.self, forPrimaryKey: meal.idMeal) else {
                    promise(.failure(NSError(domain: "Meal not found", code: 404, userInfo: nil)))
                    return
                }

                try self.realm.write {
                    if !realmMeal.isInvalidated {
                        self.realm.delete(realmMeal)
                    }
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }

    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            do {
                let realm = try Realm() // Ensure thread safety
                let meal = realm.object(ofType: RealmMeal.self, forPrimaryKey: idMeal)
                dump(meal)
                promise(.success(meal != nil))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }


    func getAllSavedMeals() -> AnyPublisher<[MealEntity], Error> {
        Just(self.realm.objects(RealmMeal.self)
            .map { MealMapper.toDMain($0) })
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
