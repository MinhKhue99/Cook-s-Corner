//
//  RecipeDetailView.swift
//  Cook's Corner
//
//  Created by KhuePM on 16/12/24.
//

import SwiftUI

struct RecipeDetailView: View {

    // MARK:  Property
    @StateObject var mealViewModel: MealViewModel
    var meal: Meal

    // MARK:  Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                ForEach(mealViewModel.searchMealResult, id: \.idMeal) { meal in

                    HeaderDetailView(meal: meal, mealViewModel: mealViewModel)

                    BottomDetailView(meal: meal)

                }
            }
        })
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
        .task {
            mealViewModel.searchMeal(name: self.meal.strMeal ?? "")
        }
        .alert(item: $mealViewModel.alert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK")) {
                    mealViewModel.alert = nil
                }
            )
        }
    }
}
