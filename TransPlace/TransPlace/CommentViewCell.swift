//
//  CommentViewCell.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/8/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

class CommentViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rating: RatingControl!
    
    @IBOutlet weak var tag1: UILabel!
    
    @IBOutlet weak var tag2: UILabel!
    
    @IBOutlet weak var tag3: UILabel!
    
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var commentDate: UILabel!
    
    @IBOutlet weak var pin1Image: UIImageView!
    
    @IBOutlet weak var pin2Image: UIImageView!
    
    @IBOutlet weak var pin3Image: UIImageView!
    
    @IBOutlet weak var userIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let userImg = UIImage(named: "user")
        let userImgeChanged = userImg?.withRenderingMode(.alwaysTemplate)
        userIcon.image = userImgeChanged
        userIcon.tintColor = UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)
        
        let pinned = UIImage(named: "pinned")
        let pinnedChanged = pinned?.withRenderingMode(.alwaysTemplate)
        pin1Image.image = pinnedChanged
        pin1Image.tintColor = UIColor.black
        pin2Image.image = pinnedChanged
        pin2Image.tintColor = UIColor.black
        pin3Image.image = pinnedChanged
        pin3Image.tintColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
