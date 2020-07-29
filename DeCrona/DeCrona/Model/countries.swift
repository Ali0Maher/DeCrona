//
//  countries.swift
//  DeCrona
//
//  Created by Ali Maher on 7/28/20.
//  Copyright © 2020 Ali Maher. All rights reserved.
//

import Foundation


struct countries : Codable{
    
    
    var country : String
    var cases : Int
    var todayCases : Int
    var deaths : Int
    var todayDeaths : Int
    var recovered : Int?
    
}
