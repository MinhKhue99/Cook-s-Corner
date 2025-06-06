//
//  GetAllCategoriesUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol GetAllCategoriesUseCaseProtocol {
    func execute() -> AnyPublisher<[Category], Error>
}

class GetAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol {
    private let repository: MealRepositoryProtocol
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    func execute() -> AnyPublisher<[Category], any Error> {
        repository.getAllCategories()
    }
}
