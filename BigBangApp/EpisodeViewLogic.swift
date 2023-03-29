//
//  EpisodeViewLogic.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import PhotosUI
import UIKit

final class EpisodeViewLogic {
    static let shared = EpisodeViewLogic()

    let modelLogic = EpisodeModelLogic.shared
    let persistence = EpisodeModelPersistence.shared

    func getSearchBar() -> UISearchController {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Enter a score name"
        search.obscuresBackgroundDuringPresentation = false
        return search
    }
}
