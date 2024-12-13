//
//  GetAllCategoriesUseCase.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import Combine

protocol GetAllCategoriesUseCase {
    func execute() -> AnyPublisher<[Category], Error>
}
