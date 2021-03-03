//
//  ViewController.swift
//  TestingPractice
//
//  Created by VINEET'S on 03/10/20.
//  Copyright © 2020 VINEET'S. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let continents: [String] = ["Africa", "Asia", "Australia/Oceania", "Europe", "North America", "South America"]
    let cacheData = CacheData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continentToCountry" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let nextVC = segue.destination as? CountryWiseViewController {
                    nextVC.continentIndex = indexPath.row
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.cacheData.askToAPIForData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView).dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.continents[indexPath.row]
        return cell
    }
    
 
}
