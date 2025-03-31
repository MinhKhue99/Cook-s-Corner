//
//  MealDetailView.swift
//  Cook's Corner
//
//  Created by KhuePM on 3/3/25.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewmodel: MealViewModel
    let meal: MealEntity?
    let shouldFetchMealDetails: Bool
    let shouldShowSaveButton: Bool
    private var displayedMeal: MealEntity? {
        if shouldFetchMealDetails, let fetchedMeal = viewmodel.searchMealResult.first {
            return fetchedMeal
        }
        return meal
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                if let meal = displayedMeal {
                    HeaderDetailView(viewmodel: viewmodel, meal: meal, shouldShowSaveButton: shouldShowSaveButton)
                    BottomDetailView(meal: meal)
                } else {
                    ProgressView("Loading...")
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
        .task {
            if shouldFetchMealDetails {
                viewmodel.searchMeal(name: meal?.strMeal ?? "")
            }
        }
        .alert(item: $viewmodel.alert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK")) {
                    viewmodel.alert = nil
                }
            )
        }
    }
}
