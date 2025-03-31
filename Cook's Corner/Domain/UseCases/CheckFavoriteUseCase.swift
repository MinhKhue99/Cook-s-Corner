//
//  CheckFavoriteUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 31/3/25.
//

import Combine

protocol CheckFavoriteUseCaseProtocol {
    func execute(idMeal: String) -> AnyPublisher<Bool, Error>
}

class CheckFavoriteUseCase: CheckFavoriteUseCaseProtocol {
    private var repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }
    func execute(idMeal: String) -> AnyPublisher<Bool, any Error> {
        repository.isMealSaved(idMeal: idMeal)
    }
}
