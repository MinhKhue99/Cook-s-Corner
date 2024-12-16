//
//  Cook_s_CornerApp.swift
//  Cook's Corner
//
//  Created by KhuePM on 11/12/24.
//

import SwiftUI

@main
struct Cook_s_CornerApp: App {
    var body: some Scene {
        WindowGroup {
            let api = MealService()
            let repository = MealsRepository(api: api)
            let getAllCategoriesUseCase = GetAllCategoriesUseCase(repository: repository)
            let getMealsByCategoryUseCase = GetMealsByCategoryUseCase(repository: repository)
            let searchMealUseCase = SearchMealUseCase(repository: repository)
            let viewmodel = MealViewModel(getAllCategoriesUseCase: getAllCategoriesUseCase, getMealsByCategoryUseCase: getMealsByCategoryUseCase, searchMealUseCase: searchMealUseCase)
            HomeView(viewmodel: viewmodel)
        }
    }
}
