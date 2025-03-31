//
//  DeleteMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol DeleteMealUseCaseProtocol {
    func execute(meal: MealEntity) -> AnyPublisher<Void, Error>
}

final class DeleteMealUseCase: DeleteMealUseCaseProtocol {
    private var repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }

    func execute(meal: MealEntity) -> AnyPublisher<Void, any Error> {
        repository.deleteMeal(meal: meal)
    }
}
