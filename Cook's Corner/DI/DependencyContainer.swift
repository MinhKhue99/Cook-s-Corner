//
//  DependencyContainer.swift
//  Cook's Corner
//
//  Created by KhuePM on 25/3/25.
//

import RealmSwift
import Swinject
import SwiftUI

class DependencyContainer {
    static let shared = DependencyContainer()
    let container = Container()

    private init() {
        registerDependencies()
    }

    func resolve<T>(_ type: T.Type) -> T {
        guard let resolved = container.resolve(type) else {
            fatalError("Dependency of type \(type) has not been registered.")
        }
        return resolved
    }

    // MARK: - Registration Entry Point
    private func registerDependencies() {
        registerServices()
        registerDataSources()
        registerRepositories()
        registerUseCases()
        registerViewModels()
        registerCoordinators()
    }

    // MARK:  Service
    func registerServices() {
        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }.inObjectScope(.container)
    }

    // MARK:  DataSource
    func registerDataSources() {
        container.register(RemoteDataSourceProtocol.self) {resolver in
            RemoteDataSource(networkService: resolver.resolve(NetworkServiceProtocol.self)!)
        }.inObjectScope(.container)

        container.register(Realm.Configuration.self) { _ in
            Realm.Configuration.defaultConfiguration
        }

        container.register(RealmManagerProtocol.self) { resolver in
            let config = resolver.resolve(Realm.Configuration.self)!
            return RealmManager(configuration: config)
        }

        container.register(LocalDataSourceProtocol.self) {resolver in
            LocalDataSource(realmManager: resolver.resolve(RealmManagerProtocol.self)!)
        }.inObjectScope(.container)
    }

    // MARK:  Repository
    func registerRepositories() {
        container.register(MealRepositoryProtocol.self) { resolver in
            MealRepository(
                localDataSource: resolver.resolve(LocalDataSourceProtocol.self)!,
                remoteDataSource: resolver.resolve(RemoteDataSourceProtocol.self)!
            )
        }.inObjectScope(.container)
    }

    // MARK:  UseCase
    func registerUseCases() {
        container.register(GetAllCategoriesUseCaseProtocol.self) { resolver in
            GetAllCategoriesUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }

        container.register(GetMealsByCategoryUseCaseProtocol.self) { resolver in
            GetMealsByCategoryUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }

        container.register(SearchMealUseCaseProtocol.self) { resolver in
            SearchMealUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }

        container.register(SaveMealUseCaseProtocol.self) { resolver in
            SaveMealUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }

        container.register(DeleteMealUseCaseProtocol.self) { resolver in
            DeleteMealUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }

        container.register(GetAllSavedMealsUseCaseProtocol.self) { resolver in
            GetAllSavedMealsUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }

        container.register(CheckFavoriteUseCaseProtocol.self) { resolver in
            CheckFavoriteUseCase(repository: resolver.resolve(MealRepositoryProtocol.self)!)
        }
    }

    // MARK:  ViewModel
    func registerViewModels() {
        container.register(MealViewModel.self) { resolver in
            MealViewModel(
                getAllCategoriesUseCase: resolver.resolve(GetAllCategoriesUseCaseProtocol.self)!,
                getMealsByCategoryUseCase: resolver.resolve(GetMealsByCategoryUseCaseProtocol.self)!,
                searchMealUseCase: resolver.resolve(SearchMealUseCaseProtocol.self)!,
                saveMealUseCase: resolver.resolve(SaveMealUseCaseProtocol.self)!,
                deleteMealUseCase: resolver.resolve(DeleteMealUseCaseProtocol.self)!,
                getAllSavedMealUseCase: resolver.resolve(GetAllSavedMealsUseCaseProtocol.self)!,
                checkFavoriteUseCase: resolver.resolve(CheckFavoriteUseCaseProtocol.self)!)
        }
    }

    // MARK:  Coordinator
    func registerCoordinators() {
        container.register(AppCoordinator.self) { _ in
            AppCoordinator()
        }.inObjectScope(.container)
    }

    func makeHomeView() -> some View {
        let viewModel = container.resolve(MealViewModel.self)!
        return HomeView(viewmodel: viewModel)
    }

    func makeMealDetailViewForRecipe(for meal: Meal) -> some View {
        let viewModel = container.resolve(MealViewModel.self)!
        return MealDetailView(viewmodel: viewModel, meal: meal, shouldFetchMealDetails: true, shouldShowSaveButton: true)
    }

    func makeMealDetailViewForLocalData(for meal: Meal) -> some View {
        let viewModel = container.resolve(MealViewModel.self)!
        return MealDetailView(viewmodel: viewModel, meal: meal, shouldFetchMealDetails: false, shouldShowSaveButton: false)
    }

    func makeMealsSavedView() -> some View {

        let viewModel = container.resolve(MealViewModel.self)!
        return MealSavedView(viewmodel: viewModel)
    }

    func makeYoutubeView(for meal: Meal) -> some View {
        return YoutubeView( meal: meal)
    }

    func makeSearchView(for name: String) -> some View {
        let viewModel = container.resolve(MealViewModel.self)!
        return SearchView(viewmodel: viewModel, name: name)
    }
}
