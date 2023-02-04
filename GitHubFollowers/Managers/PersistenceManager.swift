//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 4.02.23.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys { static let favorites = "favorites" }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping(GHFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavories = favorites
                
                switch actionType {
               
                case .add:
                    guard !retrievedFavories.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrievedFavories.append(favorite)
               
                case .remove:
                    retrievedFavories.removeAll { $0.login == favorite.login }
                }
                
                completed(saveToFavorites(favorites: favorites))

            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GHFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey:Keys.favorites) as? Data else {
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
    
    static func saveToFavorites(favorites:[Follower]) -> GHFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
