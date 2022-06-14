//
//  ViewController.swift
//  RickNMorty
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selector: UISegmentedControl!
    
    var results:[[String:Any]] = []
    var info: [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        
        loadRickData()
        
        
    }
    
    func loadRickData() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=rick") else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? [String:Any]
                self.results = jsonData!["results"] as! [[String:Any]]
                self.info = jsonData!["info"] as! [String:Any]
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func loadMortyData() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=morty") else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                self.results = jsonData!["results"] as! [[String:Any]]
                self.info = jsonData!["info"] as! [String:Any]
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    @IBAction func PREV(_ sender: Any) {
        print("PREV")
    }
    @IBAction func NEXT(_ sender: Any) {
        print("NEXT")
    }
    

    @IBAction func selectedPressed(_ sender: UISegmentedControl) {
        switch selector.selectedSegmentIndex {
        case 0:
            loadRickData()
        case 1:
            loadMortyData()
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let orgin = sender as! [String:Any]
        let name = orgin["name"] as! String
        let imageData = orgin["image"] as! String
        
        let controller = segue.destination as! DetailViewController
        controller.name = name
        controller.imageData = imageData
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.results[indexPath.row])
        performSegue(withIdentifier: "gotoDetail", sender: self.results[indexPath.row])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text = self.results[indexPath.row]["name"] as! String
        cell.detailTextLabel?.text = self.results[indexPath.row]["type"] as! String
        return cell
    }
}

