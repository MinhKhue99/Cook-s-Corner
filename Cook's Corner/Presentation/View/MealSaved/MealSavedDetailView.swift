//
//  MealSavedDetailView.swift
//  Cook's Corner
//
//  Created by KhuePM on 22/3/25.
//

import SwiftUI

struct MealSavedDetailView: View {
    let meal: MealRepresentable
    @ObservedObject var mealViewModel: MealViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                HeaderDetailView(meal: meal, mealViewModel: mealViewModel)

                BottomDetailView(meal: meal)
            }
        })
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
}
