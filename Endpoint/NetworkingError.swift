//
//  NetworkingError.swift
//  Endpoint
//
//  Created by adam smith on 5/12/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import Foundation

enum NetworkingError: LocalizedError {
    
    case badJSON
    
    public var errorDescription: String? {
        switch self {
        case .badJSON:
            return NSLocalizedString("The data from the server came back in a way we couldn't use", comment: "")
        }
    }
}
