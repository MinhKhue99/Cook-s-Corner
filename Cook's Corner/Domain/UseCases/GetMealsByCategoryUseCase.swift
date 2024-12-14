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

final class GetMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol {
    private let repository: RepositoryProtocol
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func execute(category: String) -> AnyPublisher<[Meal], any Error> {
        repository.getMealsByCategory(category: category)
    }
}
