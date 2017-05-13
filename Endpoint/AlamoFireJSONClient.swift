//
//  StarWarsJSONClient.swift
//  Endpoint
//
//  Created by adam smith on 5/11/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import Foundation
import Alamofire

/// The Reponse type from Alamofire is Any
typealias AlamofireJSONCompletionHandler = (Result<Any>)->()

/// Used to connect to any JSON API that is modeled by an AlamofireEndpoint
enum AlamoFireJSONClient {
    
    static func makeAPICall(to endPoint: AlamofireEndPoint, completionHandler:@escaping AlamofireJSONCompletionHandler) {
        Alamofire.request(endPoint.url, method: endPoint.httpMethod, parameters: endPoint.parameters, encoding: endPoint.encoding).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
               completionHandler(Result.success(value))
            case .failure(let error):
                completionHandler(Result.failure(error))
            }
        }
    }
}
