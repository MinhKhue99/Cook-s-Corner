//
//  MealDetailView.swift
//  Cook's Corner
//
//  Created by KhuePM on 3/3/25.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var mealViewModel: MealViewModel
    let meal: Meal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                HeaderDetailView(meal: meal, mealViewModel: mealViewModel)

                BottomDetailView(meal: meal)
            }
        })
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
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
