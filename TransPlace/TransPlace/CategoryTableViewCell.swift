//
//  CategoryTableViewCell.swift
//  TransPlace
//
//  Created by Junior Lima on 09/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit
import SwiftyStarRatingView
class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var starView: SwiftyStarRatingView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    
    @IBOutlet weak var streetNumber: UILabel!
    
    @IBOutlet weak var cidadeEstado: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        starView.maximumValue = 5
        starView.minimumValue = 0
        starView.value = 4
        starView.tintColor = #colorLiteral(red: 0.4970856905, green: 0.3023125529, blue: 0.9918896556, alpha: 1)
        starView.isEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
