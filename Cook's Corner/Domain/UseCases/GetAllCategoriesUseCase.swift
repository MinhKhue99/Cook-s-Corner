//
//  GetAllCategoriesUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol GetAllCategoriesUseCaseProtocol {
    func execute() -> AnyPublisher<[CategoryEntity], Error>
}

final class GetAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol {
    private let repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }
    func execute() -> AnyPublisher<[CategoryEntity], any Error> {
        repository.getAllCategories()
    }
}
