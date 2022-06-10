//
//  ArtistTableViewCell.swift
//  MusicApp2
//
//  Created by Consultant on 6/10/22.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    @IBOutlet weak var artistIV: UIImageView!
    @IBOutlet weak var artistTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(_ artist: Artist) {
        artistIV.image = artist.image
        artistTitle.text = artist.title
    }

}
