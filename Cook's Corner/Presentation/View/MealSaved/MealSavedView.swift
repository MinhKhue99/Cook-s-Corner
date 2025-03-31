//
//  MealSavedView.swift
//  Cook's Corner
//
//  Created by KhuePM on 3/3/25.
//

import SwiftUI

struct MealSavedView: View {
    @ObservedObject var viewmodel: MealViewModel
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationStack {
            let savedMeals = viewmodel.savedMeals
            if savedMeals.isEmpty {
                Text("No results")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundColor(Color.gray)
                    .padding(.top)
            } else {
                List {
                    ForEach(savedMeals, id: \.idMeal) {meal in
                        NavigationLink(
                            destination: MealDetailView(viewmodel: viewmodel, meal: meal, shouldFetchMealDetails: false, shouldShowSaveButton: false),
                            label: {
                                MealSavedRowView(meal: meal)
                            }
                        ).padding()
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            let meal = savedMeals[index]
                            viewmodel.deleteMeal(meal: meal)
                            viewmodel.getAllSavedMeals()
                        }})
                }
            }
        }
        .navigationTitle("Meal Saved")
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.gray)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                })
            })
        }
        .task {
            viewmodel.getAllSavedMeals()
        }
    }
}

//#Preview {
//    MealSavedView()
//}
