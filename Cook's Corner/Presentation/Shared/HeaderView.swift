//
//  HeaderView.swift
//  Cook's Corner
//
//  Created by KhuePM on 27/1/25.
//

import SwiftUI

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

#Preview {
    HeaderView(meal: Meal(
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
