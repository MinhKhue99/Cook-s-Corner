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

class SearchMealUseCase: SearchMealUseCaseProtocol {
    private let repository: MealRepositoryProtocol
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    func execute(name: String) -> AnyPublisher<[Meal], any Error> {
        repository.searchMeal(name: name)
    }
}
