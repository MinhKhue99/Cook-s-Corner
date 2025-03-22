//
//  SaveMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 17/12/24.
//

import Foundation
import Combine

protocol SaveMealUseCaseProtocol {
    func execute(meal: any MealRepresentable) -> AnyPublisher<Void, Error>
}

final class SaveMealUseCase: SaveMealUseCaseProtocol {
    private let repository: RepositoryProtocol
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func execute(meal: any MealRepresentable) -> AnyPublisher<Void, any Error> {
        repository.saveMeal(meal: meal)
    }
}
