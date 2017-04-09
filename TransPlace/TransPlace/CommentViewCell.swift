//
//  CommentViewCell.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/8/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit
import SwiftyStarRatingView

class CommentViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stars: SwiftyStarRatingView!
    
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var commentDate: UILabel!
    

    
    @IBOutlet weak var userIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let userImg = UIImage(named: "user")
        let userImgeChanged = userImg?.withRenderingMode(.alwaysTemplate)
        userIcon.image = userImgeChanged
        userIcon.tintColor = UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)
        
        let pinned = UIImage(named: "pinned")
        let pinnedChanged = pinned?.withRenderingMode(.alwaysTemplate)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
