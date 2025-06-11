//
//  GetAllSavedMeals.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol GetAllSavedMealsUseCaseProtocol {
    func execute() -> AnyPublisher<[Meal], Error>
}

class GetAllSavedMealsUseCase: GetAllSavedMealsUseCaseProtocol {
    private var repository: MealRepositoryProtocol
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Meal], any Error> {
        repository.getAllSavedMeals()
    }
}
