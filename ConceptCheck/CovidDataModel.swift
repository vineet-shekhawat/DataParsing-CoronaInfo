//
//  CovidDataModel.swift
//  ConceptCheck
//
//  Created by vineet singh on 13/02/21.
//

import Foundation

struct ContinentWiseInfo: Codable{
    let continent: Continent
    var countrylist = [CountryWiseInfo]()
    mutating func addCountry(task: CountryWiseInfo) {
        self.countrylist.append(task)
    }
}

struct CountryWiseInfo: Codable{
    let country: String
    let activeCases: Int
}
