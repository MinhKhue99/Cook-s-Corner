//
//  Meal.swift
//  Cook's Corner
//
//  Created by KhuePM on 11/12/24.
//

import Foundation

struct MealDTO: Codable {
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

    subscript(key: String) -> String? {
        switch key {
        case "strIngredient1": return strIngredient1
        case "strIngredient2": return strIngredient2
        case "strIngredient3": return strIngredient3
        case "strIngredient4": return strIngredient4
        case "strIngredient5": return strIngredient5
        case "strIngredient6": return strIngredient6
        case "strIngredient7": return strIngredient7
        case "strIngredient8": return strIngredient8
        case "strIngredient9": return strIngredient9

        case "strMeasure1": return strMeasure1
        case "strMeasure2": return strMeasure2
        case "strMeasure3": return strMeasure3
        case "strMeasure4": return strMeasure4
        case "strMeasure5": return strMeasure5
        case "strMeasure6": return strMeasure6
        case "strMeasure7": return strMeasure7
        case "strMeasure8": return strMeasure8
        case "strMeasure9": return strMeasure9

        default: return ""
        }
    }

    func toDoMain() -> Meal {
        Meal(
            idMeal: self.idMeal,
            strMeal: self.strMeal,
            strCategory: self.strCategory,
            strInstructions: self.strInstructions,
            strMealThumb: self.strMealThumb,
            strYoutube: self.strYoutube,
            strIngredient1: self.strIngredient1,
            strIngredient2: self.strIngredient2,
            strIngredient3: self.strIngredient3,
            strIngredient4: self.strIngredient4,
            strIngredient5: self.strIngredient5,
            strIngredient6: self.strIngredient6,
            strIngredient7: self.strIngredient7,
            strIngredient8: self.strIngredient8,
            strIngredient9: self.strIngredient9,

            strMeasure1: self.strMeasure1,
            strMeasure2: self.strMeasure2,
            strMeasure3: self.strMeasure3,
            strMeasure4: self.strMeasure4,
            strMeasure5: self.strMeasure5,
            strMeasure6: self.strMeasure6,
            strMeasure7: self.strMeasure7,
            strMeasure8: self.strMeasure8,
            strMeasure9: self.strMeasure9
        )
    }
}

struct MealResponse: Codable {
    var meals: [MealDTO]
}
