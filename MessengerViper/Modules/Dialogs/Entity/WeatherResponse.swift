//
//  WeatherResponse.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

struct Sys: Codable {
    var message: Double
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct WeatherResponse: Codable {
    var id: Int
    var name: String
    var sys: Sys
}
