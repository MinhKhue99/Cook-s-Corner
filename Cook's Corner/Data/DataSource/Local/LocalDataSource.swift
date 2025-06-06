//
//  LocalDataSource.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation
import Combine
import RealmSwift

protocol LocalDataSourceProtocol {
    func saveMeal(meal: RealmMeal) -> AnyPublisher<Void, Error>
    func deleteMeal(idMeal: String) -> AnyPublisher<Void, Error>
    func getAllSavedMeals() -> AnyPublisher<[RealmMeal], Error>
    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, Error>
}

class LocalDataSource: LocalDataSourceProtocol {
    private let realmManager: RealmManagerProtocol

    init(realmManager: RealmManagerProtocol) {
        self.realmManager = realmManager
    }

    func saveMeal(meal: RealmMeal) -> AnyPublisher<Void, any Error> {
        realmManager.save(meal)
    }

    func deleteMeal(idMeal: String) -> AnyPublisher<Void, any Error> {
        realmManager.deleteById(RealmMeal.self, id: idMeal)
    }

    func getAllSavedMeals() -> AnyPublisher<[RealmMeal], any Error> {
        realmManager.fetch(RealmMeal.self)
    }

    func isMealSaved(idMeal: String) -> AnyPublisher<Bool, any Error> {
        realmManager.isSaved(RealmMeal.self, id: idMeal)
    }
}
