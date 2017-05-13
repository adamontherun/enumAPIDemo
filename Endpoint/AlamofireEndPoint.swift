//
//  AlamofireEndPoint.swift
//  Endpoint
//
//  Created by adam smith on 5/11/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import Foundation
import Alamofire

/// Types that conform to this model an API endpoint that can be connected to via Alamofire
protocol AlamofireEndPoint {
    
    /// Provides all the information required to make the API call from Alamofire
    func provideValues()-> (url: String, httpMethod: HTTPMethod, parameters:[String:Any]?,encoding: ParameterEncoding)
    
    var url: URLConvertible         { get }
    var httpMethod: HTTPMethod      { get }
    var parameters: [String: Any]?  { get }
    var encoding: ParameterEncoding { get }
}

extension AlamofireEndPoint {
    
    var url: URLConvertible         { return provideValues().url }
    var httpMethod: HTTPMethod      { return provideValues().httpMethod }
    var parameters: [String: Any]?  { return provideValues().parameters }
    var encoding: ParameterEncoding { return provideValues().encoding }
}
