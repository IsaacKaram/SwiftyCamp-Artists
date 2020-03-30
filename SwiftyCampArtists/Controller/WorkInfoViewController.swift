//
//  WorkInfoViewController.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class WorkInfoViewController: UIViewController {

    //MARKS:- Outlets & Properties.
    var workTitle : String = ""
    var workImageName : String = ""
    var workInformtion : String = ""
    
    @IBOutlet weak var workImg: UIImageView!
    @IBOutlet weak var workInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar(with: workTitle)
        setupView()
    }
    
    func setupView(){
        workImg.image = UIImage(named: workImageName)
        
        workInfo.sizeToFit()
        workInfo.text = workInformtion
        
    }

    
}
