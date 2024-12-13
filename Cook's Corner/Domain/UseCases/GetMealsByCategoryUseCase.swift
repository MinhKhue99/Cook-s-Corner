//
//  GetMealsByCategoryUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol GetMealsByCategoryUseCase {
    func execute(category: String) -> AnyPublisher<[Meal], Error>
}
