//
//  PlanetsJSONClient.swift
//  Endpoint
//
//  Created by adam smith on 5/11/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import Foundation

enum PlanetsJSONClient: StarwarsJSONClient {
    
    // MARK: - Public methods
    
    static func fetchPlanets(page: Int = 1, _ completionHandler: @escaping StarWarsJSONCompletionHandler) {
        AlamoFireJSONClient.makeAPICall(to: PlanetEndPoint.planets(page: page)) { (result) in
            self.handle(result: result, completionHandler: completionHandler)
        }
    }
    
    static func fetchPlanet(id: Int, _ completionHandler: @escaping StarWarsJSONCompletionHandler) {
        AlamoFireJSONClient.makeAPICall(to: PlanetEndPoint.planet(id: id)) { (result) in
            self.handle(result: result, completionHandler: completionHandler)
        }
    }
    
    static func searchPlanets(for term: String, page: Int = 1, _ completionHandler: @escaping StarWarsJSONCompletionHandler) {
        AlamoFireJSONClient.makeAPICall(to: PlanetEndPoint.searchPlanets(forTerm: term, page: page)) { (result) in
            self.handle(result: result, completionHandler: completionHandler)
        }
    }
}
