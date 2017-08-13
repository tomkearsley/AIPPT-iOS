//
//  ArtworkTableView.swift
//  Public Art
//
//  Created by Tom Kearsley on 26/06/17.
//  Copyright © 2017 Tom Kearsley. All rights reserved.
//

import UIKit

class ArtworkTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
}




class ArtworkTableView: UITableViewController {
    var persistentMapViewController:ViewController?
    @IBAction func returnTable(segue:UIStoryboardSegue) {
    }
    
    var artworks = ["Anchor Stone","Aotearoa","Atarangi","Bamboozled","Big Wave Territory",
                    "Black Figures","Cats","Collateral Damage","Frederic Alonzo Carrington",
                    "Halomoana","Light on the Land","Modest Angel","Mother of Earth","Ngä Hau e Whä","Southern Cross Mural","Swing","The Firkee-Wala","Tichi","Tukotahi","Wandering Willow Elephants","Wind Wand"]
    
    var artists = ["Filipe Tohi","MD Smither","Michael Parekowhai","Welch","John Reynolds","Sam Harrison","Don Driver","Dale Copland","Fridtjof Hadsen","Sopolemalama Filipe Tohi","Howard Tuffery","John Mclean","Ming-Sheng Wu","Te Kupenga Stone Symposium Society","Don Driver","Matsumi Matuoka","Lipika Sen & Prabhjyot","Kereama Taepa","Rangimarie Maori Aria Arts & Craft Society","Steve Manning","Len Lye"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artworks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtworkLabel", for: indexPath) as! ArtworkTableViewCell
        let artworkName = artworks[indexPath.row]
        let artistName = artists[indexPath.row]
        cell.title?.text = artworkName
        cell.artworkImage?.image = UIImage(named: artworkName)
        cell.artist?.text = artistName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrayAccess = ViewController()
        arrayAccess.updateList()
        let artworkList = arrayAccess.artworkList
        let artworkPin = artworkList[indexPath.row]
        self.performSegue(withIdentifier:"tablePush", sender: artworkPin)
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "tablePush" {
                if let artworkPin = sender as? Artwork {
                    let TableInfoView = segue.destination as! TableInfoView
                    TableInfoView.artworkPin = artworkPin
                }
            }
        }
        
        if let identifier = segue.identifier {
            if identifier == "mainBack" {
                if persistentMapViewController==nil {
                    persistentMapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Map") as? ViewController
                }
                navigationController?.pushViewController(persistentMapViewController!, animated: true)
            }
        }
    }
    
    
    
    
    
}


