//
//  CovidData.swift
//  ConceptCheck
//
//  Created by vineet singh on 13/02/21.
//

import Foundation

final class CovidData: NSObject {
    
    static let shared = CovidData()
    var worldCoronaInfo = [ContinentWiseInfo]()
    private let url = "https://corona.lmao.ninja/v2/countries?yesterday&sort"
    
    private let keyForCovidData = "key_For_World_Covid_Info"
    let cache = NSCache<NSString, CovidData>()
    
    override private init() {
        super.init()
    }
    
    func getCache() ->NSCache<NSString, CovidData> {
        return cache
    }
    
    func getKey() -> NSString {
        return keyForCovidData as NSString
    }
    
    func fetchCovidData() {
        self.getData(url: url)
        self.getContinentWiseInfo()
    }

    private func getContinentWiseInfo() {
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.africa, countrylist: []))
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.asia, countrylist: []))
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.australiaOceania, countrylist: []))
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.europe, countrylist: []))
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.northAmerica, countrylist: []))
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.southAmerica, countrylist: []))
        self.worldCoronaInfo.append(ContinentWiseInfo(continent: Continent.empty, countrylist: []))
    }
    
    private func getIndex(continent: Continent) -> Int {
        switch continent {
        case .africa:
            return 0
        case .asia:
            return 1
        case .australiaOceania:
            return 2
        case .europe:
            return 3
        case .northAmerica:
            return 4
        case .southAmerica:
            return 5
        default:
            return 6
        }
    }
    
    private func getData(url: String) {
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                return
            }
            var results: [WelcomeElement]?
            
            do {
                results = try JSONDecoder().decode([WelcomeElement].self, from: data)
            }catch {
                print("error occured \(error.localizedDescription)")
            }
            
            guard let result = results else {
                return
            }
            for ele in result {
                self.worldCoronaInfo[self.getIndex(continent: ele.continent)].addCountry(task: CountryWiseInfo(country: ele.country, activeCases: ele.active))
            }
        }).resume()
    }
    
}
