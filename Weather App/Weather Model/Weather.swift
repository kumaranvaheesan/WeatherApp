//
//  File.swift
//  WeatherApp
//
//  Created by kumaran V on 06/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import Foundation
import ObjectMapper
class WeatherList: Mappable {
    var weatherArray: [Weather]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        weatherArray <- map["list"]
    }
}

class Weather: Mappable {
    
    var name: String?
    var temp: Double?
    var humidity: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Double?
    var weatherDescription: [WeatherDescription]?
    var visibility: Double?
    var sunrise: TimeInterval?
    var sunset: TimeInterval?

    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
        name <- map["name"]
        weatherDescription <- map["weather"]
        temp <- map["main.temp"]
        humidity <- map["main.humidity"]
        temp_min <- map["main.temp_min"]
        temp_max <- map["main.temp_max"]
        pressure <- map["main.pressure"]
        sunset <- map["sys.sunset"]
        sunrise <- map["sys.sunrise"]

    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.dateFormat = "HH:mm a"
        let dateString = dateFormatter.string(from:NSDate(timeIntervalSince1970: interval ) as Date)
       return dateString
        
    }
    
    func getSunsetTime() -> String {
        return stringFromTimeInterval(interval:self.sunset!) as String
           }
    
    func getSunriseTime() -> String {
        return stringFromTimeInterval(interval:self.sunrise!) as String
    }
}

class WeatherDescription: Mappable {
    var description: String?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
        description <- map["description"]
    }
    
}

