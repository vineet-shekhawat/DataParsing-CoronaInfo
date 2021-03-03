//
//  DataModel.swift
//  ConceptCheck
//
//  Created by vineet singh on 13/02/21.
//

import Foundation

struct WelcomeElement: Codable {
    let updated: Int
    let country: String
    let countryInfo: CountryInfo
    let cases, todayCases, deaths, todayDeaths: Int
    let recovered, todayRecovered, active, critical: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Double
    let tests, testsPerOneMillion, population: Int
    let continent: Continent
    let oneCasePerPeople, oneDeathPerPeople, oneTestPerPeople: Int
    let activePerOneMillion, recoveredPerOneMillion, criticalPerOneMillion: Double
}

enum Continent: String, Codable {
    case africa = "Africa"
    case asia = "Asia"
    case australiaOceania = "Australia/Oceania"
    case empty = ""
    case europe = "Europe"
    case northAmerica = "North America"
    case southAmerica = "South America"
}

// MARK: - CountryInfo
struct CountryInfo: Codable {
    let id: Int?
    let iso2, iso3: String?
    let lat, long: Double
    let flag: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iso2, iso3, lat, long, flag
    }
}
