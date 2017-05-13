//
//  ViewController.swift
//  Endpoint
//
//  Created by adam smith on 5/11/17.
//  Copyright © 2017 adamontherun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PlanetsJSONClient.fetchPlanets { (result) in
            switch result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

