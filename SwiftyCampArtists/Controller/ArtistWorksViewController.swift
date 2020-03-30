//
//  ArtistWorksViewController.swift
//  SwiftyCampArtists
//
//  Created by Isaac Karam on 3/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ArtistWorksViewController: UIViewController {

    //MARKS:- Outlets & Properties
    @IBOutlet weak var artistWorksTableView: UITableView!
    
    let artistWorksCellIdentifier = "customArtistWorkCell"
    var worksList = [Works]()
    var artistName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar(with: artistName)
        configArtistWorksTableView()
    }
    
    // config TableView
    func configArtistWorksTableView(){
        //setup tableview delegate and datasource
        artistWorksTableView.delegate = self
        artistWorksTableView.dataSource = self
        
        // register WellCell
        artistWorksTableView.register(UINib(nibName: "WorkViewCell", bundle: nil), forCellReuseIdentifier: artistWorksCellIdentifier)
    }
    
    
   // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWorkInfo" {
          let destVC : WorkInfoViewController = segue.destination as! WorkInfoViewController
            guard let cell = sender as? WorkViewCell else { return }
            let index =  artistWorksTableView.indexPath(for: cell)
            guard let workIndex = index?.row else{ return}
            destVC.workTitle = worksList[workIndex].title
            destVC.workImageName = "0"
            destVC.workInformtion = worksList[workIndex].info
          }
    }

}

extension ArtistWorksViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = artistWorksTableView.dequeueReusableCell(withIdentifier: artistWorksCellIdentifier, for: indexPath) as! WorkViewCell
        
        let work = worksList[indexPath.row]
        cell.workImg.image = UIImage(named: "0")
        cell.workNameLbl.text = work.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = artistWorksTableView.cellForRow(at: indexPath) as? WorkViewCell{
            self.performSegue(withIdentifier: "showWorkInfo", sender: cell)
        }
        
    }
}
