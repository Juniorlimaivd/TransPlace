//
//  Place.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/9/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import Foundation


class Place {
    
    var name:String
    var address: Address
    var rating: Int
    var categories:[String]
    var imageAdress:String
    
    init(name: String, address: Address, rating: Int) {
        self.name = name
        self.address = address
        self.rating = rating
        self.categories = []
        self.imageAdress = ""
    }
    
    
}
