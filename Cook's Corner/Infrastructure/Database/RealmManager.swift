//
//  RealmManager.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation
import Combine
import RealmSwift

protocol RealmManagerProtocol {
    func save<T: Object>(_ object: T) -> AnyPublisher<Void, Error>
    func fetch<T: Object>(_ type: T.Type) -> AnyPublisher<[T], Error>
    func fetchById<T: Object>(_ type: T.Type, id: String) -> AnyPublisher<T?, Error>
    func deleteById<T: Object>(_ type: T.Type, id: String) -> AnyPublisher<Void, Error>
    func isSaved<T: Object>(_ type: T.Type, id: String) -> AnyPublisher<Bool, Error>
}

final class RealmManager: RealmManagerProtocol {
    
    private let configuration: Realm.Configuration
    private let queue = DispatchQueue(label: "realm.queue")
    
    init(configuration: Realm.Configuration = .defaultConfiguration) {
        self.configuration = configuration
    }
    
    func save<T: Object>(_ object: T) -> AnyPublisher<Void, Error> {
        Future { promise in
            self.queue.async {
                do {
                    let realm = try Realm(configuration: self.configuration)
                    try realm.write {
                        realm.add(object, update: .modified)
                    }
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func fetch<T: Object>(_ type: T.Type) -> AnyPublisher<[T], Error> {
        Future { promise in
            self.queue.async {
                do {
                    let realm = try Realm(configuration: self.configuration)
                    let results = Array(realm.objects(type))
                    promise(.success(results))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func fetchById<T: Object>(_ type: T.Type, id: String) -> AnyPublisher<T?, Error> {
        Future { promise in
            self.queue.async {
                do {
                    let realm = try Realm(configuration: self.configuration)
                    let result = realm.object(ofType: type, forPrimaryKey: id)
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func deleteById<T: Object>(_ type: T.Type, id: String) -> AnyPublisher<Void, Error> {
        Future { promise in
            self.queue.async {
                do {
                    let realm = try Realm(configuration: self.configuration)
                    if let object = realm.object(ofType: type, forPrimaryKey: id) {
                        try realm.write {
                            realm.delete(object)
                        }
                    }
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func isSaved<T: Object>(_ type: T.Type, id: String) -> AnyPublisher<Bool, any Error> {
        Future { promise in
            self.queue.async {
                do {
                    let realm = try Realm(configuration: self.configuration)
                    if let _ = realm.object(ofType: type, forPrimaryKey: id) {
                        promise(.success(true))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
