//
//  DeleteMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol DeleteMealUseCaseProtocol {
    func execute(meal: Meal) -> AnyPublisher<Void, Error>
}

class DeleteMealUseCase: DeleteMealUseCaseProtocol {
    private var repository: MealRepositoryProtocol
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }

    func execute(meal: Meal) -> AnyPublisher<Void, any Error> {
        repository.deleteMeal(meal: meal)
    }
}
