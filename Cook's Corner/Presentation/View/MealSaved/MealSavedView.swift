//
//  MealSavedView.swift
//  Cook's Corner
//
//  Created by KhuePM on 3/3/25.
//

import SwiftUI

struct MealSavedView: View {
    @ObservedObject var viewmodel: MealViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        NavigationView(content: {
            let savedMeals = viewmodel.savedMeals
            if savedMeals.isEmpty {
                Text("No results")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundColor(Color.gray)
                    .padding(.top)
            } else {
                List {
                    ForEach(savedMeals, id: \.idMeal) {meal in
                        MealSavedRowView(meal: meal)
                            .onTapGesture {
                                coordinator.push(.mealSavedDetail(meal))
                            }
                            .padding()

                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            let meal = savedMeals[index]
                            viewmodel.deleteMeal(meal: meal)
                            viewmodel.getAllSavedMeals()
                        }})
                }
            }
        })
        .navigationTitle("Meal Saved")
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button(action: {
                    coordinator.pop()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.gray)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                })
            })
        }
        .task {
            viewmodel.getAllSavedMeals()
        }
    }
}
