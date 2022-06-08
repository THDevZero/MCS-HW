//
//  ViewController.swift
//  InClassAssignmentWeek1Day4
//
//  Created by Consultant on 6/8/22.
//

import UIKit

class ViewController: UIViewController {
    let vc = TableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Main VC"
    }


    @IBAction func pressedButton(_ sender: UIButton) {
        vc.sportList = ["football", "baseball", "soccer", "lacrosse", "swimming", "skydiving", "racing", "rugby"]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

