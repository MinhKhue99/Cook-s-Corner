//
//  Meal.swift
//  Cook's Corner
//
//  Created by KhuePM on 23/3/25.
//

import Foundation

struct MealEntity {
    var idMeal: String?
    var strMeal: String?
    var strCategory: String?
    var strInstructions: String?
    var strMealThumb: URL?
    var strYoutube: String?

    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?

    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?

    // Computed property to get all ingredients
    var ingredients: [(ingredient: String, measure: String)] {
        let ingredientsArray = [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4,
            strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9
        ]

        let measuresArray = [
            strMeasure1, strMeasure2, strMeasure3, strMeasure4,
            strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9
        ]

        return zip(ingredientsArray, measuresArray)
            .compactMap { (ingredient, measure) in
                guard let ingredient = ingredient, !ingredient.isEmpty else { return nil }
                return (ingredient, measure ?? "") // If measure is nil, use empty string
            }
    }

    func update(from meal: MealEntity) {
        
    }
}
