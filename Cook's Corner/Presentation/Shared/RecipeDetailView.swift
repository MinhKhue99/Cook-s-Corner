//
//  RecipeDetailView.swift
//  Cook's Corner
//
//  Created by KhuePM on 16/12/24.
//

import SwiftUI

struct RecipeDetailView: View {

    // MARK:  Property

    @StateObject var mealViewModel: MealViewModel
    @Environment(\.self) var enviroment
    @State private var isFavorite = false
    @State var isInstructionTaped: Bool = false
    var meal: Meal

    // MARK:  Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                ForEach(mealViewModel.searchMealResult, id: \.idMeal) { searchMealResult in

                    HeaderView(meal: searchMealResult)

                    BottomView(searchMealResult: searchMealResult)

                }
            }
        })
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
        .task {
            mealViewModel.searchMeal(name: self.meal.strMeal ?? "")
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

struct HeaderView: View {
    let meal: Meal
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

struct BottomView: View {
    @State var isInstructionTaped: Bool = false
    var searchMealResult: Meal

    var body: some View {
        VStack {
            VStack {
                Capsule()
                    .frame(width: 80, height: 4)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .padding(.top)

                HStack {
                    Text(searchMealResult.strCategory ?? "Loading...")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.green)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.15))

                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    Text(searchMealResult.strMeal ?? "Loading...")
                        .font(.system(size: 29, weight: .bold))

                    Spacer()
                }
                .padding(.horizontal)

                VStack {
                    HStack {
                        if isInstructionTaped {

                            Text(searchMealResult.strInstructions ?? "")
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .onTapGesture(count: 2) {

                                    withAnimation(.easeInOut(duration:1)) {
                                        isInstructionTaped.toggle()
                                    }
                                }
                        } else {
                            Text(searchMealResult.strInstructions ?? "")
                                .foregroundColor(.black)
                                .lineLimit(3)
                                .onTapGesture(count: 2) {

                                    withAnimation(.easeInOut(duration:1)) {
                                        isInstructionTaped.toggle()
                                    }
                                }
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {

                        Button {
                            withAnimation(.easeInOut(duration:1)) {
                                isInstructionTaped.toggle()
                            }

                        } label: {
                            Image(systemName: isInstructionTaped ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                .foregroundColor(.black)
                                .imageScale(.large).offset(x:10,y:36)
                        }
                        .buttonStyle(.plain)

                    }
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .foregroundColor(.gray.opacity(0.4))
                }
                .padding()
            }
            .background(Color.white)

            VStack {
                HStack {
                    Text("Ingredients")
                        .font(.system(size: 23, weight: .bold))

                    Spacer()

                    Text("1 serving")
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                }
                .padding(.vertical)
                .padding(.horizontal)

                ForEach(0..<10) { i in
                    if searchMealResult["strIngredient\(i)"] != nil && searchMealResult["strIngredient\(i)"] != "" {
                        VStack {
                            HStack {
                                Text(searchMealResult["strIngredient\(i)"] ?? "Loading...")

                                Spacer()

                                Text(searchMealResult["strMeasure\(i)"] ?? "Loading...")
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)

                            Divider()
                        }
                        .padding(.horizontal)
                    }
                }

                if searchMealResult.strYoutube == "" {
                    EmptyView()
                } else {
                    NavigationLink(destination: YoutubeView(strYoutube: searchMealResult.strYoutube), label: {
                        Text("Start Cooking")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                    .background(Color.green)
                    .cornerRadius(5)
                    .padding(.horizontal)
                }
            }
            .background(Color.white)
        }
        .background(Color.gray.opacity(0.3))
        .cornerRadius(30)
        .offset(y: -30)
    }
}
