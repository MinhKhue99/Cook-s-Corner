//
//  MealsRepository.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine
import RealmSwift

class MealRepository: MealRepositoryProtocol {
    private let localDataSource: LocalDataSourceProtocol
    private let remoteDataSource: RemoteDataSourceProtocol

    init(localDataSource: LocalDataSourceProtocol, remoteDataSource: RemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }

    func getAllCategories() -> AnyPublisher<[Category], any Error> {
        return remoteDataSource.getAllCategories()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<[Meal], any Error> {
        remoteDataSource.getMealsByCategory(category: category)
    }

    func searchMeal(name: String) -> AnyPublisher<[Meal], any Error> {
        remoteDataSource.searchMeal(name: name)
    }

    func saveMeal(meal: Meal) -> AnyPublisher<Void, any Error> {
        localDataSource.saveMeal(meal: RealmMeal(meal: meal))
    }

    func deleteMeal(meal: Meal) -> AnyPublisher<Void, any Error> {
        localDataSource.deleteMeal(idMeal: meal.idMeal ?? "")
    }

    func getAllSavedMeals() -> AnyPublisher<[Meal], any Error> {
        localDataSource.getAllSavedMeals()
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, any Error> {
        localDataSource.isMealSaved(idMeal: idMeal)
    }
}
