//
//  Result.swift
//  Endpoint
//
//  Created by adam smith on 5/11/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import Foundation

/// The response from a method that can result in either a successful or failed state
public enum Result<T> {
    case success(T)
    case failure(Error)
}
