//
//  Configuration.swift
//  WeatherApp
//
//  Created by kumaran V on 06/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import Foundation

private struct Constants {
    
    static let APPID = "f2ad89e522c58bc9a4b8829f6a38cf4f"
    static let baseURL = "http://api.openweathermap.org/"
    
    static let Sydney = "4163971"
    static let Melbourne = "2147714"
    static let Brisbane = "2174003"
    
}

struct APIURL {
    
    static let openWeatherMapURL = URL(string: "\(Constants.baseURL)data/2.5/group?id=\(Constants.Sydney),\(Constants.Melbourne),\(Constants.Brisbane)&units=metric&APPID=\(Constants.APPID)")!
    
    static var webServiceURL: URL {
        return openWeatherMapURL
    }
}
