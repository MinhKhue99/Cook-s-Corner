//
//  BottomView.swift
//  Cook's Corner
//
//  Created by KhuePM on 27/1/25.
//

import SwiftUI

struct BottomDetailView: View {
    @State var isInstructionTaped: Bool = false
    var meal: any MealRepresentable

    var body: some View {
        VStack {
            VStack {
                Capsule()
                    .frame(width: 80, height: 4)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .padding(.top)

                HStack {
                    Text(meal.strCategory ?? "Loading...")
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
                    Text(meal.strMeal ?? "Loading...")
                        .font(.system(size: 29, weight: .bold))

                    Spacer()
                }
                .padding(.horizontal)

                VStack {
                    HStack {
                        if isInstructionTaped {
                            Text(meal.strInstructions ?? "")
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .onTapGesture(count: 2) {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        isInstructionTaped.toggle()
                                    }
                                }
                        } else {
                            Text(meal.strInstructions ?? "")
                                .foregroundColor(.black)
                                .lineLimit(3)
                                .onTapGesture(count: 2) {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        isInstructionTaped.toggle()
                                    }
                                }
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Button {
                            withAnimation(.easeInOut(duration: 1)) {
                                isInstructionTaped.toggle()
                            }
                        } label: {
                            Image(systemName: isInstructionTaped ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .offset(x: 10, y: 36)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
                .background {
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

                ForEach(1..<10) { i in // Start at 1 since indices are 1-based
                    if let ingredient = meal.ingredient(at: i), !ingredient.isEmpty {
                        VStack {
                            HStack {
                                Text(ingredient)

                                Spacer()

                                Text(meal.measure(at: i) ?? "Loading...")
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)

                            Divider()
                        }
                        .padding(.horizontal)
                    }
                }

                if meal.strYoutube?.isEmpty ?? true {
                    EmptyView()
                } else {
                    NavigationLink(destination: YoutubeView(strYoutube: meal.strYoutube ?? ""), label: {
                        Text("Start Cooking")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    .frame(width: UIScreen.main.bounds.width - 100, height: 70)
                    .background(Color.green)
                    .cornerRadius(15)
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

#Preview {
    BottomDetailView(meal: Meal(
        idMeal: "52771",
        strMeal: "Spicy Arrabiata Penne",
        strCategory: "Vegetarian",
        strInstructions: """
            Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.
            In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.
            Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.
        """,
        strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),
        strYoutube: "https://www.youtube.com/watch?v=1IszT_guI08",
        strIngredient1: "penne rigate",
        strIngredient2: "olive oil",
        strIngredient3: "garlic",
        strIngredient4: "chopped tomatoes",
        strIngredient5: "red chilli flakes",
        strIngredient6: "italian seasoning",
        strIngredient7: "basil",
        strIngredient8: "Parmigiano-Reggiano",
        strIngredient9: "",
        strMeasure1: "1 pound",
        strMeasure2: "1/4 cup",
        strMeasure3: "3 cloves",
        strMeasure4: "1 tin",
        strMeasure5: "1/2 teaspoon",
        strMeasure6: "1/2 teaspoon",
        strMeasure7: "6 leaves",
        strMeasure8: "sprinkling",
        strMeasure9: ""
    ))
}
