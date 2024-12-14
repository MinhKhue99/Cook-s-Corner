//
//  SearchMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol SearchMealUseCaseProtocol {
    func execute(name: String) -> AnyPublisher<[Meal], Error>
}

final class SearchMealUseCase: SearchMealUseCaseProtocol {
    private let repository: RepositoryProtocol
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func execute(name: String) -> AnyPublisher<[Meal], any Error> {
        repository.searchMeal(name: name)
    }
}
