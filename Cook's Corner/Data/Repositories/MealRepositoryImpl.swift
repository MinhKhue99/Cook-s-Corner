//
//  MealsRepository.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine
import RealmSwift

class MealRepositoryImpl: MealRepository {
    private let realmManager: MealRealmManager
    private let networkClient: NetworkClient
    init(networkClient: NetworkClient, realmManager: MealRealmManager) {
        self.networkClient = networkClient
        self.realmManager = realmManager
    }

    func getAllCategories() -> AnyPublisher<[CategoryEntity], any Error> {
        return networkClient.getAllCategories()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<[MealEntity], any Error> {
        networkClient.getMealsByCategory(category: category)
    }

    func searchMeal(name: String) -> AnyPublisher<[MealEntity], any Error> {
        networkClient.searchMeal(name: name)
    }

    func saveMeal(meal: MealEntity) -> AnyPublisher<Void, any Error> {
        realmManager.saveMeal(meal: meal)
    }

    func deleteMeal(meal: MealEntity) -> AnyPublisher<Void, any Error> {
        realmManager.deleteMeal(meal: meal)
    }

    func getAllSavedMeals() -> AnyPublisher<[MealEntity], any Error> {
        realmManager.getAllSavedMeals()
    }

    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, any Error> {
        realmManager.isMealSaved(idMeal: idMeal)
    }
}
