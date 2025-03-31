//
//  MealEntity.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import RealmSwift

class RealmMeal: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String?
    @Persisted var meal: String?
    @Persisted var mealThumb: String?
    @Persisted var category: String?
    @Persisted var instructions: String?
    @Persisted var stringYoutube: String?
    @Persisted var ingredient1: String?
    @Persisted var ingredient2: String?
    @Persisted var ingredient3: String?
    @Persisted var ingredient4: String?
    @Persisted var ingredient5: String?
    @Persisted var ingredient6: String?
    @Persisted var ingredient7: String?
    @Persisted var ingredient8: String?
    @Persisted var ingredient9: String?
    @Persisted var measure1: String?
    @Persisted var measure2: String?
    @Persisted var measure3: String?
    @Persisted var measure4: String?
    @Persisted var measure5: String?
    @Persisted var measure6: String?
    @Persisted var measure7: String?
    @Persisted var measure8: String?
    @Persisted var measure9: String?

    var mealThumbURL: URL? {
        get { mealThumb.flatMap {URL(string: $0)} }  // Convert to URL when accessed
        set { mealThumb = newValue?.absoluteString ?? "" }  // Convert URL to String before saving
    }

    convenience init(meal: MealEntity) {
        self.init()
        self.id = meal.idMeal
        self.meal = meal.strMeal
        self.mealThumbURL = meal.strMealThumb
        self.category = meal.strCategory
        self.instructions = meal.strInstructions
        self.stringYoutube = meal.strYoutube
        self.ingredient1 = meal.strIngredient1
        self.ingredient2 = meal.strIngredient2
        self.ingredient3 = meal.strIngredient3
        self.ingredient4 = meal.strIngredient4
        self.ingredient5 = meal.strIngredient5
        self.ingredient6 = meal.strIngredient6
        self.ingredient7 = meal.strIngredient7
        self.ingredient8 = meal.strIngredient8
        self.ingredient9 = meal.strIngredient9
        self.measure1 = meal.strMeasure1
        self.measure2 = meal.strMeasure2
        self.measure3 = meal.strMeasure3
        self.measure4 = meal.strMeasure4
        self.measure5 = meal.strMeasure5
        self.measure6 = meal.strMeasure6
        self.measure7 = meal.strMeasure7
        self.measure8 = meal.strMeasure8
        self.measure9 = meal.strMeasure9
    }

    func update(from meal: MealEntity) {
        self.id = meal.idMeal
        self.meal = meal.strMeal
        self.mealThumbURL = meal.strMealThumb
        self.category = meal.strCategory
        self.instructions = meal.strInstructions
        self.stringYoutube = meal.strYoutube
        self.ingredient1 = meal.strIngredient1
        self.ingredient2 = meal.strIngredient2
        self.ingredient3 = meal.strIngredient3
        self.ingredient4 = meal.strIngredient4
        self.ingredient5 = meal.strIngredient5
        self.ingredient6 = meal.strIngredient6
        self.ingredient7 = meal.strIngredient7
        self.ingredient8 = meal.strIngredient8
        self.ingredient9 = meal.strIngredient9
        self.measure1 = meal.strMeasure1
        self.measure2 = meal.strMeasure2
        self.measure3 = meal.strMeasure3
        self.measure4 = meal.strMeasure4
        self.measure5 = meal.strMeasure5
        self.measure6 = meal.strMeasure6
        self.measure7 = meal.strMeasure7
        self.measure8 = meal.strMeasure8
        self.measure9 = meal.strMeasure9
    }
}
