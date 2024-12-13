//
//  SearchMealUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol SearchMealUseCase {
    func execute(name: String) -> AnyPublisher<[Meal], Error>
}
