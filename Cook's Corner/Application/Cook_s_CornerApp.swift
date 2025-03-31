//
//  Cook_s_CornerApp.swift
//  Cook's Corner
//
//  Created by KhuePM on 11/12/24.
//

import SwiftUI

@main
struct Cook_s_CornerApp: App {

    let viewmodel: MealViewModel

    init() {
        let container = DependencyContainer()
        self.viewmodel = MealViewModel(
            getAllCategoriesUseCase: container.resolve(GetAllCategoriesUseCase.self)!,
            getMealsByCategoryUseCase: container.resolve(GetMealsByCategoryUseCase.self)!,
            searchMealUseCase: container.resolve(SearchMealUseCase.self)!,
            saveMealUseCase: container.resolve(SaveMealUseCase.self)!,
            deleteMealUseCase: container.resolve(DeleteMealUseCase.self)!,
            getAllSavedMealUseCase: container.resolve(GetAllSavedMealsUseCase.self)!,
            checkFavoriteUseCase: container.resolve(CheckFavoriteUseCase.self)!
        )
    }

    var body: some Scene {
        WindowGroup {            
            HomeView(viewmodel: viewmodel)
        }
    }
}
