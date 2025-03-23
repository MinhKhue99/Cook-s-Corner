//
//  HeaderView.swift
//  Cook's Corner
//
//  Created by KhuePM on 27/1/25.
//

import SwiftUI

struct HeaderDetailView: View {
    let meal: MealRepresentable
    @ObservedObject var mealViewModel: MealViewModel
    @State private var isFavorite = false
    @Environment(\.presentationMode) var presentation
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        ZStack {
            AsyncImage(url: meal.strMealThumb) { image in
                image
                    .resizable()
                    .foregroundColor(.gray)
                    .redacted(reason: meal.strMealThumb == nil ? .placeholder : .init())
                    .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
                    .overlay(
                        ZStack {
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
                                    })

                                    Spacer()

                                    Button(action: {
                                        mealViewModel.saveMeal(meal: meal)
                                        isFavorite.toggle()
                                    }, label: {
                                        Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                                            .foregroundColor(isFavorite ? Color.green : Color.black)
                                            .padding()
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    })
                                }
                                .padding(.horizontal)

                                Spacer()
                            }
                            .padding(.top, safeAreaInsets.top)
                        }
                    )
            } placeholder: {
                ProgressView()
            }
            
        }
    }
}
