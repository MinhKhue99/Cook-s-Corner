//
//  MealMapper.swift
//  Cook's Corner
//
//  Created by KhuePM on 23/3/25.
//

import Foundation

class MealMapper {
    static func toDMain(_ realmMeal: RealmMeal) -> MealEntity {
        return MealEntity(
            idMeal: realmMeal.id,
            strMeal: realmMeal.meal,
            strCategory: realmMeal.category,
            strInstructions: realmMeal.instructions,
            strMealThumb: realmMeal.mealThumbURL,
            strYoutube: realmMeal.stringYoutube,
            strIngredient1: realmMeal.ingredient1,
            strIngredient2: realmMeal.ingredient2,
            strIngredient3: realmMeal.ingredient3,
            strIngredient4: realmMeal.ingredient4,
            strIngredient5: realmMeal.ingredient5,
            strIngredient6: realmMeal.ingredient6,
            strIngredient7: realmMeal.ingredient7,
            strIngredient8: realmMeal.ingredient8,
            strIngredient9: realmMeal.ingredient9,

            strMeasure1: realmMeal.measure1,
            strMeasure2: realmMeal.measure2,
            strMeasure3: realmMeal.measure3,
            strMeasure4: realmMeal.measure4,
            strMeasure5: realmMeal.measure5,
            strMeasure6: realmMeal.measure6,
            strMeasure7: realmMeal.measure7,
            strMeasure8: realmMeal.measure8,
            strMeasure9: realmMeal.measure9
        )
    }

    static func toDoMain(_ category: CategoryDTO) -> CategoryEntity {
         return CategoryEntity(
            idCategory: category.idCategory,
            strCategory: category.strCategory,
            strCategoryThumb: category.strCategoryThumb,
            strCategoryDescription: category.strCategoryDescription
        )
    }

    static func toDoMain(_ meal: MealDTO) -> MealEntity {
        MealEntity(
            idMeal: meal.idMeal,
            strMeal: meal.strMeal,
            strCategory: meal.strCategory,
            strInstructions: meal.strInstructions,
            strMealThumb: meal.strMealThumb,
            strYoutube: meal.strYoutube,
            strIngredient1: meal.strIngredient1,
            strIngredient2: meal.strIngredient2,
            strIngredient3: meal.strIngredient3,
            strIngredient4: meal.strIngredient4,
            strIngredient5: meal.strIngredient5,
            strIngredient6: meal.strIngredient6,
            strIngredient7: meal.strIngredient7,
            strIngredient8: meal.strIngredient8,
            strIngredient9: meal.strIngredient9,

            strMeasure1: meal.strMeasure1,
            strMeasure2: meal.strMeasure2,
            strMeasure3: meal.strMeasure3,
            strMeasure4: meal.strMeasure4,
            strMeasure5: meal.strMeasure5,
            strMeasure6: meal.strMeasure6,
            strMeasure7: meal.strMeasure7,
            strMeasure8: meal.strMeasure8,
            strMeasure9: meal.strMeasure9
        )
    }

    static func toRealm(_ meal: MealEntity) -> RealmMeal {
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
