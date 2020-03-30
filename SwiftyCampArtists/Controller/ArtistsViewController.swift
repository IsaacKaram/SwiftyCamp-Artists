//
//  ArtistsViewController.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/29/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController {

    //MARKS:- Properties & Outlets
    @IBOutlet weak var artistsTableView: UITableView!
    let filename = "artists"
    let artistCellIdentifier = "customArtistCell"
    
    var artistsList = [Artist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistsList = Network.loadJsonFile(from: filename)
        setupNavBar(with: "Swifty Camp")
        configArtistsTableView()
    }
    
    
    // config TableView
    func configArtistsTableView(){
        //setup tableview delegate and datasource
        artistsTableView.delegate = self
        artistsTableView.dataSource = self
        
        // register WellCell
        artistsTableView.register(UINib(nibName: "ArtistTViewCell", bundle: nil), forCellReuseIdentifier: artistCellIdentifier)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoArtistWorks" {
          let destVC : ArtistWorksViewController = segue.destination as! ArtistWorksViewController
            guard let cell = sender as? ArtistTViewCell else { return }
            let index =  artistsTableView.indexPath(for: cell)
            guard let artistIndex = index?.row else{ return}
            destVC.worksList = artistsList[artistIndex].works
            destVC.artistName = artistsList[artistIndex].name
          }
    }
    

}

extension ArtistsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = artistsTableView.dequeueReusableCell(withIdentifier: artistCellIdentifier, for: indexPath) as! ArtistTViewCell
        
        let artist = artistsList[indexPath.row]
        cell.artistImage.image = UIImage(named: artist.image)
        cell.artistLabelName.text = artist.name
        cell.artistBioLabel.text = artist.bio
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = artistsTableView.cellForRow(at: indexPath) as? ArtistTViewCell{
            self.performSegue(withIdentifier: "gotoArtistWorks", sender: cell)
        }
        
    }
    
}

