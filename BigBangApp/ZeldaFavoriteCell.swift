//
//  ZeldaFavoriteCell.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

class ZeldaFavoriteCell: UICollectionViewCell {
    @IBOutlet var cover: UIImageView!

    override func awakeFromNib() {
        cover.layer.cornerRadius = 10
    }

    override func prepareForReuse() {
        cover.image = nil
    }
}
