//
//  EpisodeModelPersistence.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

final class EpisodeModelPersistence {
    static let shared = EpisodeModelPersistence()

    let episodesBundleURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    let episodesDocuments = URL.documentsDirectory.appending(path: "episodesdata.json")
    let favoriteEpisodesDocument = URL.documentsDirectory.appending(path: "favoriteepisodes.json")

    func getEpisodes() throws -> [Episode] {
        if FileManager.default.fileExists(atPath: episodesDocuments.path()) {
            let data = try Data(contentsOf: episodesDocuments)
            return try JSONDecoder().decode([Episode].self, from: data)
        } else {
            let data = try Data(contentsOf: episodesBundleURL)
            return try JSONDecoder().decode([Episode].self, from: data)
        }
    }

    func saveEpisodes(episodes: [Episode]) throws {
        let data = try JSONEncoder().encode(episodes)
        try data.write(to: episodesDocuments, options: .atomic)
    }
}
