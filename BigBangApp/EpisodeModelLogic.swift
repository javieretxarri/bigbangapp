//
//  EpisodeModelLogic.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import SwiftUI

final class EpisodeModelLogic {
    static let shared = EpisodeModelLogic()
    let persistence = EpisodeModelPersistence.shared

    var snapshot: NSDiffableDataSourceSnapshot<String, Episode> {
        var snapshot = NSDiffableDataSourceSnapshot<String, Episode>()
        snapshot.appendSections(seasons.map { "season\($0)" })
        for season in seasons {
            let episodesSnapshot = filteredEpisodes.filter { episode in
                episode.season == season
            }.sorted { s1, s2 in
                s1.number < s2.number
            }
            snapshot.appendItems(episodesSnapshot, toSection: "season\(season)")
        }
        return snapshot
    }

    private var episodes: [Episode] {
        didSet {
            try? persistence.saveEpisodes(episodes: episodes)
        }
    }

    var search = ""
    var filteredEpisodes: [Episode] {
        episodes.filter {
            if search.isEmpty {
                return true
            } else {
                return $0.name.lowercased().contains(search)
            }
        }
    }

    var seasons: [Int] {
        Array(Set(episodes.map(\.season))).sorted()
    }

    init() {
        do {
            self.episodes = try persistence.getEpisodes()
        } catch {
            self.episodes = []
        }
    }

    func getRows() -> Int {
        filteredEpisodes.count
    }

    func getFirstEpisodeWithId(_ id: Int) -> Episode? {
        episodes.first { episode in
            episode.id == id
        }
    }
}
