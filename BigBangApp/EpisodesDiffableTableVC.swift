//
//  EpisodesDiffableTableVC.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

class EpisodesDiffableTableVC: UITableViewController, UISearchResultsUpdating {
    let episodeModelLogic = EpisodeModelLogic.shared
    let episodeViewLogic = EpisodeViewLogic.shared
    let favoriteModelLogic = FavoriteModelLogic.shared

    lazy var dataSource: EpisodesDiffableDatasource = .init(tableView: tableView) { table, indexPath, episode in
        let cell = table.dequeueReusableCell(withIdentifier: "zelda", for: indexPath) as? ZeldaEpisodeCell
        cell?.name.text = episode.name
        cell?.number.text = "Chapter number \(episode.number)"
        cell?.episodeCover.image = UIImage(named: episode.image)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        dataSource.apply(episodeModelLogic.snapshot)

        let searchController = episodeViewLogic.getSearchBar()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController

        navigationItem.hidesSearchBarWhenScrolling = true
        tableView.contentOffset = CGPoint(x: 0, y: 2)

        tableView.delegate = self
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 90))

        let imageView = UIImageView(frame: CGRect(x: 20, y: 5, width: 142, height: 90))
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        let imageName = dataSource.snapshot().sectionIdentifiers[section]
        imageView.image = UIImage(named: imageName)
        headerView.addSubview(imageView)

        let label = UILabel(frame: CGRect(x: 210, y: 0, width: 150, height: 100))
        label.text = "Season \(section + 1)"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)

        headerView.addSubview(label)
        headerView.backgroundColor = .white

        return headerView
    }

    @IBSegueAction func showDetail(_ coder: NSCoder) -> EpisodeDetailViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }

        let detail = EpisodeDetailViewController(coder: coder)
        detail?.selectedEpisode = dataSource.itemIdentifier(for: indexPath)
        return detail
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text else { return }
        episodeModelLogic.search = search.lowercased()
        dataSource.apply(episodeModelLogic.snapshot, animatingDifferences: true)
    }

    @IBAction func back(_ segue: UIStoryboardSegue) {
        dataSource.apply(episodeModelLogic.snapshot)
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = dataSource.itemIdentifier(for: indexPath) else { return nil }

        let isFavorite = favoriteModelLogic.isFavorite(episode: episode)
        let action = UIContextualAction(style: favoriteModelLogic.isFavorite(episode: episode) ? .destructive : .normal, title: "Favorited") { [self] _, _, handler in
            favoriteModelLogic.toogleFavorite(episode: episode)
            handler(true)
        }
        action.image = UIImage(systemName: isFavorite ? "star" : "star.fill")
        action.backgroundColor = isFavorite ? .red : .systemGreen
        return UISwipeActionsConfiguration(actions: [action])
    }
}
