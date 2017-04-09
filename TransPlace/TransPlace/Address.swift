//
//  Address.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/9/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import Foundation


class Address {
    
    var city:String
    var number:String
    var additional:String
    var state:String
    var street:String
    var zipCode: String
    
    
    init(city:String, number:String, additional:String, state:String, street:String, zipCode:String) {
        self.city = city
        self.number = number
        self.additional = additional
        self.state = state
        self.street = street
        self.zipCode = zipCode
    }
    
}
