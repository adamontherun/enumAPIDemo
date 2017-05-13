//
//  StarwarsJSONClientProtocol.swift
//  Endpoint
//
//  Created by adam smith on 5/13/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import Foundation

/// All of the StarWars endpoints return a [String : Any] json object
typealias StarWarsJSONCompletionHandler = (Result<[String : Any]>)->()

/// The base URL for connecting to the StarWars json endpoint
let baseURL = "http://swapi.co/api"

/// Types that conform to this can return results from the StarWars JSON API
protocol StarwarsJSONClient {
    
    static func handle(result: Result<Any>, completionHandler: StarWarsJSONCompletionHandler)
    static func handleSuccessfulAPICall(for json: Any, completionHandler: StarWarsJSONCompletionHandler)
    static func handleFailedAPICall(for error: Error, completionHandler: StarWarsJSONCompletionHandler)
}

extension StarwarsJSONClient {
    
    static func handle(result: Result<Any>, completionHandler: StarWarsJSONCompletionHandler) {
        switch result {
        case .success(let json):
            self.handleSuccessfulAPICall(for: json, completionHandler: completionHandler)
        case .failure(let error):
            self.handleFailedAPICall(for: error, completionHandler: completionHandler)
        }
    }
    
    static func handleSuccessfulAPICall(for json: Any, completionHandler: StarWarsJSONCompletionHandler) {
        guard let json = json as? [String : Any] else {
            let error = NetworkingError.badJSON
            handleFailedAPICall(for: error, completionHandler: completionHandler)
            return
        }
        completionHandler(Result.success(json))
    }
    
    static func handleFailedAPICall(for error: Error, completionHandler: StarWarsJSONCompletionHandler) {
        completionHandler(Result.failure(error))
    }
}
