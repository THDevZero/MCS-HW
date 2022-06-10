//
//  LibraryViewController.swift
//  MusicApp2
//
//  Created by Consultant on 6/10/22.
//

import UIKit

extension LibraryTableViewController {
    func fetchData() -> [Artist] {
        var artists = [
            Artist(image: UIImage(named: "PoloG"), title: "PoloG", desc: Desc.poloG),
            Artist(image: UIImage(named: "beyonce"), title: "Beyonce", desc: Desc.beyonce),
            Artist(image: UIImage(named: "biggie"), title: "Biggie", desc: Desc.bigge),
            Artist(image: UIImage(named: "gucci"), title: "Gucci", desc: Desc.gucci),
            Artist(image: UIImage(named: "tupac"), title: "Tupac", desc: Desc.tupac),
        ]
        return artists
    }
}

class LibraryTableViewController: UITableViewController {
    var artists:[Artist] = []
    //let musicBar = UIImageView()

    @IBOutlet weak var musicBar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.title = "Artists"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        artists = fetchData()
        tableView.rowHeight = 100
        tableView.backgroundColor = .systemGray5
        tableView.isScrollEnabled = true
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = artists[indexPath.row]
        performSegue(withIdentifier: "gotoDetailVC", sender: artist)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return artists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistsCell", for: indexPath) as! ArtistTableViewCell
        let artist = artists[indexPath.row]
        cell.selectionStyle = ArtistTableViewCell.SelectionStyle.none
        cell.set(artist)
    
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let artist = sender as! Artist
        let controller = segue.destination as! DetailViewController
        controller.artist = artist
        
        
        
    }
    
}
