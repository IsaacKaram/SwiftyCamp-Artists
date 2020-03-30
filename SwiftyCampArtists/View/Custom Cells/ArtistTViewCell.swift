//
//  ArtistTViewCell.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/29/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ArtistTViewCell: UITableViewCell {

//MARKS:- Propertiest & Outlets
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistLabelName: UILabel!
    @IBOutlet weak var artistBioLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
