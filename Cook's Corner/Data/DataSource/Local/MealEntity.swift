//
//  MealEntity.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import RealmSwift

class MealEntity: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var meal: String
    @Persisted var mealThumb: String
    @Persisted var category: String
    @Persisted var instructions: String
    @Persisted var stringYoutube: String
    @Persisted var ingredient1: String
    @Persisted var ingredient2: String
    @Persisted var ingredient3: String
    @Persisted var ingredient4: String
    @Persisted var ingredient5: String
    @Persisted var ingredient6: String
    @Persisted var ingredient7: String
    @Persisted var ingredient8: String
    @Persisted var ingredient9: String
    @Persisted var measure1: String
    @Persisted var measure2: String
    @Persisted var measure3: String
    @Persisted var measure4: String
    @Persisted var measure5: String
    @Persisted var measure6: String
    @Persisted var measure7: String
    @Persisted var measure8: String
    @Persisted var measure9: String

    var mealThumbURL: URL? {
        return URL(string: mealThumb)
    }

    convenience init(meal: Meal) {
        self.init()
        self.id = meal.idMeal ?? ""
        self.meal = meal.strMeal ?? ""
        self.mealThumb = meal.strMealThumb?.absoluteString ?? ""
        self.category = meal.strCategory ?? ""
        self.instructions = meal.strInstructions ?? ""
        self.stringYoutube = meal.strYoutube ?? ""
        self.ingredient1 = meal.strIngredient1 ?? ""
        self.ingredient2 = meal.strIngredient2 ?? ""
        self.ingredient3 = meal.strIngredient3 ?? ""
        self.ingredient4 = meal.strIngredient4 ?? ""
        self.ingredient5 = meal.strIngredient5 ?? ""
        self.ingredient6 = meal.strIngredient6 ?? ""
        self.ingredient7 = meal.strIngredient7 ?? ""
        self.ingredient8 = meal.strIngredient8 ?? ""
        self.ingredient9 = meal.strIngredient9 ?? ""
        self.measure1 = meal.strMeasure1 ?? ""
        self.measure2 = meal.strMeasure2 ?? ""
        self.measure3 = meal.strMeasure3 ?? ""
        self.measure4 = meal.strMeasure4 ?? ""
        self.measure5 = meal.strMeasure5 ?? ""
        self.measure6 = meal.strMeasure6 ?? ""
        self.measure7 = meal.strMeasure7 ?? ""
        self.measure8 = meal.strMeasure8 ?? ""
        self.measure9 = meal.strMeasure9 ?? ""
    }

    func toDomain() -> Meal {
        Meal(idMeal: id, strMeal: meal, strCategory: category, strInstructions: instructions, strMealThumb: mealThumbURL, strYoutube: stringYoutube, strIngredient1: ingredient1, strIngredient2: ingredient2, strIngredient3: ingredient3, strIngredient4: ingredient4, strIngredient5: ingredient5, strIngredient6: ingredient6, strIngredient7: ingredient7, strIngredient8: ingredient8, strIngredient9: ingredient9, strMeasure1: measure1, strMeasure2: measure2, strMeasure3: measure3, strMeasure4: measure4, strMeasure5: measure5, strMeasure6: measure6, strMeasure7: measure7, strMeasure8: measure8, strMeasure9: measure9)
    }
}
