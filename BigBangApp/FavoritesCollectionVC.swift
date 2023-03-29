//
//  FavoritesCollectionVC.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class FavoritesCollectionVC: UICollectionViewController {
    let episodeModelLogic = EpisodeModelLogic.shared
    let favoriteModelLogic = FavoriteModelLogic.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        clearsSelectionOnViewWillAppear = false
        NotificationCenter.default.addObserver(forName: .favoritesChange,
                                               object: nil, queue: .main) { _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        favoriteModelLogic.getFavoritesRows()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "zelda", for: indexPath) as? ZeldaFavoriteCell,
              let episode = favoriteModelLogic.getEpisodeFromIndexPath(indexPath: indexPath)
        else {
            return UICollectionViewCell()
        }
        
        cell.cover.image = UIImage(named: episode.image)
        cell.seasonEpisode.text = "Season \(episode.season) - \(episode.number)"
        
        return cell
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favoritesChange, object: nil)
    }
}
