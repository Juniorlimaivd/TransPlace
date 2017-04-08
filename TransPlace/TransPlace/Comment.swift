//
//  Comment.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/8/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

//MARK: Properties

class Comment {

    var userName: String
    var rating: Int
    var text: String
    var tags = [Bool!]()
    
    init?(userName: String, rating: Int, text: String, tags: [Bool]) {
        self.userName = userName
        self.rating = rating
        self.tags = tags
        self.text = text
    }

}
