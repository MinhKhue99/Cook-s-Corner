//
//  GetAllSavedMeals.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol GetAllSavedMealsUseCaseProtocol {
    func execute() -> AnyPublisher<[MealEntity], Error>
}

final class GetAllSavedMealsUseCase: GetAllSavedMealsUseCaseProtocol {
    private var repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[MealEntity], any Error> {
        repository.getAllSavedMeals()
    }
}
