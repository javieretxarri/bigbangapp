//
//  EpisodesDiffableDatasource.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

class EpisodesDiffableDatasource: UITableViewDiffableDataSource<String, Episode> {
    let modelLogic = EpisodeModelLogic.shared

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let snapshot = snapshot()
//        return snapshot.sectionIdentifiers[section]
//    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        imageView.image = UIImage(named: snapshot().sectionIdentifiers[section])
//        headerView.addSubview(imageView)
//        return headerView
//    }
}
