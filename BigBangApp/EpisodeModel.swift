//
//  EpisodeModel.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import Foundation

struct Episode: Codable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

extension Episode {
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: airdate)!
        return DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .none)
    }
}
