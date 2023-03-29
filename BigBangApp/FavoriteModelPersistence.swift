//
//  FavoritesModelPersistence.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import Foundation

final class FavoriteModelPersistence {
    static let shared = FavoriteModelPersistence()

    let favoriteEpisodesDocument = URL.documentsDirectory.appending(path: "favoriteepisodes.json")

    func getFavorites() throws -> [Int] {
        if FileManager.default.fileExists(atPath: favoriteEpisodesDocument.path()) {
            let data = try Data(contentsOf: favoriteEpisodesDocument)
            return try JSONDecoder().decode(Favorite.self, from: data).ids
        } else {
            return []
        }
    }

    func saveFavorites(ids: [Int]) throws {
        let favorites = Favorite(ids: ids)
        let data = try JSONEncoder().encode(favorites)
        try data.write(to: favoriteEpisodesDocument, options: .atomic)
    }
}
