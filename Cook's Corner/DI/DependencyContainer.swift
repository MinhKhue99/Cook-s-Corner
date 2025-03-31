//
//  DependencyContainer.swift
//  Cook's Corner
//
//  Created by KhuePM on 25/3/25.
//

import RealmSwift

class DependencyContainer {
    private var dependencies: [String: Any] = [:]

    init() {
        setupDependencies()
    }

    private func setupDependencies() {
        let realm = try! Realm()

        let apiService = APIService()
        let networkClient = NetworkClient(apiService: apiService)
        let realmManager = MealRealmManager(realm: realm)
        let mealRepository = MealRepositoryImpl(networkClient: networkClient, realmManager: realmManager)

        // Register instances instead of closures to avoid early resolution issues
        register(APIService.self, instance: apiService)
        register(NetworkClient.self, instance: networkClient)
        register(MealRealmManager.self, instance: realmManager)
        register(MealRepository.self, instance: mealRepository)

        register(GetAllCategoriesUseCase.self, instance: GetAllCategoriesUseCase(repository: mealRepository))
        register(GetMealsByCategoryUseCase.self, instance: GetMealsByCategoryUseCase(repository: mealRepository))
        register(SearchMealUseCase.self, instance: SearchMealUseCase(repository: mealRepository))
        register(SaveMealUseCase.self, instance: SaveMealUseCase(repository: mealRepository))
        register(DeleteMealUseCase.self, instance: DeleteMealUseCase(repository: mealRepository))
        register(GetAllSavedMealsUseCase.self, instance: GetAllSavedMealsUseCase(repository: mealRepository))
        register(CheckFavoriteUseCase.self, instance: CheckFavoriteUseCase(repository: mealRepository))
    }

    func register<T>(_ type: T.Type, instance: T) {
        let key = String(describing: type)
        dependencies[key] = instance
    }

    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        return dependencies[key] as? T
    }
}
