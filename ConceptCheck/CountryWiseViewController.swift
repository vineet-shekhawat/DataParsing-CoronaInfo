//
//  CountryWiseViewController.swift
//  ConceptCheck
//
//  Created by vineet singh on 13/02/21.
//

import UIKit

class CountryWiseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableVIew: UITableView!
    let covidInfo = CovidData.shared
    var continentIndex: Int?
    let cacheData = CacheData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cacheData.askToAPIForData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let index = continentIndex {
        return covidInfo.worldCoronaInfo[index].countrylist.count
        }
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView).dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryWiseCell
        if let index = continentIndex {
            if index < 6 {
                cell.countryName.text = covidInfo.worldCoronaInfo[index].countrylist[indexPath.row].country
                cell.active.text = String(covidInfo.worldCoronaInfo[index].countrylist[indexPath.row].activeCases)
            }
        }
        return cell
    }

}
