//
//  SaveMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol SaveMealUseCaseProtocol {
    func execute(meal: MealEntity) -> AnyPublisher<Void, Error>
}

final class SaveMealUseCase: SaveMealUseCaseProtocol {
    private let repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }
    func execute(meal: MealEntity) -> AnyPublisher<Void, any Error> {
        repository.saveMeal(meal: meal)
    }
}
