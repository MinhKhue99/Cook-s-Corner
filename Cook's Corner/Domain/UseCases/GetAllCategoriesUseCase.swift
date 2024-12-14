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

final class GetAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol {
    private let repository: RepositoryProtocol
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func execute() -> AnyPublisher<[Category], any Error> {
        repository.getAllCategories()
    }
}
