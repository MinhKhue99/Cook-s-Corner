//
//  MealSavedView.swift
//  Cook's Corner
//
//  Created by KhuePM on 3/3/25.
//

import SwiftUI

struct MealSavedView: View {
    @StateObject var mealViewModel: MealViewModel
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationStack {
            let savedMeals = mealViewModel.savedMeals
            if savedMeals.isEmpty {
                Text("No results")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundColor(Color.gray)
                    .padding(.top)
            } else {
                List {
                    ForEach(savedMeals) {meal in
                        NavigationLink(
                            destination: Text("Khue"),
                            label: {
                                MealSavedRowView(meal: meal)
                            }
                        ).padding()
                    }
                    .onDelete(perform: {indexSet in
                        for index in indexSet{
                            let meal = savedMeals[index]
                            mealViewModel.deleteMeal(meal: meal)
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
            mealViewModel.getAllSavedMeals()
        }
    }
}

//#Preview {
//    MealSavedView()
//}
