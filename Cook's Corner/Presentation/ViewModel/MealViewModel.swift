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
    @Published var savedMeals = [MealEntity]()
    private var cancellables = Set<AnyCancellable>()
    private let getAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol
    private let getMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol
    private let searchMealUseCase: SearchMealUseCaseProtocol
    private let saveMealUseCase: SaveMealUseCaseProtocol
    private let deleteMealUseCase: DeleteMealUseCaseProtocol
    private let getAllSavedMealUseCase: GetAllSavedMealsUseCaseProtocol

    init(
        getAllCategoriesUseCase: GetAllCategoriesUseCaseProtocol,
        getMealsByCategoryUseCase: GetMealsByCategoryUseCaseProtocol,
        searchMealUseCase: SearchMealUseCaseProtocol,
        saveMealUseCase: SaveMealUseCaseProtocol,
        deleteMealUseCase: DeleteMealUseCaseProtocol,
        getAllSavedMealUseCase: GetAllSavedMealsUseCaseProtocol
    ) {
        self.getAllCategoriesUseCase = getAllCategoriesUseCase
        self.getMealsByCategoryUseCase = getMealsByCategoryUseCase
        self.searchMealUseCase = searchMealUseCase
        self.saveMealUseCase = saveMealUseCase
        self.deleteMealUseCase = deleteMealUseCase
        self.getAllSavedMealUseCase = getAllSavedMealUseCase
        getAllCategories()
    }

    func getAllCategories() {
        isLoading = true

        getAllCategoriesUseCase.execute()
            .receive(on: DispatchQueue.main)
            .mapError { [weak self] error -> Error in
                self?.alert = AlertContent(title: "Get category failed", message: error.localizedDescription)
                return error
            }
            .replaceError(with: [])
            .sink { [weak self] categories in
                self?.categories = categories
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func getMealsByCategory(category: String) {
        self.isLoading = true
        getMealsByCategoryUseCase.execute(category: category)
            .receive(on: DispatchQueue.main)
            .mapError {[weak self] error -> Error in
                self?.alert = AlertContent(title: "Get meals fail", message: error.localizedDescription)
                return error
            }
            .replaceError(with: [])
            .sink { [weak self] meals in
                self?.meals = meals
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func searchMeal(name: String) {
        self.isLoading = true
        searchMealUseCase.execute(name: name)
            .receive(on: DispatchQueue.main)
            .mapError {[weak self] error -> Error in
                self?.alert = AlertContent(title: "Get meal fail", message: error.localizedDescription)
                return error
            }
            .replaceError(with: [])
            .sink { [weak self] meals in
                self?.searchMealResult = meals
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func saveMeal(meal: Meal) {
        saveMealUseCase.execute(meal: meal)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.alert = AlertContent(title: "Save meal fail", message: error.localizedDescription)
                }
            }, receiveValue: {
                self.alert = AlertContent(title: "Success", message: "Meal saved")
            })
            .store(in: &cancellables)
    }

    func deleteMeal(meal: MealEntity) {
        deleteMealUseCase.execute(meal: meal)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.alert = AlertContent(title: "Delete meal fail", message: error.localizedDescription)
                }
            }, receiveValue: {
                self.alert = AlertContent(title: "Success", message: "Meal deleted")
            })
            .store(in: &cancellables)
    }

    func getAllSavedMeals() {
        getAllSavedMealUseCase.execute()
            .sink(receiveCompletion: { completetion in
                if case .failure(let error) = completetion {
                    self.alert = AlertContent(title: "Get meals fail", message: error.localizedDescription)
                }

            }, receiveValue: { meals in
                self.savedMeals = meals
            })
            .store(in: &cancellables)

    }
}
