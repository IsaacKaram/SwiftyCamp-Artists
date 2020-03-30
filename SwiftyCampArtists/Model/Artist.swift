//
//  Artist.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct Artist : Codable {
    var name : String
    var bio : String
    var image : String
    var works : [Works]

}
