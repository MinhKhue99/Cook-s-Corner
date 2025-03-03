//
//  SearchView.swift
//  Cook's Corner
//
//  Created by KhuePM on 19/12/24.
//

import SwiftUI

struct SearchView: View {
    // MARK:  Property
    @Environment(\.presentationMode) var presentation
    @StateObject var mealViewModel: MealViewModel
    @Binding var name: String

    // MARK:  Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.gray)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    })

                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    Text("Search result")
                        .font(.system(size: 29, weight: .bold))

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                if !mealViewModel.searchMealResult.isEmpty {
                    VStack {
                        ForEach(mealViewModel.searchMealResult, id: \.idMeal) { meal in
                            NavigationLink(
                                destination: {
                                    MealDetailView(mealViewModel: mealViewModel, meal: meal)
                                },
                                label: {
                                    RecipeView(meal: meal)
                                }
                            )
                        }
                    }
                } else {
                    Text("No results")
                        .font(.system(size: 21, weight: .semibold))
                        .foregroundColor(Color.gray)
                        .padding(.top)
                }

                Spacer()
            }
        })
        .navigationBarHidden(true)
        .task {
            mealViewModel.searchMeal(name: self.name)
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
