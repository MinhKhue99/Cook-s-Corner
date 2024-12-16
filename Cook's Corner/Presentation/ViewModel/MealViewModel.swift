//
//  MealViewModel.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation
import Combine

final class MealViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var alert: AlertContent?
    @Published var categories = [Category]()
    @Published var meals = [Meal]()
    @Published var searchMealResult = [Meal]()

    private var cancellables = Set<AnyCancellable>()
    private let getAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol
    private let getMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol
    private let searchMealUseCase: SearchMealUseCaseProtocol

    init(
        getAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol,
        getMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol,
        searchMealUseCase: SearchMealUseCaseProtocol
    ) {
        self.getAllCategoriesUseCase = getAllCategoriesUseCase
        self.getMealsByCategoryUseCase = getMealsByCategoryUseCase
        self.searchMealUseCase = searchMealUseCase
        getAllCategories()
    }

    func getAllCategories() {
        isLoading = true

        getAllCategoriesUseCase.execute()
            .mapError { [weak self] error -> Error in
                self?.alert = AlertContent(title: "Get category failed", message: error.localizedDescription)
                return error
            }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] categories in
                self?.categories = categories
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func getMealsByCategory(category: String) {
        self.isLoading = true
        getMealsByCategoryUseCase.execute(category: category)
            .mapError {[weak self] error -> Error in
                self?.alert = AlertContent(title: "Get meal fail", message: error.localizedDescription)
                return error
            }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] meals in
                self?.meals = meals
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func searchMeal(name: String) {
        self.isLoading = true
        searchMealUseCase.execute(name: name)
            .mapError {[weak self] error -> Error in
                self?.alert = AlertContent(title: "Get meal fail", message: error.localizedDescription)
                return error
            }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] meals in
                self?.searchMealResult = meals
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
}
