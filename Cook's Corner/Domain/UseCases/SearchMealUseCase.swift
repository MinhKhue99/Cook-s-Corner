//
//  SearchMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol SearchMealUseCaseProtocol {
    func execute(name: String) -> AnyPublisher<[MealEntity], Error>
}

final class SearchMealUseCase: SearchMealUseCaseProtocol {
    private let repository: MealRepository
    init(repository: MealRepository) {
        self.repository = repository
    }
    func execute(name: String) -> AnyPublisher<[MealEntity], any Error> {
        repository.searchMeal(name: name)
    }
}
