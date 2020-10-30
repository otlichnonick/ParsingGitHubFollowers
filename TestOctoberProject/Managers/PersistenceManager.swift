//
//  PersistenceManager.swift
//  TestOctoberProject
//
//  Created by Антон on 28.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    private static var defaults = UserDefaults()
    
    enum Keys { static let favorites = "favorites" }
    
    static func updateWith(follower: Follower, and actionType: PersistenceActionType, completed: @escaping (ErrorMessage?) -> Void) {
        retrieveFavorites { (result) in
            switch result {
            case .success(var followers):
                
                switch actionType {
                case .add:
                    guard !followers.contains(follower) else {
                        completed(ErrorMessage.alreadyFavorited)
                        return
                    }
                    followers.append(follower)
                case .remove:
                    followers.removeAll { $0.login == follower.login }
                }
                
                completed(save(favorites: followers))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
        
    static func retrieveFavorites(completed: @escaping (Result<[Follower], ErrorMessage>) -> Void ) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> ErrorMessage? {
        do {
            let encoder = JSONEncoder()
            let encoderFavorites = try encoder.encode(favorites)
            defaults.set(encoderFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
