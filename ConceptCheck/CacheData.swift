//
//  CacheData.swift
//  ConceptCheck
//
//  Created by vineet singh on 14/02/21.
//

import Foundation

class CacheData: NSObject {
    var covidData = CovidData.shared
    var cache : NSCache<NSString, CovidData>
    
    override init() {
        self.cache = covidData.getCache()
        super.init()
    }
    
    // only till the app terminate, not saved on the disk
    func askToAPIForData() {
        //print(cache.object(forKey: covidData.getKey()))
        
        if let cacheVer = cache.object(forKey: covidData.getKey()) {
            self.covidData = cacheVer
        } else {
            self.covidData = CovidData.shared
            cache.setObject(covidData, forKey: covidData.getKey())
        }
        
        self.covidData.fetchCovidData()
    }
}
