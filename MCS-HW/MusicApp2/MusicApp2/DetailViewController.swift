//
//  DetailViewController.swift
//  MusicApp2
//
//  Created by Consultant on 6/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    var artist:Artist?
    
    @IBOutlet weak var artistIV: UIImageView!
    @IBOutlet weak var artistTitle: UILabel!
    @IBOutlet weak var artistDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistTitle.text = artist?.title
        artistDesc.text = artist?.desc
        artistIV.image = artist?.image
        artistDesc.numberOfLines = 0
        artistDesc.sizeToFit()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
