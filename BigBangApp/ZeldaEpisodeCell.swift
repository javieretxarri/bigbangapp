//
//  ZeldaEpisodeCell.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

class ZeldaEpisodeCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var episodeCover: UIImageView!
    @IBOutlet var number: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        name.text = nil
        number.text = nil
        episodeCover.image = nil
    }
}
