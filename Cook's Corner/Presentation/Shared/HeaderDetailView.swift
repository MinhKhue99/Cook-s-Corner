//
//  HeaderView.swift
//  Cook's Corner
//
//  Created by KhuePM on 27/1/25.
//

import SwiftUI

struct HeaderDetailView: View {
    @ObservedObject var viewmodel: MealViewModel
    @Environment(\.presentationMode) var presentation
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    let meal: MealEntity
    let shouldShowSaveButton: Bool
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
                                        viewmodel.toggleFavorite(meal: meal)
                                        viewmodel.isFavorite.toggle()
                                    }, label: {
                                        Image(systemName: viewmodel.isFavorite ? "bookmark.fill" : "bookmark")
                                            .foregroundColor(viewmodel.isFavorite ? Color.green : Color.black)
                                            .padding()
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .opacity(shouldShowSaveButton ? 1.0 : 0.0)
                                    })
                                    .disabled(!shouldShowSaveButton)
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
        .onAppear {
            if shouldShowSaveButton {
                viewmodel.checkIfFavorite(idMeal: meal.idMeal ?? "")
            }
        }
    }
}
