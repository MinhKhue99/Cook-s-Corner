//
//  GetMealsByCategoryUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol GetMealsByCategoryUseCaseProtocol {
    func execute(category: String) -> AnyPublisher<[Meal], Error>
}

class GetMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol {
    private let repository: MealRepositoryProtocol
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    func execute(category: String) -> AnyPublisher<[Meal], any Error> {
        repository.getMealsByCategory(category: category)
    }
}
