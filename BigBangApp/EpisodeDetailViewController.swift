//
//  EpisodeDetailViewController.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

class EpisodeDetailViewController: UITableViewController {
    var selectedEpisode: Episode?

    @IBOutlet var image: UIImageView!
    @IBOutlet var titleEpisode: UILabel!
    @IBOutlet var episode: UILabel!
    @IBOutlet var season: UILabel!
    @IBOutlet var airDate: UILabel!
    @IBOutlet var summary: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedEpisode {
            image.image = UIImage(named: selectedEpisode.image)
            titleEpisode.text = selectedEpisode.name
            airDate.text = selectedEpisode.date
            season.text = String(selectedEpisode.season)
            episode.text = String(selectedEpisode.number)
            summary.text = selectedEpisode.summary
            summary.isUserInteractionEnabled = true
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        1
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }
}
