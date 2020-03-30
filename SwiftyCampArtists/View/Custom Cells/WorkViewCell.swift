//
//  WorkViewCellTableViewCell.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class WorkViewCell: UITableViewCell {

    //MARKS:- Outlets & Properties
    @IBOutlet weak var workImg: UIImageView!
    @IBOutlet weak var workNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
