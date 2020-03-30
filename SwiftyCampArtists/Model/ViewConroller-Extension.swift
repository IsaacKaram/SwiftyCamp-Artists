//
//  ViewConroller-Extension.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

extension UIViewController{
  func setupNavBar(with title : String){
    let lblTitle = UILabel()
    let titleAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 20),
                                                    .foregroundColor: UIColor.white]
    let attributeString = NSMutableAttributedString(string: title, attributes: titleAttribute)
    lblTitle.attributedText = attributeString

    lblTitle.sizeToFit()
    navigationItem.titleView = lblTitle
    }
}
