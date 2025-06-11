//
//  SaveMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol SaveMealUseCaseProtocol {
    func execute(meal: Meal) -> AnyPublisher<Void, Error>
}

class SaveMealUseCase: SaveMealUseCaseProtocol {
    private let repository: MealRepositoryProtocol
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    func execute(meal: Meal) -> AnyPublisher<Void, any Error> {
        repository.saveMeal(meal: meal)
    }
}
