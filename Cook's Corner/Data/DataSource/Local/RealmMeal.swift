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

    convenience init(meal: Meal) {
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

    func update(from meal: Meal) {
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

    func toDomain() -> Meal {
        return Meal(
            idMeal: self.id,
            strMeal: self.meal,
            strCategory: self.category,
            strInstructions: self.instructions,
            strMealThumb: self.mealThumbURL,
            strYoutube: self.stringYoutube,
            strIngredient1: self.ingredient1,
            strIngredient2: self.ingredient2,
            strIngredient3: self.ingredient3,
            strIngredient4: self.ingredient4,
            strIngredient5: self.ingredient5,
            strIngredient6: self.ingredient6,
            strIngredient7: self.ingredient7,
            strIngredient8: self.ingredient8,
            strIngredient9: self.ingredient9,

            strMeasure1: self.measure1,
            strMeasure2: self.measure2,
            strMeasure3: self.measure3,
            strMeasure4: self.measure4,
            strMeasure5: self.measure5,
            strMeasure6: self.measure6,
            strMeasure7: self.measure7,
            strMeasure8: self.measure8,
            strMeasure9: self.measure9
        )
    }

    static func toRealm(meal: Meal) -> RealmMeal {
        let realmMeal = RealmMeal()

        realmMeal.meal = meal.strMeal
        realmMeal.mealThumbURL = meal.strMealThumb
        realmMeal.category = meal.strCategory
        realmMeal.instructions = meal.strInstructions
        realmMeal.stringYoutube = meal.strYoutube

        realmMeal.ingredient1 = meal.strIngredient1
        realmMeal.ingredient2 = meal.strIngredient2
        realmMeal.ingredient3 = meal.strIngredient3
        realmMeal.ingredient4 = meal.strIngredient4
        realmMeal.ingredient5 = meal.strIngredient5
        realmMeal.ingredient6 = meal.strIngredient6
        realmMeal.ingredient7 = meal.strIngredient7
        realmMeal.ingredient8 = meal.strIngredient8
        realmMeal.ingredient9 = meal.strIngredient9

        realmMeal.measure1 = meal.strMeasure1
        realmMeal.measure2 =  meal.strMeasure2
        realmMeal.measure3 =  meal.strMeasure3
        realmMeal.measure4 =  meal.strMeasure4
        realmMeal.measure5 =  meal.strMeasure5
        realmMeal.measure6 =  meal.strMeasure6
        realmMeal.measure7 =  meal.strMeasure7
        realmMeal.measure8 =  meal.strMeasure8
        realmMeal.measure9 =  meal.strMeasure9

        return realmMeal
    }
}
