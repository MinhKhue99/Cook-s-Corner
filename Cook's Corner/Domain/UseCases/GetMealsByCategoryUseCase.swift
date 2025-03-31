//
//  GetMealsByCategoryUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol GetMealsByCategoryUseCaseProtocol {
    func execute(category: String) -> AnyPublisher<[MealEntity], Error>
}

final class GetMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol {
    private let repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }
    func execute(category: String) -> AnyPublisher<[MealEntity], any Error> {
        repository.getMealsByCategory(category: category)
    }
}
