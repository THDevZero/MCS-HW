//
//  ViewController.swift
//  MusicApp2
//
//  Created by Consultant on 6/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundIV.loadGif(name: "giphy")
    }


}

