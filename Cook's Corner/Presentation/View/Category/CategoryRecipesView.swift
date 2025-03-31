//
//  CategoryRecipesView.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import SwiftUI

struct CategoryRecipesView: View {
    // MARK:  Property
    @ObservedObject var viewmodel: MealViewModel
    // MARK:  Body
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack {
                ForEach(viewmodel.meals, id: \.idMeal) { meal in
                    NavigationLink(
                        destination: MealDetailView(viewmodel: viewmodel, meal: meal, shouldFetchMealDetails: true, shouldShowSaveButton: true),
                        label: {
                            CategoryView(meal: meal)
                        })
                }
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
