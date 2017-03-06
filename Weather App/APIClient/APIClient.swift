//
//  APIClient.swift
//  WeatherApp
//
//  Created by kumaran V on 06/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol WeatherGetterDelegate {
    func didreceiveWeather(weatherList: [Any])
    func didNotreceiveWeather(error: NSError)
}
class WeatherGetter
{
    init(delegate: WeatherGetterDelegate) {
        self.delegate = delegate
    }
    private var delegate: WeatherGetterDelegate

    func getWeatherFromOpenWeatherMap() {
        
        Alamofire.request(APIURL.webServiceURL).responseObject { (response: DataResponse<WeatherList>) in
            switch(response.result) {
            case .success(_):
                let weatherResponse = response.result.value
                print (weatherResponse ?? "NO value")
                if let weatherArray = weatherResponse?.weatherArray {
                    self.delegate.didreceiveWeather(weatherList: weatherArray)

                }

                break
                
            case .failure(_):
                self.delegate.didNotreceiveWeather(error: response.error as! NSError)
                
                break
                
            }
            
        }
    }
}
