//
//  CategoryView.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import SwiftUI

struct CategoryView: View {
    // MARK:  Property
    var meal: Meal

    // MARK:  Body
    var body: some View {
        VStack(spacing: 12) {
            if meal.strMealThumb != nil{
                AsyncImage(url: meal.strMealThumb) { img in
                    img
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height:  300)

                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .black.opacity(0.4), radius: 2, x: -8, y: 5)

                        .overlay {
                            LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                                .cornerRadius(12)
                        }
                        .overlay(alignment: .bottomLeading) {
                            Text(meal.strMeal ?? "")
                                .multilineTextAlignment(.leading)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 120)
                                .padding(.leading, 8)
                                .padding(.bottom, 20)
                        }
                } placeholder: {
                    ProgressView()
                        .frame(width: 200, height:  300)
                }
            } else {
                Image(systemName: "photo.artframe")
                    .imageScale(.large)
            }
        }

        .padding()
    }
}
