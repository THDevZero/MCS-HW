//
//  DetailViewController.swift
//  RickNMorty
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name:String?
    var imageData:String?

    @IBOutlet weak var backgroundIV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = name
        processImage(image: imageData!)
    }
    
    private func processImage(image:String) {
        let url = URL(string: image)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.backgroundIV.image = UIImage(data: data!)
                }
            }
        }
        .resume()
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
