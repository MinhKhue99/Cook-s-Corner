//
//  CategoryView.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import SwiftUI

struct CategoryView: View {
    // MARK:  Property
    var meal: MealEntity

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

#Preview {
    CategoryView(meal: MealEntity(
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
