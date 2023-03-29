////
////  FavoriteModelLogic.swift
////  BigBangApp
////
////  Created by Javier Etxarri on 22/3/23.
////
//
import SwiftUI
//
final class FavoriteModelLogic {
    static let shared = FavoriteModelLogic()
    let persistence = FavoriteModelPersistence.shared
    let episodesLogic = EpisodeModelLogic.shared

    private var favorites: [Int] {
        didSet {
            try? persistence.saveFavorites(ids: favorites)
            NotificationCenter.default.post(name: .favoritesChange, object: nil)
        }
    }

    init() {
        do {
            self.favorites = try persistence.getFavorites()
        } catch {
            self.favorites = []
        }
    }

    func getFavoritesRows() -> Int {
        favorites.count
    }

    func isFavorite(episode: Episode) -> Bool {
        favorites.contains(episode.id)
    }

    func toogleFavorite(episode: Episode) {
        if favorites.contains(episode.id) {
            favorites.removeAll(where: { $0 == episode.id })
        } else {
            favorites.append(episode.id)
        }
    }

    func getEpisodeFromIndexPath(indexPath: IndexPath) -> Episode? {
        let id = favorites[indexPath.row]

        return episodesLogic.getFirstEpisodeWithId(id)
    }
}
