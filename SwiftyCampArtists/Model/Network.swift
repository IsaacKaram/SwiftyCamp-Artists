//
//  Network.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Network{
    
    internal static func loadJsonFile(from filename : String) ->[Artist] {
        if let url = getUrlOfJsonFile(from: filename ) {
            do {
                let data = try Data(contentsOf: url, options: .dataReadingMapped)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Artists.self, from: data)
                return jsonData.artists
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
            return [Artist]()
    }
    
   private static func getUrlOfJsonFile(from filename : String) -> URL?{
        return Bundle.main.url(forResource: filename, withExtension: "json")
    }
    
}
